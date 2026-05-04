# Thor CPU Profiles

CPU frequency profile script for AYN Thor.

This is NOT undervolting.
This script limits the maximum CPU frequency to reduce heat, fan noise, and battery usage.

---

## Features

- Multiple performance profiles
- Simple one command usage
- No permanent changes
- Displays current CPU limits after applying

---

## Requirements

- Root access required
- Terminal app or ADB shell

---

## Installation

1. Download thor_cpu_profiles.sh
2. Move it to your device (example: /sdcard/ or /data/local/tmp/)

Optional:
chmod +x thor_cpu_profiles.sh

---

## Usage

su
sh thor_cpu_profiles.sh balanced

Or in one line:

su -c "sh thor_cpu_profiles.sh balanced"

---

## Profiles

battery = Lowest power usage, best thermals  
balanced = Default recommended profile  
performance = Higher performance with mild limits  
restore = Attempts to return closer to stock limits  
current = Displays current CPU max frequencies  

---

## Examples

sh thor_cpu_profiles.sh battery  
sh thor_cpu_profiles.sh balanced  
sh thor_cpu_profiles.sh performance  
sh thor_cpu_profiles.sh restore  
sh thor_cpu_profiles.sh current  

---

## Important Notes

- Changes are temporary and reset after reboot
- Some firmware may override frequency limits
- Performance heavy tasks may require the performance profile
- This does not change voltage or true power tables

---

## Disclaimer

Use at your own risk.
This script writes to CPU frequency control nodes and may impact performance or stability.
No warranty is provided.

---

## Credits

Created for AYN Thor users looking for better thermal and battery control.