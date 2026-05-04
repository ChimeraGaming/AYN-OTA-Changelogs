#!/system/bin/sh
# Thor Current CPU Limits
# Root recommended

BASE="/sys/devices/system/cpu/cpufreq"

echo "Current CPU frequencies:"

for P in $BASE/policy*; do
  [ -d "$P" ] || continue
  echo ""
  echo "$(basename "$P")"
  [ -f "$P/scaling_max_freq" ] && echo "max = $(cat "$P/scaling_max_freq")"
  [ -f "$P/scaling_min_freq" ] && echo "min = $(cat "$P/scaling_min_freq")"
done