function ***REMOVED***sher --argument-names cmd --description "A plugin manager for Fish"
    set --query ***REMOVED***sher_path || set --local ***REMOVED***sher_path $__***REMOVED***sh_con***REMOVED***g_dir
    set --local ***REMOVED***sher_version 4.3.0
    set --local ***REMOVED***sh_plugins $__***REMOVED***sh_con***REMOVED***g_dir/***REMOVED***sh_plugins

    switch "$cmd"
        case -v --version
            echo "***REMOVED***sher, version $***REMOVED***sher_version"
        case "" -h --help
            echo "Usage: ***REMOVED***sher install <plugins...>  Install plugins"
            echo "       ***REMOVED***sher remove  <plugins...>  Remove installed plugins"
            echo "       ***REMOVED***sher update  <plugins...>  Update installed plugins"
            echo "       ***REMOVED***sher update                Update all installed plugins"
            echo "       ***REMOVED***sher list    [<regex>]     List installed plugins matching regex"
            echo "Options:"
            echo "       -v or --version  Print version"
            echo "       -h or --help     Print this help message"
        case ls list
            string match --entire --regex -- "$argv[2]" $_***REMOVED***sher_plugins
        case install update remove
            isatty || read --local --null --array stdin && set --append argv $stdin

            set --local install_plugins
            set --local update_plugins
            set --local remove_plugins
            set --local arg_plugins $argv[2..-1]
            set --local old_plugins $_***REMOVED***sher_plugins
            set --local new_plugins

            if ! set --query argv[2]
                if test "$cmd" != update
                    echo "***REMOVED***sher: Not enough arguments for command: \"$cmd\"" >&2 && return 1
                else if test ! -e $***REMOVED***sh_plugins
                    echo "***REMOVED***sher: \"$***REMOVED***sh_plugins\" ***REMOVED***le not found: \"$cmd\"" >&2 && return 1
                end
                set arg_plugins (string match --regex -- '^[^\s]+$' <$***REMOVED***sh_plugins)
            end

            for plugin in $arg_plugins
                test -e "$plugin" && set plugin (realpath $plugin)
                contains -- "$plugin" $new_plugins || set --append new_plugins $plugin
            end

            if set --query argv[2]
                for plugin in $new_plugins
                    if contains -- "$plugin" $old_plugins
                        test "$cmd" = remove &&
                            set --append remove_plugins $plugin ||
                            set --append update_plugins $plugin
                    else if test "$cmd" = install
                        set --append install_plugins $plugin
                    else
                        echo "***REMOVED***sher: Plugin not installed: \"$plugin\"" >&2 && return 1
                    end
                end
            else
                for plugin in $new_plugins
                    contains -- "$plugin" $old_plugins &&
                        set --append update_plugins $plugin ||
                        set --append install_plugins $plugin
                end

                for plugin in $old_plugins
                    contains -- "$plugin" $new_plugins || set --append remove_plugins $plugin
                end
            end

            set --local pid_list
            set --local source_plugins
            set --local fetch_plugins $update_plugins $install_plugins
            echo (set_color --bold)***REMOVED***sher $cmd version $***REMOVED***sher_version(set_color normal)

            for plugin in $fetch_plugins
                set --local source (command mktemp -d)
                set --append source_plugins $source

                command mkdir -p $source/{completions,conf.d,functions}

                ***REMOVED***sh --command "
                    if test -e $plugin
                        command cp -Rf $plugin/* $source
                    else
                        set temp (command mktemp -d)
                        set name (string split \@ $plugin) || set name[2] HEAD
                        set url https://codeload.github.com/\$name[1]/tar.gz/\$name[2]

                        echo Fetching (set_color --underline)\$url(set_color normal)

                        if curl --silent \$url | tar -xzC \$temp -f - 2>/dev/null
                            command cp -Rf \$temp/*/* $source
                        else
                            echo ***REMOVED***sher: Invalid plugin name or host unavailable: \\\"$plugin\\\" >&2
                            command rm -rf $source
                        end
                        command rm -rf \$temp
                    end

                    set ***REMOVED***les $source/* && string match --quiet --regex -- .+\.***REMOVED***sh\\\$ \$***REMOVED***les
                " &

                set --append pid_list (jobs --last --pid)
            end

            wait $pid_list 2>/dev/null

            for plugin in $fetch_plugins
                if set --local source $source_plugins[(contains --index -- "$plugin" $fetch_plugins)] && test ! -e $source
                    if set --local index (contains --index -- "$plugin" $install_plugins)
                        set --erase install_plugins[$index]
                    else
                        set --erase update_plugins[(contains --index -- "$plugin" $update_plugins)]
                    end
                end
            end

            for plugin in $update_plugins $remove_plugins
                if set --local index (contains --index -- "$plugin" $_***REMOVED***sher_plugins)
                    set --local plugin_***REMOVED***les_var _***REMOVED***sher_(string escape --style=var -- $plugin)_***REMOVED***les

                    if contains -- "$plugin" $remove_plugins
                        for name in (string replace --***REMOVED***lter --regex -- '.+/conf\.d/([^/]+)\.***REMOVED***sh$' '$1' $$plugin_***REMOVED***les_var)
                            emit {$name}_uninstall
                        end
                        printf "%s\n" Removing\ (set_color red --bold)$plugin(set_color normal) "         "$$plugin_***REMOVED***les_var
                    end

                    command rm -rf $$plugin_***REMOVED***les_var
                    functions --erase (string replace --***REMOVED***lter --regex -- '.+/functions/([^/]+)\.***REMOVED***sh$' '$1' $$plugin_***REMOVED***les_var)

                    for name in (string replace --***REMOVED***lter --regex -- '.+/completions/([^/]+)\.***REMOVED***sh$' '$1' $$plugin_***REMOVED***les_var)
                        complete --erase --command $name
                    end

                    set --erase _***REMOVED***sher_plugins[$index]
                    set --erase $plugin_***REMOVED***les_var
                end
            end

            if set --query update_plugins[1] || set --query install_plugins[1]
                command mkdir -p $***REMOVED***sher_path/{functions,conf.d,completions}
            end

            for plugin in $update_plugins $install_plugins
                set --local source $source_plugins[(contains --index -- "$plugin" $fetch_plugins)]
                set --local ***REMOVED***les $source/{functions,conf.d,completions}/*

                if set --local index (contains --index -- $plugin $install_plugins)
                    set --local user_***REMOVED***les $***REMOVED***sher_path/{functions,conf.d,completions}/*
                    set --local conflict_***REMOVED***les

                    for ***REMOVED***le in (string replace -- $source/ $***REMOVED***sher_path/ $***REMOVED***les)
                        contains -- $***REMOVED***le $user_***REMOVED***les && set --append conflict_***REMOVED***les $***REMOVED***le
                    end

                    if set --query conflict_***REMOVED***les[1] && set --erase install_plugins[$index]
                        echo -s "***REMOVED***sher: Cannot install \"$plugin\": please remove or move conflicting ***REMOVED***les ***REMOVED***rst:" \n"        "$conflict_***REMOVED***les >&2
                        continue
                    end
                end

                for ***REMOVED***le in (string replace -- $source/ "" $***REMOVED***les)
                    command cp -Rf $source/$***REMOVED***le $***REMOVED***sher_path/$***REMOVED***le
                end

                set --local plugin_***REMOVED***les_var _***REMOVED***sher_(string escape --style=var -- $plugin)_***REMOVED***les
                set --query ***REMOVED***les[1] && set --universal $plugin_***REMOVED***les_var (string replace -- $source $***REMOVED***sher_path $***REMOVED***les)

                contains -- $plugin $_***REMOVED***sher_plugins || set --universal --append _***REMOVED***sher_plugins $plugin
                contains -- $plugin $install_plugins && set --local event install || set --local event update

                printf "%s\n" Installing\ (set_color --bold)$plugin(set_color normal) "           "$$plugin_***REMOVED***les_var

                for ***REMOVED***le in (string match --regex -- '.+/[^/]+\.***REMOVED***sh$' $$plugin_***REMOVED***les_var)
                    source $***REMOVED***le
                    if set --local name (string replace --regex -- '.+conf\.d/([^/]+)\.***REMOVED***sh$' '$1' $***REMOVED***le)
                        emit {$name}_$event
                    end
                end
            end

            command rm -rf $source_plugins

            set --query _***REMOVED***sher_plugins[1] || set --erase _***REMOVED***sher_plugins
            set --query _***REMOVED***sher_plugins &&
                printf "%s\n" $_***REMOVED***sher_plugins >$***REMOVED***sh_plugins ||
                command rm -f $***REMOVED***sh_plugins

            set --local total (count $install_plugins) (count $update_plugins) (count $remove_plugins)
            test "$total" != "0 0 0" && echo (string join ", " (
                test $total[1] = 0 || echo "Installed $total[1]") (
                test $total[2] = 0 || echo "Updated $total[2]") (
                test $total[3] = 0 || echo "Removed $total[3]")
            ) plugin/s
        case \*
            echo "***REMOVED***sher: Unknown command: \"$cmd\"" >&2 && return 1
    end
end

## Migrations ##
function _***REMOVED***sher_***REMOVED***sh_postexec --on-event ***REMOVED***sh_postexec
    if functions --query _***REMOVED***sher_list
        ***REMOVED***sher update >/dev/null 2>/dev/null
        set --query XDG_DATA_HOME || set --local XDG_DATA_HOME ~/.local/share
        test -e $XDG_DATA_HOME/***REMOVED***sher && command rm -rf $XDG_DATA_HOME/***REMOVED***sher
        functions --erase _***REMOVED***sher_list _***REMOVED***sher_plugin_parse
        set --erase ***REMOVED***sher_data
    end
    functions --erase _***REMOVED***sher_***REMOVED***sh_postexec
end
