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

# emacs: this function may be required
function ***REMOVED***sh_title
  true
end

starship init ***REMOVED***sh | source

set PATH ~/.emacs.d/bin/ $PATH

set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# iTerm2 ***REMOVED***sh integration
source ~/.iterm2_shell_integration.(basename $SHELL)

# Fish gruvbox theme
base16-gruvbox-dark-medium

