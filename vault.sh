#!/bin/bash

genkey() {
  entropy="${1:-1024}"
  openssl rand $entropy
}

encrypt() {
  vault="$1"
  key="$2"
  openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 100000 -salt -in $vault -pass file:$key
}

decrypt() {
  vault="$1"
  key="$2"
  openssl enc -d -aes-256-cbc -md sha512 -pbkdf2 -iter 100000 -salt -in $vault -pass file:$key
}

"$@"
