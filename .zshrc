#!/usr/bin/zsh
export PATH=/usr/local/bin:$PATH
export LC_CTYPE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export JLESSCHARSET=ja_JP.UTF-8
export OUTPUT_CHARSET=utf-8
export XDG_DATA_HOME=/usr/local/share
export EDITOR=vim
#export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:$PATH"
setopt complete_aliases
export LC_ALL="en_US.UTF-8"

alias drop='~/workspace/Dropbox-Uploader/dropbox_uploader.sh'
alias xcode='open -a /Applications/Xcode.app "$@"'
alias ls='ls -hF'
alias ll='ls -l'
alias la='ls -A'
alias sudo='env PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin \sudo'
alias screen='screen -U'
alias remote='ssh -i ~/.ssh/id_rsa admin@192.168.0.2'
alias geeknote='~/geeknote/geeknote.py'

alias path="echo -e ${PATH//:/\\n}"
alias mvim="mvim --remote-tab-silent"
alias ll="ls -a -l"
alias rm="rm -rf"

alias p="python "
autoload -U colors; colors
setopt nobeep
setopt prompt_subst
setopt interactive_comments
setopt no_flow_control
setopt print_eight_bit
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export LS_COLORS='di=01;36'
autoload -Uz compinit; compinit
autoload -Uz url-quote-magic; zle -N self-insert url-quote-magic
setopt auto_menu
setopt auto_list
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
setopt magic_equal_subst
setopt auto_param_slash
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
setopt list_packed
setopt list_types
setopt noautoremoveslash
setopt correct
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_pushd
setopt pushd_ignore_dups
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_ignore_space
setopt extended_history
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_verify
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
function history-all { history -E 1 }
setopt transient_rprompt
function precmd() {
PROMPT="%{${fg[cyan]}%}%n%{${fg[yellow]}%} %~%{${reset_color}%}"
st=`git status 2>/dev/null`
if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
  color=${fg[cyan]}
elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
  color=${fg[blue]}
elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
  color=${fg_bold[red]}
else
  color=${fg[red]}
fi
PROMPT+=" %{$color%}$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /')%b%{${reset_color}%}"
}

#----------------------------------------------------------
# Python
#----------------------------------------------------------
export NOSE_REDNOSE=1
export PATH=$HOME/.npm/bin:$PATH
#export PATH=/usr/local/share/python:$PATH
#export PATH=/usr/local/lib/python3/:$PATH
export NODE_PATH=$HOME/.npm/libraries:$NODE_PATH
export MANPATH=$HOME/.npm/man:$MANPATH
setopt no_hup
setopt no_checkjobs
setopt notify

e_normal=`echo -e "\033[0;30m"`
e_RED=`echo -e "\033[1;31m"`
e_BLUE=`echo -e "\033[1;36m"`
function make() {
LANG=C command make "$@" 2>&1 | sed -e "s@[Ee]rror:.*@$e_RED&$e_normal@g" -e "s@cannot\sfind.*@$e_RED&$e_normal@g" -e "s@[Ww]arning:.*@$e_BLUE&$e_normal@g"
}

#----------------------------------------------------------
#----------------------------------------------------------
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#[[ -s "${HOME}/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm
#[[ -s "${HOME}/.perl5/perlbrew/etc/bashrc" ]] && source $HOME/.perl5/perlbrew/etc/bashrc

PATH=/usr/local/bin:$PATH
export PATH
fpath=(~/.zsh/functions/Completion ${fpath})

#export PATH=/usr/local/Cellar:$PATH

#my setting 
function mk () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function calc(){ awk "BEGIN{ print $* }" ;}

export DYLD_LIBRARY_PATH=/Users/satodaisuke/github_Dir/C/DSImageProcessingMethods/lib:$DYLD_LIBRARY_PATH

unset LD_LIBRARY_PATH
unset DYLD_LIBRARY_PATH

export PATH="$HOME/.rbenv/shims:$PATH"
#export PATH="$HOME/.rbenv/version:$PATH"
#export PATH="$HOME/.rbenv/versions/1.9.3-p392/bin:$PATH"
 if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# go
export GOROOT=/Users/satodaisuke/.gvm/gos/go1.3.3/
export GOPATH=/Users/satodaisuke/.gvm/pkgsets/go1.3.3/global/
export PATH=“$GOROOT/bin/$PATH”

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/satodaisuke/.gvm/bin/gvm-init.sh" ]] && source "/Users/satodaisuke/.gvm/bin/gvm-init.sh"
[[ -s "/Users/satodaisuke/.gvm/scripts/gvm" ]] && source "/Users/satodaisuke/.gvm/scripts/gvm"
[[ -s "/Users/dsk/.gvm/scripts/gvm" ]] && source "/Users/dsk/.gvm/scripts/gvm"
eval "$(rbenv init -)"
