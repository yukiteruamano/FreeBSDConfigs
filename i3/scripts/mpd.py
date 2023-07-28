#!/usr/bin/env python3.9
# -*- coding: utf-8 -*-

# This script is a simple wrapper which prefixes each i3status line with custom
# information. It is a python reimplementation of:
# http://code.stapelberg.de/git/i3status/tree/contrib/wrapper.pl
#
# To use it, ensure your ~/.i3status.conf contains this line:
#     output_format = "i3bar"
# in the 'general' section.
# Then, in your ~/.i3/config, use:
#     status_command i3status | ~/i3status/contrib/wrapper.py
# In the 'bar' section.
#
# In its current version it will display the cpu frequency governor, but you
# are free to change it to display whatever you like, see the comment in the
# source code below.
#
# © 2012 Valentin Haenel <valentin.haenel@gmx.de>
#
# This program is free software. It comes without any warranty, to the extent
# permitted by applicable law. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License (WTFPL), Version
# 2, as published by Sam Hocevar. See http://sam.zoy.org/wtfpl/COPYING for more
# details.

import sys
import json
import subprocess


def print_line(message):
    """Non-buffered printing to stdout."""
    sys.stdout.write(message + "\n")
    sys.stdout.flush()


def read_line():
    """Interrupted respecting reader for stdin."""
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()


def get_mpd_info():
    color = "#FFFFFF"
    try:
        output = subprocess.check_output("mpc -f '%artist%:::%title%'", shell=True)
        try:
            line, line2 = output.splitlines()[:2]
        except ValueError:
            # MPD Up, but stoppedi(others?):
            return color, "Nothing Playing!"
        state = ""

        try:
            artist, title, album = line.split(":::")
            state = line2.split(" ")[0]
            if "playing" in state:
                # color = "#FF00FF" #pink
                color = "#00FF00"
            else:
                color = "#FFFFFF"
        except ValueError:
            # MPD Up, but stopped:
            return color, "Nothing Playing!"
        # Everything Good:
        return color, state + " " + artist + " - " + title
    except subprocess.CalledProcessError:
        # MPD Down:
        return color, "MPD is Down!"


if __name__ == "__main__":
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    # get some output:
    # fout = open("/home/bob/i3status.log","w")

    while True:
        line, prefix = read_line(), ""
        # ignore comma at start of lines
        if line.startswith(","):
            line, prefix = line[1:], ","

        j = json.loads(line)
        # fout.write(line)
        # insert information into the start of the json, but could be anywhere
        # CHANGE THIS LINE TO INSERT SOMETHING ELSE
        # j.insert(0, {'full_text' : '%s' % get_governor(), 'name' : 'gov'})
        color, s = get_mpd_info()
        j.insert(0, {"full_text": "%s" % s, "color": "%s" % color, "name": "gov"})
        # and echo back new encoded json
        print_line(prefix + json.dumps(j))

    # fout.close()
