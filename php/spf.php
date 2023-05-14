<?php

// This code deserves to be fully tested and corrected based on the RFC.
// It allows to have the detail of an SPF record, to know with which level of the spf record passes.
// It would all work as you want in 95% of your cases.
// This code is used to check SPF.
// Total implementation in php.
// You can use it as you see fit.

function spf_check($sender, $helo, $domain, $ip) {
    function inet_to_bits($inet) {
        $splitted = str_split($inet);
        $binaryip = '';
        foreach ($splitted as $char) {
            $binaryip.= str_pad(decbin(ord($char)), 8, '0', STR_PAD_LEFT);
        }
        return $binaryip;
    }
    function ipv6_in_range($ip, $range_ip) {
        $cidrnet = $range_ip;
        $ip = inet_pton($ip);
        $binaryip = inet_to_bits($ip);
        list($net, $maskbits) = explode('/', $cidrnet);
        $net = inet_pton($net);
        $binarynet = inet_to_bits($net);
        $ip_net_bits = substr($binaryip, 0, $maskbits);
        $net_bits = substr($binarynet, 0, $maskbits);
        if ($ip_net_bits !== $net_bits) {
            return false;
        } else {
            return true;
        }
    }
    function ipv4_in_range($ip, $range) {
        list($range, $netmask) = explode('/', $range, 2);
        $x = explode('.', $range);
        while (count($x) < 4) {
            $x[] = '0';
        }
        list($a, $b, $c, $d) = $x;
        $range = sprintf("%u.%u.%u.%u", empty($a) ? '0' : $a, empty($b) ? '0' : $b, empty($c) ? '0' : $c, empty($d) ? '0' : $d);
        $range_dec = ip2long($range);
        $ip_dec = ip2long($ip);
        $wildcard_dec = pow(2, (32 - $netmask)) - 1;
        $netmask_dec = ~ $wildcard_dec;
        return (($ip_dec & $netmask_dec) == ($range_dec & $netmask_dec));
    }
    function ip_in_spf($record, $ip) {
        $l = explode(' ', $record);
        $pass = 'fail';
        foreach ($l as $element) {
            if (explode(":", $element) [0] == 'ip4' || explode(":", $element) [0] == 'ip6') {
                $ip_range = explode(":", $element, 2) [1];
                if (strpos($ip_range, '/') !== false) {
                    list($network, $mask) = explode("/", $ip_range);
                    if (explode(":", $element) [0] == 'ip4') {
                        if (ipv4_in_range($ip, $ip_range)) {
                            $pass = 'ip4:' . $ip_range;
                        }
                    } elseif (explode(":", $element) [0] == 'ip6') {
                        if (ipv6_in_range($ip, $ip_range)) {
                            $pass = 'ip6:' . $ip_range;
                        }
                    }
                } else {
                    if (explode(":", $element) [0] == 'ip4') {
                        if ($ip_range == $ip) {
                            $pass = 'ip4:' . $ip_range;
                        }
                    } elseif (explode(":", $element) [0] == 'ip6') {
                        if (inet_ntop(inet_pton($ip_range)) == inet_ntop(inet_pton($ip))) {
                            $pass = 'ip6:' . $ip_range;
                        }
                    }
                }
            }
        }
        if ($pass !== 'fail') {
            return $pass;
        } else {
            return false;
        }
    }
    function get_spf($domain, $domain_m, $ip) {
        $records = dns_get_record($domain, DNS_TXT | DNS_SOA);
        if (false === $records) {
            throw new DNSLookupException;
        }
        $spfRecords = array();
        foreach ($records as $record) {
            if ($record['type'] == 'TXT') {
                $txt = strtolower($record['txt']);
                if ($txt == 'v=spf1' || stripos($txt, 'v=spf1 ') === 0) {
                    $object = new \stdClass();
                    $object->domain = $domain;
                    if ($ip !== '' && $ip) {
                        $tmp = ip_in_spf($txt, $ip);
                        if ($tmp !== false) {
                            $object->valid = true;
                            $object->match_range = $tmp;
                        } else {
                            $object->valid = false;
                        }
                    }
                    $object->record = $txt;
                    $object->domain_master = $domain_m;
                    $spfRecords[] = $object;
                }
            }
        }
        return $spfRecords;
    }
    function parse_macro($domain, $ip, $sender, $helo) {
        if (str_contains($domain, '%{')) {
            for ($i = 1;$i <= substr_count($domain, '%{');$i++) {
                $start_at = strpos($domain, '%{');
                $stop_at = strpos($domain, '}');
                $before = explode("%{", $domain) [0];
                $after = explode("}", $domain) [1];
                $to_replace = substr($domain, $start_at + 2, $stop_at - 2);
                $new_str = '';
                switch ($to_replace) {
                    case 'i':
                        if ($ip !== '' && $ip) {
                            $new_str = $ip;
                        } else {
                            $new_str = '%{i}';
                        }
                    break;
                    case 'ir':
                        if ($ip !== '' && $ip) {
                            $new_str = join(".", array_reverse(explode(".", $ip)));
                        } else {
                            $new_str = '%{ir}';
                        }
                    break;
                    case 'l':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [0];
                        } else {
                            $new_str = '%{l}';
                        }
                    break;
                    case 'l-':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [0];
                            $new_str = str_replace('-', '.', $new_str);
                        } else {
                            $new_str = '%{l}';
                        }
                    break;
                    case 'lr':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [0];
                            $new_str = join(".", array_reverse(explode(".", $new_str)));
                        } else {
                            $new_str = '%{lr}';
                        }
                    break;
                    case 'lr-':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [0];
                            $new_str = str_replace('-', '.', $new_str);
                            $new_str = join(".", array_reverse(explode(".", $new_str)));
                        } else {
                            $new_str = '%{lr-}';
                        }
                    break;
                    case 'l1r-':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [0];
                            $new_str = str_replace('-', '.', $new_str);
                            $new_str = array_reverse(explode(".", $new_str)) [0];
                        } else {
                            $new_str = '%{l1r-}';
                        }
                    break;
                    case 'l1-':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [0];
                            $new_str = str_replace('-', '.', $new_str);
                            $new_str = explode(".", $new_str) [0];
                        } else {
                            $new_str = '%{l1-}';
                        }
                    break;
                    case 'l1':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [0];
                            $new_str = array_reverse(explode(".", $new_str)) [0];
                        } else {
                            $new_str = '%{l1}';
                        }
                    break;
                    case 'l1r':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [0];
                            $new_str = explode(".", $new_str) [0];
                        } else {
                            $new_str = '%{l1r}';
                        }
                    break;
                    case 'o':
                        if ($sender !== '' && $sender) {
                            $new_str = explode('@', $sender) [1];
                        } else {
                            $new_str = '%{o}';
                        }
                    break;
                    case 'or':
                        if ($sender !== '' && $sender) {
                            $new_str = join(".", array_reverse(explode(".", explode('@', $sender) [1])));
                        } else {
                            $new_str = '%{or}';
                        }
                    break;
                    case 'd':
                        $new_str = $domain;
                    break;
                    case 'dr':
                        $new_str = join(".", array_reverse(explode(".", $domain)));
                    break;
                    case 'd1':
                        $new_str = join(".", array_slice(explode(".", $domain), -1));
                    break;
                    case 'd1r':
                        $new_str = join(".", array_slice(array_reverse(explode(".", $domain)), -1));
                    break;
                    case 'd2':
                        $new_str = join(".", array_slice(explode(".", $domain), -2));
                    break;
                    case 'd2r':
                        $new_str = join(".", array_slice(array_reverse(explode(".", $domain)), -2));
                    break;
                    case 'd3':
                        $new_str = join(".", array_slice(explode(".", $domain), -3));
                    break;
                    case 'd3r':
                        $new_str = join(".", array_slice(array_reverse(explode(".", $domain)), -3));
                    break;
                    case 'd4':
                        $new_str = join(".", array_slice(explode(".", $domain), -3));
                    break;
                    case 'd4r':
                        $new_str = join(".", array_slice(array_reverse(explode(".", $domain)), -3));
                    break;
                    case 'v':
                        if ($ip !== '' && $ip) {
                            if (strpos($ip, ":") === false) {
                                $new_str = 'in-addr';
                            } else {
                                $new_str = 'ip6';
                            }
                        } else {
                            $new_str = '%{v}';
                        }
                    break;
                    case 'h':
                        if ($helo !== '' && $helo) {
                            $new_str = $helo;
                        } else {
                            $new_str = '%{h}';
                        }
                    break;
                }
                $domain = $before . $new_str . $after;
                if (str_ends_with($domain, '.')) {
                    $domain = substr($domain, 0, -1);
                }
            }
            return $domain;
        } else {
            return $domain;
        }
    }
    if (!str_contains($domain, ".")) {
        $object = new \stdClass();
        $object->error = "Invalid domain name";
        return json_encode($object);
    }
    $spf_pass = 'fail';
    $spfRecords = get_spf($domain, 'null', $ip);
    foreach ($spfRecords as $record) {
        $l = explode(' ', $record->record);
        foreach ($l as $element) {
            if (str_contains($element, "all")) {
                if ($element == "+all") {
                    $record->match_range = '+all (Pass)';
                    $record->valid = true;
                }
            }
        }
    }
    foreach ($spfRecords as $el) {
        if (isset($el->valid)) {
            if ($el->valid) {
                $spf_pass = 'ok';
            }
        }
    }
    if (count($spfRecords) == 0) {
        $object = new \stdClass();
        $object->error = "No SPF record for this domain : " . $domain;
        return json_encode($object);
    }
    function check_spf_level($r, $ip, $sender, $helo) {
        if (isset($r->record)) {
            $list = explode(" ", $r->record);
            $tmp_spf_records = array();
            $spf_pass = 'null';
            foreach ($list as $element) {
                if (explode(":", $element) [0] == 'include') {
                    $domain = explode(":", $element) [1];
                    $domain = parse_macro($domain, $ip, $sender, $helo);
                    $r_spf = get_spf($domain, $r->domain, $ip);
                    foreach ($r_spf as $el) {
                        if (isset($el->valid)) {
                            if ($el->valid) {
                                $spf_pass = 'ok';
                            }
                        }
                    }
                    $tmp_spf_records = array_merge($tmp_spf_records, $r_spf);
                }
                if (explode("=", $element) [0] == 'redirect') {
                    $domain = explode("=", $element) [1];
                    $domain = parse_macro($domain, $ip, $sender, $helo);
                    $r_spf = get_spf($domain, $r->domain, $ip);
                    foreach ($r_spf as $el) {
                        if (isset($el->valid)) {
                            if ($el->valid) {
                                $spf_pass = 'ok';
                            }
                        }
                    }
                    $tmp_spf_records = array_merge($tmp_spf_records, $r_spf);
                }
                if (explode(":", $element) [0] == 'exists') {
                    $domain = explode(":", $element) [1];
                    $domain = parse_macro($domain, $ip, $sender, $helo);
                    #
                    # $r_spf  = get_spf($domain, $r->domain, $ip);
                    $object = new \stdClass();
                    $object->domain = $domain;
                    if (checkdnsrr($domain, "A")) {
                        $object->valid = true;
                        $spf_pass = 'ok';
                        $object->match_range = $element;
                    } elseif (checkdnsrr($domain, "AAAA")) {
                        $object->valid = true;
                        $spf_pass = 'ok';
                        $object->match_range = $element;
                    } else {
                        $object->valid = false;
                    }
                    #$object->record        = $r->record;
                    $object->domain_master = $r->domain;
                    $__tmp[] = $object;
                    $tmp_spf_records = array_merge($tmp_spf_records, $__tmp);
                }
            }
            return array($tmp_spf_records, $spf_pass);
        } else {
            return array(array(), 'no');
        }
    }
    $spfRecords2 = array();
    foreach ($spfRecords as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords2 = array_merge($spfRecords2, $tmp_list[0]);
    }
    $spfRecords3 = array();
    foreach ($spfRecords2 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords3 = array_merge($spfRecords3, $tmp_list[0]);
    }
    $spfRecords4 = array();
    foreach ($spfRecords3 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords4 = array_merge($spfRecords4, $tmp_list[0]);
    }
    $spfRecords5 = array();
    foreach ($spfRecords4 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords5 = array_merge($spfRecords5, $tmp_list[0]);
    }
    $spfRecords6 = array();
    foreach ($spfRecords5 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords6 = array_merge($spfRecords6, $tmp_list[0]);
    }
    $spfRecords7 = array();
    foreach ($spfRecords6 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords7 = array_merge($spfRecords7, $tmp_list[0]);
    }
    $spfRecords8 = array();
    foreach ($spfRecords7 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords8 = array_merge($spfRecords8, $tmp_list[0]);
    }
    $spfRecords9 = array();
    foreach ($spfRecords8 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords9 = array_merge($spfRecords9, $tmp_list[0]);
    }
    $spfRecords10 = array();
    foreach ($spfRecords9 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords10 = array_merge($spfRecords10, $tmp_list[0]);
    }
    $spfRecords11 = array();
    foreach ($spfRecords10 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords11 = array_merge($spfRecords11, $tmp_list[0]);
    }
    $spfRecords12 = array();
    foreach ($spfRecords11 as $r) {
        $tmp_list = check_spf_level($r, $ip, $sender, $helo);
        if ($tmp_list[1] == 'ok') {
            $spf_pass = 'ok';
        }
        $spfRecords12 = array_merge($spfRecords12, $tmp_list[0]);
    }
    $spfRecords = array_merge($spfRecords, $spfRecords2);
    $spfRecords = array_merge($spfRecords, $spfRecords3);
    $spfRecords = array_merge($spfRecords, $spfRecords4);
    $spfRecords = array_merge($spfRecords, $spfRecords5);
    $spfRecords = array_merge($spfRecords, $spfRecords6);
    $spfRecords = array_merge($spfRecords, $spfRecords7);
    $spfRecords = array_merge($spfRecords, $spfRecords8);
    $spfRecords = array_merge($spfRecords, $spfRecords9);
    $spfRecords = array_merge($spfRecords, $spfRecords10);
    $spfRecords = array_merge($spfRecords, $spfRecords11);
    $spfRecords = array_merge($spfRecords, $spfRecords12);
    $reponse = new \stdClass();
    foreach ($spfRecords as $r) {
        if ($r->domain_master == "null") {
            $reponse = $r;
        }
    }
    if ($ip !== '' && $ip) {
        $reponse->spf_pass = $spf_pass;
        $reponse->ip = $ip;
    }
    $reponse->sub = array();
    foreach ($spfRecords as $r) {
        if ($r->domain_master == $reponse->domain) {
            $r->sub = array();
            $reponse->sub = array_merge($reponse->sub, array($r));
        }
    }
    foreach ($reponse->sub as $sub0) {
        foreach ($spfRecords as $r) {
            if ($sub0->domain == $r->domain_master) {
                $r->sub = array();
                $sub0->sub = array_merge($sub0->sub, array($r));
            }
        }
        foreach ($sub0->sub as $sub1) {
            foreach ($spfRecords as $r) {
                if ($sub1->domain == $r->domain_master) {
                    $r->sub = array();
                    $sub1->sub = array_merge($sub1->sub, array($r));
                }
            }
            foreach ($sub1->sub as $sub2) {
                foreach ($spfRecords as $r) {
                    if ($sub2->domain == $r->domain_master) {
                        $r->sub = array();
                        $sub2->sub = array_merge($sub2->sub, array($r));
                    }
                }
                foreach ($sub2->sub as $sub3) {
                    foreach ($spfRecords as $r) {
                        if ($sub3->domain == $r->domain_master) {
                            $r->sub = array();
                            $sub3->sub = array_merge($sub3->sub, array($r));
                        }
                    }
                    foreach ($sub3->sub as $sub4) {
                        foreach ($spfRecords as $r) {
                            if ($sub4->domain == $r->domain_master) {
                                $r->sub = array();
                                $sub4->sub = array_merge($sub4->sub, array($r));
                            }
                        }
                        foreach ($sub4->sub as $sub5) {
                            foreach ($spfRecords as $r) {
                                if ($sub5->domain == $r->domain_master) {
                                    $r->sub = array();
                                    $sub5->sub = array_merge($sub5->sub, array($r));
                                }
                            }
                            foreach ($sub5->sub as $sub6) {
                                foreach ($spfRecords as $r) {
                                    if ($sub6->domain == $r->domain_master) {
                                        $r->sub = array();
                                        $sub6->sub = array_merge($sub6->sub, array($r));
                                    }
                                }
                                foreach ($sub6->sub as $sub7) {
                                    foreach ($spfRecords as $r) {
                                        if ($sub7->domain == $r->domain_master) {
                                            $r->sub = array();
                                            $sub7->sub = array_merge($sub7->sub, array($r));
                                        }
                                    }
                                    foreach ($sub7->sub as $sub8) {
                                        foreach ($spfRecords as $r) {
                                            if ($sub8->domain == $r->domain_master) {
                                                $r->sub = array();
                                                $sub8->sub = array_merge($sub8->sub, array($r));
                                            }
                                        }
                                        foreach ($sub8->sub as $sub9) {
                                            foreach ($spfRecords as $r) {
                                                if ($sub9->domain == $r->domain_master) {
                                                    $r->sub = array();
                                                    $sub9->sub = array_merge($sub9->sub, array($r));
                                                }
                                            }
                                            foreach ($sub9->sub as $sub) {
                                                foreach ($spfRecords as $r) {
                                                    if ($sub->domain == $r->domain_master) {
                                                        $r->sub = array();
                                                        $sub->sub = array_merge($sub->sub, array($r));
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    unset($reponse->domain_master);
    return $reponse;
}

// Test
$sender = "noreply@mondialrelay.fr";
$helo = "ip10.tpm02.net";
$domain = "mondialrelay.fr";
$ip = "109.197.246.204";
$result = spf_check($sender, $helo, $domain, $ip);
print_r($result);

// stdClass Object
// (
//     [domain] => mondialrelay.fr
//     [valid] =>
//     [record] => v=spf1 include:spf.protection.outlook.com include:protecmail.mondialrelay.fr include:spf.tipimail.com include:info.mondialrelay.fr ip4:185.7.39.6 ip4:185.7.39.7 include:mailgun.org include:amazonses.com -all
//     [spf_pass] => ok
//     [ip] => 109.197.246.204
//     [sub] => Array
//         (
//             [0] => stdClass Object
//                 (
//                     [domain] => spf.protection.outlook.com
//                     [valid] =>
//                     [record] => v=spf1 ip4:40.92.0.0/15 ip4:40.107.0.0/16 ip4:52.100.0.0/14 ip4:104.47.0.0/17 ip6:2a01:111:f400::/48 ip6:2a01:111:f403::/49 ip6:2a01:111:f403:8000::/50 ip6:2a01:111:f403:c000::/51 ip6:2a01:111:f403:f000::/52 -all
//                     [domain_master] => mondialrelay.fr
//                     [sub] => Array
//                         (
//                         )
//
//                 )
//
//             [1] => stdClass Object
//                 (
//                     [domain] => protecmail.mondialrelay.fr
//                     [valid] =>
//                     [record] => v=spf1 include:spf.protection.outlook.com include:spf.sendinblue.com ip4:185.7.39.6 ip4:185.7.39.7 -all
//                     [domain_master] => mondialrelay.fr
//                     [sub] => Array
//                         (
//                             [0] => stdClass Object
//                                 (
//                                     [domain] => spf.protection.outlook.com
//                                     [valid] =>
//                                     [record] => v=spf1 ip4:40.92.0.0/15 ip4:40.107.0.0/16 ip4:52.100.0.0/14 ip4:104.47.0.0/17 ip6:2a01:111:f400::/48 ip6:2a01:111:f403::/49 ip6:2a01:111:f403:8000::/50 ip6:2a01:111:f403:c000::/51 ip6:2a01:111:f403:f000::/52 -all
//                                     [domain_master] => protecmail.mondialrelay.fr
//                                     [sub] => Array
//                                         (
//                                         )
//
//                                 )
//
//                             [1] => stdClass Object
//                                 (
//                                     [domain] => spf.sendinblue.com
//                                     [valid] =>
//                                     [record] => v=spf1 ip4:185.41.28.0/22 ip4:94.143.16.0/21 ip4:185.24.144.0/22 ip4:153.92.224.0/19 ip4:213.32.128.0/18 ip4:185.107.232.0/22 ip4:77.32.128.0/18 ip4:77.32.192.0/19 ip4:212.146.192.0/18 ip4:172.246.0.0/18 -all
//                                     [domain_master] => protecmail.mondialrelay.fr
//                                     [sub] => Array
//                                         (
//                                         )
//
//                                 )
//
//                         )
//
//                 )
//
//             [2] => stdClass Object
//                 (
//                     [domain] => spf.tipimail.com
//                     [valid] => 1
//                     [match_range] => ip4:109.197.246.192/27
//                     [record] => v=spf1 ip4:81.93.29.64/28 ip4:109.197.246.192/27 ~all
//                     [domain_master] => mondialrelay.fr
//                     [sub] => Array
//                         (
//                         )
//
//                 )
//
//             [3] => stdClass Object
//                 (
//                     [domain] => info.mondialrelay.fr
//                     [valid] =>
//                     [record] => v=spf1 include:spf.protection.outlook.com -all
//                     [domain_master] => mondialrelay.fr
//                     [sub] => Array
//                         (
//                             [0] => stdClass Object
//                                 (
//                                     [domain] => spf.protection.outlook.com
//                                     [valid] =>
//                                     [record] => v=spf1 ip4:40.92.0.0/15 ip4:40.107.0.0/16 ip4:52.100.0.0/14 ip4:104.47.0.0/17 ip6:2a01:111:f400::/48 ip6:2a01:111:f403::/49 ip6:2a01:111:f403:8000::/50 ip6:2a01:111:f403:c000::/51 ip6:2a01:111:f403:f000::/52 -all
//                                     [domain_master] => info.mondialrelay.fr
//                                     [sub] => Array
//                                         (
//                                         )
//
//                                 )
//
//                         )
//
//                 )
//
//             [4] => stdClass Object
//                 (
//                     [domain] => mailgun.org
//                     [valid] =>
//                     [record] => v=spf1 include:_spf.mailgun.org include:_spf.eu.mailgun.org -all
//                     [domain_master] => mondialrelay.fr
//                     [sub] => Array
//                         (
//                             [0] => stdClass Object
//                                 (
//                                     [domain] => _spf.mailgun.org
//                                     [valid] =>
//                                     [record] => v=spf1 ip4:209.61.151.0/24 ip4:166.78.68.0/22 ip4:198.61.254.0/23 ip4:192.237.158.0/23 ip4:23.253.182.0/23 ip4:104.130.96.0/28 ip4:146.20.113.0/24 ip4:146.20.191.0/24 ip4:159.135.224.0/20 ip4:69.72.32.0/20 ip4:104.130.122.0/23 ip4:146.20.112.0/26 ip4:161.38.192.0/20 ip4:143.55.224.0/21 ip4:143.55.232.0/22 ip4:159.112.240.0/20 ip4:198.244.48.0/20 ~all
//                                     [domain_master] => mailgun.org
//                                     [sub] => Array
//                                         (
//                                         )
//
//                                 )
//
//                             [1] => stdClass Object
//                                 (
//                                     [domain] => _spf.eu.mailgun.org
//                                     [valid] =>
//                                     [record] => v=spf1 ip4:141.193.32.0/23 ip4:159.135.140.80/29 ip4:159.135.132.128/25 ip4:161.38.204.0/22 ip4:87.253.232.0/21 ip4:185.189.236.0/22 ip4:185.211.120.0/22 ip4:185.250.236.0/22 ip4:143.55.236.0/22 ip4:198.244.60.0/22 ~all
//                                     [domain_master] => mailgun.org
//                                     [sub] => Array
//                                         (
//                                         )
//
//                                 )
//
//                         )
//
//                 )
//
//             [5] => stdClass Object
//                 (
//                     [domain] => amazonses.com
//                     [valid] =>
//                     [record] => v=spf1 ip4:199.255.192.0/22 ip4:199.127.232.0/22 ip4:54.240.0.0/18 ip4:69.169.224.0/20 ip4:23.249.208.0/20 ip4:23.251.224.0/19 ip4:76.223.176.0/20 ip4:54.240.64.0/19 ip4:54.240.96.0/19 ip4:52.82.172.0/22 ip4:76.223.128.0/19 -all
//                     [domain_master] => mondialrelay.fr
//                     [sub] => Array
//                         (
//                         )
//
//                 )
//
//         )
//
// )

?>
