#!/bin/bash
# e.g. echo meow | copy
alias copy="if [ `command -v clip.exe` ]; then clip.exe; else xclip -selection clipboard; fi"
