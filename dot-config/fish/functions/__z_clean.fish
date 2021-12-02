function __z_clean -d "Clean up .z ***REMOVED***le to remove paths no longer valid"
    set -l tmp***REMOVED***le (mktemp $Z_DATA.XXXXXX)

    if test -f $tmp***REMOVED***le
        while read line
            set -l path (string split '|' $line)[1]
            test -d $path; and echo $line
        end <$Z_DATA >$tmp***REMOVED***le
        command mv -f $tmp***REMOVED***le $Z_DATA
    end
end
