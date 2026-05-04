#!/system/bin/sh
# u/StarrySkyBoi
# https://www.reddit.com/r/AynThor/comments/1sq22kx/script_to_undervolt_thor_for_better_battery_and/

BASE="/sys/devices/system/cpu/cpufreq"

stop perfd
stop vendor.perf-hal-1-0
stop vendor.perf-hal-2-0

chmod 666 "$BASE/policy0/scaling_max_freq"
echo 1785600 > "$BASE/policy0/scaling_max_freq"
chmod 444 "$BASE/policy0/scaling_max_freq"

chmod 666 "$BASE/policy3/scaling_max_freq"
echo 2054400 > "$BASE/policy3/scaling_max_freq"
chmod 444 "$BASE/policy3/scaling_max_freq"

chmod 666 "$BASE/policy7/scaling_max_freq"
echo 2227200 > "$BASE/policy7/scaling_max_freq"
chmod 444 "$BASE/policy7/scaling_max_freq"