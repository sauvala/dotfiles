function bass
  set -l bash_args $argv
  set -l bass_debug
  if test "$bash_args[1]_" = '-d_'
    set bass_debug true
    set -e bash_args[1]
  end

  set -l script_***REMOVED***le (mktemp)
  if command -v python3 >/dev/null 2>&1
    command python3 -sS (dirname (status -f))/__bass.py $bash_args 3>$script_***REMOVED***le
  else
    command python -sS (dirname (status -f))/__bass.py $bash_args 3>$script_***REMOVED***le
  end
  set -l bass_status $status
  if test $bass_status -ne 0
    return $bass_status
  end

  if test -n "$bass_debug"
    cat $script_***REMOVED***le
  end
  source $script_***REMOVED***le
  command rm $script_***REMOVED***le
end

function __bass_usage
  echo "Usage: bass [-d] <bash-command>"
end
