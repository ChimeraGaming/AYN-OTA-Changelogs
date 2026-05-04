#!/system/bin/sh
# Thor Performance Profile
# Root required
# This is NOT undervolting. It limits max CPU frequency.

BASE="/sys/devices/system/cpu/cpufreq"
SNAP_DIR="/data/local/tmp/thor_cpu_profiles"
SNAP_FILE="$SNAP_DIR/snapshot.env"

mkdir -p "$SNAP_DIR"

if [ "$(id -u)" != "0" ]; then
  echo "Root required. Run with su."
  exit 1
fi

if [ ! -f "$SNAP_FILE" ]; then
  echo "# Thor CPU snapshot" > "$SNAP_FILE"
  for P in $BASE/policy*; do
    [ -d "$P" ] || continue
    NAME="$(basename "$P")"
    [ -f "$P/scaling_max_freq" ] && echo "${NAME}_MAX=$(cat "$P/scaling_max_freq")" >> "$SNAP_FILE"
    [ -f "$P/scaling_min_freq" ] && echo "${NAME}_MIN=$(cat "$P/scaling_min_freq")" >> "$SNAP_FILE"
  done
fi

echo 1996800 > "$BASE/policy0/scaling_max_freq"
echo 2419200 > "$BASE/policy3/scaling_max_freq"
echo 2649600 > "$BASE/policy7/scaling_max_freq"

echo "Performance profile applied."