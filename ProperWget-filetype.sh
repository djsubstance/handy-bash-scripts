#!/bin/bash

# Filename: ProperWget-filetype.sh
# No Prereqs - Will wet for certain type file(s) only
# Should bypass capcha and JS checkers

# Example - Downlaod only MP3 / FLAC
oneGet() (wget -r -l1 -H -t1 -nd -N -np -A.mp3,.flac --user-agent 'mozilla' -erobots=off https://$1)

# Example - Downlaod only JS / MAP 
oneGet() (wget -r -l1 -H -t1 -nd -N -np -A.js,.map --user-agent 'mozilla' -erobots=off https://$1)

# Explanation:
# -r: Recursive download.
# -l1: Level of recursion (1 means only files directly linked from the initial URL).
# -H: Span hosts (enables downloading from different hosts/domains).
# -t1: Number of retries (set to 1 here).
# -nd: No directories (downloads all files to the current directory).
# -N: Timestamp checking (only download newer files than what's on disk).
# -np: No parent (don't ascend to the parent directory).
# -A.mp3,.flac: Accept list (comma-separated list of accepted extensions).
# -erobots=off: Ignore robots.txt file which might prevent web scraping.
# [URL]: The URL of the website or directory you want to download from.


