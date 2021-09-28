# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/janne/google-cloud-sdk/path.***REMOVED***sh.inc' ]; . '/Users/janne/google-cloud-sdk/path.***REMOVED***sh.inc'; end

# pyenv
status is-login; and pyenv init --path | source
pyenv init - | source

# pyenv virtualenv
status --is-interactive; and source (pyenv virtualenv-init -|psub)

# source (navi widget ***REMOVED***sh)
set PATH $HOME/.jenv/bin $PATH
status --is-interactive; and source (jenv init -|psub)

# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# Disable theme and starship in dumb terminals
if [ "$TERM" != "dumb" ]
  base16-gruvbox-dark-medium
  starship init ***REMOVED***sh | source
end

# emacs: this function may be required
function ***REMOVED***sh_title
  true
end

set PATH ~/.emacs.d/bin/ $PATH

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# iTerm2 ***REMOVED***sh integration
source ~/.iterm2_shell_integration.***REMOVED***sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/janne.sauvala/Downloads/google-cloud-sdk 2/path.***REMOVED***sh.inc' ]; . '/Users/janne.sauvala/Downloads/google-cloud-sdk 2/path.***REMOVED***sh.inc'; end

# vim keybindings
***REMOVED***sh_vi_key_bindings

function ***REMOVED***sh_user_key_bindings
  bind yy ***REMOVED***sh_clipboard_copy
  bind y ***REMOVED***sh_clipboard_copy
  bind Y ***REMOVED***sh_clipboard_copy
  bind p ***REMOVED***sh_clipboard_paste
end
