#!/usr/bin/env bash
# Karate-bear: sample bear with "hi-ya" text
G='\033[2;32m'; B='\033[1;92m'; R='\033[0m'

printf "%b\n\n" "${B}@Karate_bear:~$ ▮${R}"

printf "%b\n" "${G}     /^--^\\
    / 0  0 \\\
   V\  Y  /V
     / - \\
    |    \\
    || (__)

   .---------------.
  |  Hi-ya!       |
   '---------------'${R}"

exit 0
