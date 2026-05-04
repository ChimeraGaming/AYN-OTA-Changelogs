#!/system/bin/sh
# Thor CPU Profiles
# Root required
# This is NOT undervolting. It limits max CPU frequency.

PROFILE="${1:-balanced}"

POLICY0="/sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq"
POLICY3="/sys/devices/system/cpu/cpufreq/policy3/scaling_max_freq"
POLICY7="/sys/devices/system/cpu/cpufreq/policy7/scaling_max_freq"

set_freq() {
  FILE="$1"
  VALUE="$2"

  if [ -w "$FILE" ]; then
    echo "$VALUE" > "$FILE"
    echo "OK: $FILE = $VALUE"
  else
    echo "FAIL: Cannot write to $FILE"
  fi
}

show_current() {
  echo ""
  echo "Current CPU max frequencies:"
  for P in /sys/devices/system/cpu/cpufreq/policy*/scaling_max_freq; do
    [ -f "$P" ] && echo "$P = $(cat "$P")"
  done
  echo ""
}

require_root() {
  if [ "$(id -u)" != "0" ]; then
    echo "Root required. Run:"
    echo "su"
    echo "sh thor_cpu_profiles.sh balanced"
    exit 1
  fi
}

require_root

case "$PROFILE" in
  battery)
    echo "Applying Battery profile..."
    set_freq "$POLICY0" 1516800
    set_freq "$POLICY3" 1785600
    set_freq "$POLICY7" 1996800
    ;;

  balanced)
    echo "Applying Balanced profile..."
    set_freq "$POLICY0" 1785600
    set_freq "$POLICY3" 2054400
    set_freq "$POLICY7" 2227200
    ;;

  performance)
    echo "Applying Performance profile..."
    set_freq "$POLICY0" 1996800
    set_freq "$POLICY3" 2419200
    set_freq "$POLICY7" 2649600
    ;;

  restore)
    echo "Applying Restore profile..."
    set_freq "$POLICY0" 2016000
    set_freq "$POLICY3" 2803200
    set_freq "$POLICY7" 3187200
    ;;

  current)
    show_current
    exit 0
    ;;

  *)
    echo "Usage:"
    echo "sh thor_cpu_profiles.sh battery"
    echo "sh thor_cpu_profiles.sh balanced"
    echo "sh thor_cpu_profiles.sh performance"
    echo "sh thor_cpu_profiles.sh restore"
    echo "sh thor_cpu_profiles.sh current"
    exit 1
    ;;
esac

show_current