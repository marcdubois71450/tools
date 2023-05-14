## Parse oom-killer log

This command allows you to display which program is using which amount of RAM at the time of the KILL. Be careful if you have several oom stacktraces in your syslogs, it is necessarily added.


**Bash Version**

```
root@device:~# grep kernel /var/log/syslog | rev | cut -d"]" -f1 | rev | awk '{ print $3, $4, $5, $8 }' | grep '^[0-9].*[a-zA-Z][a-zA-Z]' | awk '{total_vm+=$1; rss+=$2; pgtables_bytes+=$3; db[$4]=db[$4]+$2;} END {for (name in db) printf("%.1fG %s\n",(db[name] * 4096)/(1024*1024*1024),name)}' | sort -g -r | head -n 10
8.1G mysql
5.2G php5.6
0.7G nothing-server
0.2G apache2
0.1G systemd-journal
0.1G python3.7
0.1G nginx
0.1G stats
0.0G php-login
0.0G python3
```

```
grep kernel /var/log/syslog | rev | cut -d"]" -f1 | rev | awk '{ print $3, $4, $5, $8 }' | grep '^[0-9].*[a-zA-Z][a-zA-Z]' | awk '{total_vm+=$1; rss+=$2; pgtables_bytes+=$3; db[$4]=db[$4]+$2;} END {for (name in db) printf("%.1fG %s\n",(db[name] * 4096)/(1024*1024*1024),name)}' | sort -g -r | head -n 10
```

**Perl Version**

```
root@device:~# grep kernel /var/log/syslog | rev | cut -d"]" -f1  | rev | awk '{ print $3, $4, $5, $8 }' | grep '^[0-9].*[a-zA-Z][a-zA-Z]' | perl -MData::Dumper -p -e 'BEGIN { $db = {}; } ($total_vm, $rss, $pgtables_bytes, $name) = split; $db->{$name}->{total_vm} += $total_vm; $db->{$name}->{rss} += $rss; $db->{$name}->{pgtables_bytes} += $pgtables_bytes; $_=undef; END { map { printf("%.1fG %s\n", ($db->{$_}->{rss} * 4096)/(1024*1024*1024), $_) } sort { $db->{$a}->{rss} <=> $db->{$b}->{rss} } keys %{$db}; }' | tail -n 10 | tac
8.1G mysql
5.2G php5.6
0.7G nothing-server
0.2G apache2
0.1G systemd-journal
0.1G python3.7
0.1G nginx
0.1G stats
0.0G php-login
0.0G python3
```

```
grep kernel /var/log/syslog | rev | cut -d"]" -f1  | rev | awk '{ print $3, $4, $5, $8 }' | grep '^[0-9].*[a-zA-Z][a-zA-Z]' | perl -MData::Dumper -p -e 'BEGIN { $db = {}; } ($total_vm, $rss, $pgtables_bytes, $name) = split; $db->{$name}->{total_vm} += $total_vm; $db->{$name}->{rss} += $rss; $db->{$name}->{pgtables_bytes} += $pgtables_bytes; $_=undef; END { map { printf("%.1fG %s\n", ($db->{$_}->{rss} * 4096)/(1024*1024*1024), $_) } sort { $db->{$a}->{rss} <=> $db->{$b}->{rss} } keys %{$db}; }' | tail -n 10 | tac
```


**Detail**

- `grep kernel syslog.log`: this command searches for all lines containing the word "kernel" in the syslog.log file.

- `rev`: reverses the contents of each line.

- `cut -d"]" -f1`: splits each line using the "]" character as a separator and returns the first part.

- `rev`: restores the original order of each row.

- `awk '{ print $3, $4, $5, $8 }'`: selects columns 3, 4, 5 and 8 of each row and displays them.

- `grep '^[0-9].*[a-zA-Z][a-zA-Z]'`: keeps only lines starting with a number followed by two alphabetic characters, which eliminates noise lines.

-  `awk '{total_vm+=$1; rss+=$2; pgtables_bytes+=$3; db[$4]=db[$4]+$2;} END {for (name in db) printf("%.1fG %s\n",(db[name] * 4096)/(1024*1024*1024),name)}'`: calculates process statistics, adding columns 1, 2, and 3 based on the process name (column 4). It then displays the process names with their total RSS memory consumption (in GB).

- `sort -g -r`: sorts the results in descending order.

- `head -n 10`: displays the first ten rows, which contain the most memory-intensive processes.

The Perl version is similar, but uses Data::Dumper to store the results in a hash table ($db) before sorting and displaying them.

---
