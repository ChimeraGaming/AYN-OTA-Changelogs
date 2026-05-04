#!/system/bin/sh
# Thor Restore Profile
# Restores saved CPU limits from snapshot
# Root required

BASE="/sys/devices/system/cpu/cpufreq"
SNAP_FILE="/data/local/tmp/thor_cpu_profiles/snapshot.env"

if [ "$(id -u)" != "0" ]; then
  echo "Root required. Run with su."
  exit 1
fi

if [ ! -f "$SNAP_FILE" ]; then
  echo "No snapshot found."
  echo "Run thor_snapshot.sh first, or reboot to restore stock behavior."
  exit 1
fi

. "$SNAP_FILE"

for P in $BASE/policy*; do
  [ -d "$P" ] || continue
  NAME="$(basename "$P")"

  MAX_VAL="$(eval echo \$${NAME}_MAX)"
  MIN_VAL="$(eval echo \$${NAME}_MIN)"

  [ -n "$MAX_VAL" ] && echo "$MAX_VAL" > "$P/scaling_max_freq"
  [ -n "$MIN_VAL" ] && echo "$MIN_VAL" > "$P/scaling_min_freq"
done

echo "Snapshot restored."