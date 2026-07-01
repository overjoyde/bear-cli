#!/usr/bin/env bash
# CLI-bear mascot — a teddy bear with a terminal "belly".
# Usage: ./bear.sh [--no-color] [--prompt-text "TEXT"]

NO_COLOR=0
PROMPT_TEXT="@Bear_cli:~$ █"

# Simple arg parsing
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --no-color)
      NO_COLOR=1; shift ;;
    --prompt-text)
      PROMPT_TEXT="$2"; shift 2 ;;
    -h|--help)
      cat <<'EOF'
Usage: bear.sh [--no-color] [--prompt-text "TEXT"]

Options:
  --no-color        Disable ANSI colors (print plain ASCII)
  --prompt-text TXT Replace the prompt text inside the bear's terminal box
  -h, --help        Show this help and exit
EOF
      exit 0 ;;
    *)
      echo "Unknown option: $1" >&2; exit 2 ;;
  esac
done

# Color codes
if [ "$NO_COLOR" -eq 1 ]; then
  G=''; B=''; R=''
else
  G='\033[2;32m'   # dim green (body)
  B='\033[1;92m'   # bright green (screen frame)
  R='\033[0m'      # reset
fi

# Print prompt line
printf "%b\n\n" "${B}${PROMPT_TEXT}${R}"

# The ASCII art — note use of doubled backslashes so the printed output keeps single backslashes
printf "%b\n" "${G}     .--.        .--.
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
      '--'      '--'${R}"

# Exit successfully
exit 0
