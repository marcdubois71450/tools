#!/usr/bin/env python3
"""
This script can convert audio to AC3 via ffmpeg from any video file. (My LG OLED C1 TV does not accept DTS unfortunately)

List Audio/subtitle track:
python3 allAudioToAC3.py scan -i /root/myfile.mkv

Convert all Audio track to AC3:
python3 allAudioToAC3.py convert -i /root/input.mkv -o /root/output.mkv

Or convert all Audio track to AC3 and remove input file:
python3 allAudioToAC3.py convert -i /root/input.mkv -o /root/output.mkv -r
"""

import os
import sys
import json
import subprocess
from argparse import ArgumentParser

cli = ArgumentParser()
subparsers = cli.add_subparsers(dest="subcommand")

def argument(*name_or_flags, **kwargs):
    """Properly format arguments to pass to the subcommand decorator"""
    if "default" in kwargs and "help" in kwargs:
        kwargs["help"] += " (default: {[default]})".format(kwargs)
    return (list(name_or_flags), kwargs)

def subcommand(args=[], parent=subparsers):
    """Decorator to define a new subcommand in a sanity-preserving way."""
    def decorator(func):
        name = func.__name__
        if name.endswith("_"):
            name = name[:-1]
        parser = parent.add_parser(name, description=func.__doc__)
        for arg in args:
            parser.add_argument(*arg[0], **arg[1])
        parser.set_defaults(func=func)
    return decorator

@subcommand([
    argument("-i", "--input", required=True, help="Input file")])
def scan(args):
    """Scan/Display all audio and subtitle"""
    audio_flag = False
    ffprobe_cmd = "ffprobe -hide_banner -show_streams -print_format json " + args.input
    process = subprocess.Popen(ffprobe_cmd,stdout=subprocess.PIPE,stderr=subprocess.PIPE, shell=True).communicate()
    output = json.loads(process[0])

    for stream in output["streams"]:
        if stream['codec_type'] == 'audio':
            audio_flag = True
            break;

    if audio_flag:
        print("audio present in the file")
    else:
        print("audio not present in the file")
        sys.exit(1)

    for stream in output["streams"]:
        if stream['codec_type'] == 'audio':
            print('--------------------------')
            print('AUDIO: Codec Format :', stream['codec_long_name'], stream['codec_name'])
            try:
                print('AUDIO: Language :', stream['tags']['language'])
            except:
                pass
            print('AUDIO: Piste index :', stream['index'])

        if stream['codec_type'] == 'subtitle':
            print('--------------------------')
            print('SUBTITLE: Codec Format :', stream['codec_long_name'], stream['codec_name'])
            try:
                print('SUBTITLE: Language :', stream['tags']['language'])
            except:
                pass
            print('SUBTITLE: Piste index :', stream['index'])

@subcommand([
    argument("-i", "--input", required=True, help="Input file"),
    argument("-o", "--output", required=True, help="Output File"),
    argument("-r", "--remove", action='store_true', help="Remove Input file")])
def convert(args):
    """Convert all audio to AC3"""
    audio_flag = False
    ffprobe_cmd = "ffprobe -hide_banner -show_streams -print_format json " + args.input
    process = subprocess.Popen(ffprobe_cmd,stdout=subprocess.PIPE,stderr=subprocess.PIPE, shell=True).communicate()
    output = json.loads(process[0])

    for stream in output["streams"]:
        if stream['codec_type'] == 'audio':
            audio_flag = True
            break;

    if audio_flag:
        print("audio present in the file")
    else:
        print("audio not present in the file")
        sys.exit(1)

    pistes = []
    i = 0
    subtitle = ""
    for stream in output["streams"]:
        if stream['codec_type'] == 'audio':
            print('--------------------------')
            print('AUDIO: Codec Format :', stream['codec_long_name'], stream['codec_name'])
            try:
                print('AUDIO: Language :', stream['tags']['language'])
            except:
                pass
            print('AUDIO: Piste index :', stream['index'])
            pistes.append('-c:a:{} ac3'.format(i))
            i = i + 1

        if stream['codec_type'] == 'subtitle':
            print('--------------------------')
            print('SUBTITLE: Codec Format :', stream['codec_long_name'], stream['codec_name'])
            try:
                print('SUBTITLE: Language :', stream['tags']['language'])
            except:
                pass
            print('SUBTITLE: Piste index :', stream['index'])
            subtitle = " -c:s copy"


    audio = ' '.join(pistes)
    cmd = "ffmpeg -i {} -map 0 -c:v copy {}{} {}".format(args.input, audio, subtitle, args.output)
    print(cmd)
    os.system(cmd)

    if args.remove:
        print('Remove Input file:', args.input)
        os.remove(args.input)


if __name__ == "__main__":
    args = cli.parse_args()
    if args.subcommand is None:
        cli.print_help()
        sys.exit()

    args.func(args)
