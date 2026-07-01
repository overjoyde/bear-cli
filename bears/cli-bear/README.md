# CLI-bear — CLI mascot (README)

This folder contains the CLI-bear mascot: a friendly teddy bear drawn in ASCII/ANSI art that holds a little terminal "belly". The bear script prints colored ASCII art intended for ANSI-capable terminals.

Files
- bear.sh — runnable script that prints the CLI-bear. Supports options.
- cli-bear_preview.svg — a small SVG preview of how the bear looks with a CRT-green glow.

Usage

1. Run locally (recommended)

```bash
chmod +x bear.sh
./bear.sh
```

2. Options

- --no-color  : Disable ANSI colors (prints plain ASCII).
- --prompt-text "TEXT" : Replace the prompt text inside the bear's terminal box.
- -h, --help  : Show brief help.

Examples

```bash
./bear.sh --no-color
./bear.sh --prompt-text "@Bear_cli:~$" 
```

Notes
- The script uses ANSI escape sequences for coloring. If your terminal doesn't support ANSI color, use --no-color.
- There's a render script at the repository root (scripts/render_png.py) that can render a PNG preview of the ASCII output.
