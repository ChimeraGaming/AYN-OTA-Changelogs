#!/system/bin/sh
# Thor CPU Profiles
# Root required
# This is NOT undervolting. It limits max CPU frequency.
# Adds snapshot/restore support.

PROFILE="${1:-balanced}"

BASE="/sys/devices/system/cpu/cpufreq"
SNAP_DIR="/data/local/tmp/thor_cpu_profiles"
SNAP_FILE="$SNAP_DIR/snapshot.env"

mkdir -p "$SNAP_DIR"

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
  echo "Current CPU frequencies:"
  for P in $BASE/policy*; do
    [ -d "$P" ] || continue
    MAX="$P/scaling_max_freq"
    MIN="$P/scaling_min_freq"
    [ -f "$MAX" ] && echo "$MAX = $(cat "$MAX")"
    [ -f "$MIN" ] && echo "$MIN = $(cat "$MIN")"
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

snapshot() {
  echo "Saving snapshot to $SNAP_FILE"
  echo "# Thor CPU snapshot" > "$SNAP_FILE"

  for P in $BASE/policy*; do
    [ -d "$P" ] || continue
    NAME="$(basename "$P")"

    MAX="$P/scaling_max_freq"
    MIN="$P/scaling_min_freq"

    if [ -f "$MAX" ]; then
      echo "${NAME}_MAX=$(cat "$MAX")" >> "$SNAP_FILE"
    fi

    if [ -f "$MIN" ]; then
      echo "${NAME}_MIN=$(cat "$MIN")" >> "$SNAP_FILE"
    fi
  done

  echo "Snapshot saved."
}

restore_snapshot() {
  if [ ! -f "$SNAP_FILE" ]; then
    echo "No snapshot found. Using fallback restore."
    fallback_restore
    return
  fi

  echo "Restoring from snapshot..."

  . "$SNAP_FILE"

  for P in $BASE/policy*; do
    [ -d "$P" ] || continue
    NAME="$(basename "$P")"

    MAX_VAR="${NAME}_MAX"
    MIN_VAR="${NAME}_MIN"

    MAX_VAL="$(eval echo \$$MAX_VAR)"
    MIN_VAL="$(eval echo \$$MIN_VAR)"

    [ -n "$MAX_VAL" ] && set_freq "$P/scaling_max_freq" "$MAX_VAL"
    [ -n "$MIN_VAL" ] && set_freq "$P/scaling_min_freq" "$MIN_VAL"
  done
}

fallback_restore() {
  echo "Applying fallback restore values..."
  set_freq "$BASE/policy0/scaling_max_freq" 2016000
  set_freq "$BASE/policy3/scaling_max_freq" 2803200
  set_freq "$BASE/policy7/scaling_max_freq" 3187200
}

auto_snapshot_if_missing() {
  if [ ! -f "$SNAP_FILE" ]; then
    echo "No snapshot found. Creating one now..."
    snapshot
  fi
}

require_root

case "$PROFILE" in
  snapshot)
    snapshot
    exit 0
    ;;

  restore)
    restore_snapshot
    show_current
    exit 0
    ;;

  battery|balanced|performance)
    auto_snapshot_if_missing
    ;;

esac

case "$PROFILE" in
  battery)
    echo "Applying Battery profile..."
    set_freq "$BASE/policy0/scaling_max_freq" 1516800
    set_freq "$BASE/policy3/scaling_max_freq" 1785600
    set_freq "$BASE/policy7/scaling_max_freq" 1996800
    ;;

  balanced)
    echo "Applying Balanced profile..."
    set_freq "$BASE/policy0/scaling_max_freq" 1785600
    set_freq "$BASE/policy3/scaling_max_freq" 2054400
    set_freq "$BASE/policy7/scaling_max_freq" 2227200
    ;;

  performance)
    echo "Applying Performance profile..."
    set_freq "$BASE/policy0/scaling_max_freq" 1996800
    set_freq "$BASE/policy3/scaling_max_freq" 2419200
    set_freq "$BASE/policy7/scaling_max_freq" 2649600
    ;;

  current)
    show_current
    exit 0
    ;;

  *)
    echo "Usage:"
    echo "sh thor_cpu_profiles.sh snapshot"
    echo "sh thor_cpu_profiles.sh battery"
    echo "sh thor_cpu_profiles.sh balanced"
    echo "sh thor_cpu_profiles.sh performance"
    echo "sh thor_cpu_profiles.sh restore"
    echo "sh thor_cpu_profiles.sh current"
    exit 1
    ;;
esac

show_current