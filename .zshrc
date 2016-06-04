#!/usr/bin/zsh

# export
export PATH=/usr/local/bin:$PATH
export EDITOR=vim
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_ALL="en_US.UTF-8"
export JLESSCHARSET=ja_JP.UTF-8
export OUTPUT_CHARSET=utf-8
export XDG_DATA_HOME=/usr/local/share
export LS_COLORS='di=01;36'
export ZLS_COLORS=$LS_COLORS

# autoload
autoload -Uz compinit; compinit
autoload -Uz url-quote-magic; zle -N self-insert url-quote-magic
autoload -U colors; colors
autoload history-search-end

# setopt
setopt auto_menu
setopt auto_list
setopt auto_param_slash
setopt append_history
setopt auto_pushd
setopt auto_cd
setopt auto_pushd
setopt complete_aliases
setopt correct
setopt extended_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt interactive_comments
setopt list_packed
setopt list_types
setopt magic_equal_subst
setopt nobeep
setopt noautoremoveslash
setopt no_flow_control
setopt print_eight_bit
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_ignore_dups
setopt share_history
setopt transient_rprompt

# alias
alias ls='ls -hF'
alias ll='ls -l'
alias la='ls -A'
alias sudo='env PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin \sudo'
alias screen='screen -U'
alias co='checkout'
alias path="echo -e ${PATH//:/\\n}"
alias ll="ls -a -l"
alias rm="rm -rf"

# others
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
function history-all { history -E 1 }
PROMPT="%{${fg[cyan]}%}%n%{${fg[yellow]}%} %~%{${reset_color}%}"
PROMPT+=" %{$color%}$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /')%b%{${reset_color}%}"
e_normal=`echo -e "\033[0;30m"`
e_RED=`echo -e "\033[1;31m"`
e_BLUE=`echo -e "\033[1;36m"`
function make() {
LANG=C command make "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot\sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}

PATH=/usr/local/bin:$PATH
export PATH
fpath=(~/.zsh/functions/Completion ${fpath})


# Python
export NOSE_REDNOSE=1
export PATH=$HOME/.npm/bin:$PATH
export NODE_PATH=$HOME/.npm/libraries:$NODE_PATH
export MANPATH=$HOME/.npm/man:$MANPATH
setopt no_hup
setopt no_checkjobs
setopt notify

# go
export GOROOT=/Users/satodaisuke/.gvm/gos/go1.3.3/
export GOPATH=/Users/satodaisuke/.gvm/pkgsets/go1.3.3/global/
export PATH=“$GOROOT/bin/$PATH”


#Swift
SDKROOT=$(xcrun --show-sdk-path -sdk macosx)
alias swiftc="swiftc -sdk $SDKROOT"

#Node
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

#NVM
export NVM_DIR=~/.nvm
if which nvm > /dev/null; then source $(brew --prefix nvm)/nvm.sh; fi

# Swift
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# Docker
alias dm="docker-machine"
alias dc="docker-compose"

# Ruby
alias be="bundle exec"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
