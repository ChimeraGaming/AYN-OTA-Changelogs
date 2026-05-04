# Thor CPU Profiles

CPU frequency profile scripts for AYN Thor.

This is NOT undervolting.  
These scripts limit the maximum CPU frequency to reduce heat, fan noise, and battery usage.

---

## Features

- One file per profile for simple execution
- Snapshot system for accurate restore
- Automatic snapshot on first run
- Restore to true device defaults
- No permanent system modifications
- Works directly with Thor built in root script runner

---

## Requirements

- Root access required
- AYN Thor device

---

## Thor Native Method (Recommended)

Thor includes a built in script runner.

Go to:

Settings > Thor settings > Run script as Root

From there you can select and run any of the script files directly.

This is the easiest way to use these profiles without needing a terminal.

---

## Installation

1. Download all script files
2. Place them in an accessible location such as:

/sdcard/  
or  
/data/local/tmp/

Optional but recommended:

chmod +x *.sh

---

## Usage

### Using Thor Settings

Settings > Thor settings > Run script as Root  
Select the script you want to run

---

### Using Terminal

su  
sh thor_balanced.sh  

Or:

su -c "sh thor_balanced.sh"

---

## Script Files

thor_snapshot.sh = Saves current CPU limits  
thor_battery.sh = Lowest power usage, best thermals  
thor_balanced.sh = Default recommended profile  
thor_performance.sh = Higher performance with mild limits  
thor_restore.sh = Restores saved CPU limits from snapshot  
thor_current.sh = Displays current CPU max and min frequencies  

---

## Snapshot System

- A snapshot is automatically created the first time you run a profile
- Snapshot is stored at:

/data/local/tmp/thor_cpu_profiles/snapshot.env

- Restore uses this snapshot to return to your device specific defaults
- This ensures compatibility across updates and different Thor units

---

## Examples

sh thor_snapshot.sh  
sh thor_battery.sh  
sh thor_balanced.sh  
sh thor_performance.sh  
sh thor_restore.sh  
sh thor_current.sh  

---

## Important Notes

- Changes are temporary and reset after reboot
- Some firmware may override frequency limits
- Performance heavy tasks may require the performance script
- Snapshot ensures restore works correctly across updates
- This does not change voltage or true power tables

---

## Disclaimer

Use at your own risk.  
These scripts write to CPU frequency control nodes and may impact performance or stability.  
No warranty is provided.
Will not work if not rooted (despite being able to run script as root - thats just for easy applying)

---

## Credits

Created for AYN Thor users looking for better thermal and battery control.