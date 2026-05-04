#!/system/bin/sh
# Thor CPU Profiles
# Snapshot current CPU limits for accurate restore
# Root required

BASE="/sys/devices/system/cpu/cpufreq"
SNAP_DIR="/data/local/tmp/thor_cpu_profiles"
SNAP_FILE="$SNAP_DIR/snapshot.env"

mkdir -p "$SNAP_DIR"

if [ "$(id -u)" != "0" ]; then
  echo "Root required. Run with su."
  exit 1
fi

echo "# Thor CPU snapshot" > "$SNAP_FILE"

for P in $BASE/policy*; do
  [ -d "$P" ] || continue
  NAME="$(basename "$P")"

  [ -f "$P/scaling_max_freq" ] && echo "${NAME}_MAX=$(cat "$P/scaling_max_freq")" >> "$SNAP_FILE"
  [ -f "$P/scaling_min_freq" ] && echo "${NAME}_MIN=$(cat "$P/scaling_min_freq")" >> "$SNAP_FILE"
done

echo "Snapshot saved to $SNAP_FILE"