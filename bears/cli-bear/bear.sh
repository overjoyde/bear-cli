#!/usr/bin/env bash
# CLI-bear mascot — a teddy bear with a terminal "belly".
# Color codes: G = dim green (body), B = bright green (screen frame), R = reset.

G='\033[2;32m'; B='\033[1;92m'; R='\033[0m'

printf "${B}@Bear_cli:~\$ █${R}\n\n"

printf "${G}     .--.        .--.
    /    \\\\______/    \\\
     |  o        o  |
      \\\\    ____    /
       '. (____) .'
       .-'      '-.
_.-'                 '-._
|   ${B}.---------------.${G}   |
|   ${B}| ${R}user@bear:~\$${B}  |${G}   |
|   ${B}|               |${G}   |
|   ${B}| ${R}\$ whoami${B}      |${G}   |
|   ${B}| ${R}bear${B}          |${G}   |
|   ${B}| ${R}\$ ls skills/${B}  |${G}   |
|   ${B}| ${R}coffee  naps${B}  |${G}   |
|   ${B}| ${R}\$ █${B}           |${G}   |
|   ${B}'---------------'${G}   |
'-----------------------'
      |  |      |  |
      '--'      '--'${R}\n"

# Notes on the escaping (this is what makes it work):
#
# \\\\ → prints a single literal \ (backslash on the bear's arms/ears). It's doubled twice because both the shell string and printf each consume one level.
# \$ → prints a literal $ (so $ in the prompt isn't treated as a shell variable).
# ${G} / ${B} / ${R} → the color variables get substituted, wrapping the art instead of sitting inside it — the bug in your original.
# The color of any line "sticks" until the next code, so ${B}...${G} colors just the screen frame and returns the body to dim green.
