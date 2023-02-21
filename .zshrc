# zsh syntax highlight, convenient history search and completion
ZSH_SYNTAX=/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [[ -f "$ZSH_SYNTAX" ]]; then
  source "$ZSH_SYNTAX"
fi

ZSH_HIST_SUBSTR_SEARCH=/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
if [[ -f "$ZSH_HIST_SUBSTR_SEARCH" ]]; then
  source "$ZSH_HIST_SUBSTR_SEARCH"
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

ZSH_AUTOSUGGEST=/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if [[ -f "$ZSH_AUTOSUGGEST" ]]; then
  source "$ZSH_AUTOSUGGEST"
fi
# fpath=(/opt/homebrew/share/zsh-completions $fpath)

# zsh autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# gcloud completions
ZSH_GCLOUD_COMPL=/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
if [[ -f "$ZSH_GCLOUD_COMPL" ]]; then
  source "$ZSH_GCLOUD_COMPL"
fi

# setup PATH
export PATH=/opt/homebrew/opt/openssl@3/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/opt/homebrew/opt/make/libexec/gnubin:/usr/local/go/bin:/Applications/Emacs.app/Contents/MacOS/bin

# might be needed in PATH
#:/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/opt/librdkafka/lib/pkgconfig

# enable colours in macOS Terminal
# terminal One Dark theme https://github.com/nathanbuchar/atom-one-dark-terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Comet node-rdkafka
# export CPPFLAGS="-I/opt/homebrew/open/openssl@3/include"
# export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"

export CPPFLAGS=-I/usr/local/opt/openssl/include
export LDFLAGS=-L/usr/local/opt/openssl/lib

# starship
eval "$(starship init zsh)"

# Get work specific configs
ZSH_WORK=~/.zshrc.work
if [[ -f "$ZSH_WORK" ]]; then
  source "$ZSH_WORK"
fi

# get confluent-kafka-go to work
# export PKG_CONFIG_PATH=/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/opt/librdkafka/lib/pkgconfig

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# brew bundle file
export HOMEBREW_BUNDLE_FILE=~/.dotfiles/brew/Brewfile

# aliases
alias ed="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias ec="emacsclient -cn"
alias ll="ls -al"
alias vz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias brewb="brew bundle"
alias bup="brew update && brew upgrade"

# fzf integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history
export HISTTIMEFORMAT="[%F %T] "

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

