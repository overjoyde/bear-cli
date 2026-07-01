#!/usr/bin/env python3
# Render a PNG preview of an ASCII/ANSI file using Pillow.
# Usage: python3 scripts/render_png.py path/to/bear.sh out.png

import sys, re
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont, ImageFilter

if len(sys.argv) < 3:
    print("Usage: render_png.py <ascii-file> <out.png>")
    sys.exit(2)

p = Path(sys.argv[1])
if not p.exists():
    print("File not found:", p)
    sys.exit(1)

s = p.read_text()
# decode simple escape sequences like \033
try:
    interpreted = s.encode('utf-8').decode('unicode_escape')
except Exception:
    interpreted = s

# Remove ANSI codes for rendering
clean = re.sub(r'\x1B\[[0-9;]*[A-Za-z]', '', interpreted)
lines = clean.splitlines()

# Load font
try:
    font = ImageFont.truetype("DejaVuSansMono.ttf", 20)
except Exception:
    font = ImageFont.load_default()

# Measure
maxw = max((font.getsize(line)[0] for line in lines), default=0)
line_h = font.getsize("A")[1]
padding = 24
img_w = maxw + padding*2
img_h = line_h * len(lines) + padding*2

# Base
base = Image.new('RGB', (img_w, img_h), (0,0,0))

# Glow layer
glow = Image.new('RGB', (img_w, img_h), (0,0,0))
draw_glow = ImageDraw.Draw(glow)
draw_glow.multiline_text((padding,padding), clean, font=font, fill=(0,255,0))

glow_blurred = glow.filter(ImageFilter.GaussianBlur(radius=6))
composite = Image.alpha_composite(base.convert('RGBA'), glow_blurred.convert('RGBA'))

draw = ImageDraw.Draw(composite)
draw.multiline_text((padding,padding), clean, font=font, fill=(120,255,120))

out = sys.argv[2]
composite.convert('RGB').save(out)
print('Saved', out)
