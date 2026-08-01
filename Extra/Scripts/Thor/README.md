# Thor CPU Profiles

> [!WARNING]
>
> ## Deprecated
>
> This project is no longer maintained.
>
> Use [ClusterTune](https://github.com/AurelioB/ClusterTune) instead.

CPU frequency profile scripts for the AYN Thor.

This is **not undervolting**. These scripts limit the maximum CPU frequency to reduce heat, fan noise, and battery usage.

---

## Features

* One file per profile for simple execution
* Snapshot system for accurate restoration
* Automatic snapshot on first run
* Restores the device's original CPU limits
* No permanent system modifications
* Works with the Thor's built-in root script runner

---

## Requirements

* A rooted AYN Thor
* Root access must be properly enabled

The Thor's **Run script as Root** option does not root the device. It only provides an easy way to run scripts with root permissions on a device that is already rooted.

---

## Thor Native Method

The Thor includes a built-in script runner.

Go to:

```text
Settings > Thor Settings > Run script as Root
```

From there, select and run any of the script files directly.

This is the easiest way to use the profiles without opening a terminal.

---

## Installation

1. Download all script files.
2. Place them in an accessible location, such as:

```text
/sdcard/
```

or:

```text
/data/local/tmp/
```

Optionally, make the scripts executable:

```sh
chmod +x *.sh
```

---

## Usage

### Using Thor Settings

Go to:

```text
Settings > Thor Settings > Run script as Root
```

Select the script you want to run.

### Using a Terminal

```sh
su
sh thor_balanced.sh
```

Or:

```sh
su -c "sh thor_balanced.sh"
```

---

## Script Files

| Script                | Purpose                                                  |
| --------------------- | -------------------------------------------------------- |
| `thor_snapshot.sh`    | Saves the current CPU frequency limits                   |
| `thor_battery.sh`     | Lowest power usage and best thermals                     |
| `thor_balanced.sh`    | Default recommended profile                              |
| `thor_performance.sh` | Higher performance with mild limits                      |
| `thor_restore.sh`     | Restores CPU limits from the saved snapshot              |
| `thor_current.sh`     | Displays the current minimum and maximum CPU frequencies |

---

## Snapshot System

A snapshot is automatically created the first time a profile is applied.

The snapshot is stored at:

```text
/data/local/tmp/thor_cpu_profiles/snapshot.env
```

The restore script uses this snapshot to return the CPU frequency limits to the device-specific values that were active before a profile was applied.

This helps maintain compatibility across firmware updates and different Thor units.

---

## Examples

```sh
sh thor_snapshot.sh
sh thor_battery.sh
sh thor_balanced.sh
sh thor_performance.sh
sh thor_restore.sh
sh thor_current.sh
```

---

## Important Notes

* Changes are temporary and normally reset after reboot.
* Some firmware versions may override CPU frequency limits.
* Performance-heavy applications may require the performance profile.
* The snapshot system helps restore the correct limits across firmware versions and different units.
* These scripts do not change voltage or the device's actual power tables.
* The scripts will not work on an unrooted device, even though the Thor includes a **Run script as Root** option.

---

## Disclaimer

Use these scripts at your own risk.

The scripts write to CPU frequency control nodes and may affect performance, stability, temperatures, or battery life. No warranty or support is provided.

---

## Credits

Created for AYN Thor users looking for improved thermal and battery control.
