#!/bin/bash
alias copy="if [ `command -v clip.exe` ]; then clip.exe; else xclip -selection clipboard; fi"
