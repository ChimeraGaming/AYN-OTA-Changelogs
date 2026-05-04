# Thor CPU Profiles

CPU frequency profile script for AYN Thor.

This is NOT undervolting.  
This script limits the maximum CPU frequency to reduce heat, fan noise, and battery usage.

---

## Features

- Multiple performance profiles
- Snapshot system for accurate restore
- Automatic snapshot on first run
- Restore to true device defaults
- Displays current CPU limits after applying
- No permanent system modifications

---

## Requirements

- Root access required
- Terminal app or ADB shell

---

## Installation

1. Download `thor_cpu_profiles.sh`
2. Move it to your device (example: `/sdcard/` or `/data/local/tmp/`)

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
restore = Restores saved CPU limits from snapshot  
snapshot = Saves current CPU limits  
current = Displays current CPU max and min frequencies  

---

## Examples

sh thor_cpu_profiles.sh snapshot  
sh thor_cpu_profiles.sh battery  
sh thor_cpu_profiles.sh balanced  
sh thor_cpu_profiles.sh performance  
sh thor_cpu_profiles.sh restore  
sh thor_cpu_profiles.sh current  

---

## Snapshot System

- A snapshot is automatically created on first profile use
- Snapshot is stored at:

/data/local/tmp/thor_cpu_profiles/snapshot.env

- Restore uses this snapshot for accurate values per device

---

## Important Notes

- Changes are temporary and reset after reboot
- Some firmware may override frequency limits
- Performance heavy tasks may require the performance profile
- Snapshot ensures restore works correctly across updates
- This does not change voltage or true power tables

---

## Disclaimer

Use at your own risk.  
This script writes to CPU frequency control nodes and may impact performance or stability.  
No warranty is provided.

---

## Credits

Created for AYN Thor users looking for better thermal and battery control.