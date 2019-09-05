HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

export TERM=xterm-256color
function precmd() {
	PROMPT="%F{051}%n@%m"
	RPROMPT="[%F{248}%~%f]"
	st=`git status 2>/dev/null`
	if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
		color=048
	elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
		color=038
	elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
		color=011
	else
		color=124
	fi
	PROMPT+=" %F{$color}$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /')%b%f"
}

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt share_history
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt ignore_eof
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt magic_equal_subst
setopt notify
setopt print_eight_bit
setopt print_exit_value
setopt prompt_subst
setopt pushd_ignore_dups
setopt rm_star_wait
setopt share_history
setopt transient_rprompt

autoload -Uz add-zsh-hook
autoload -Uz compinit && compinit -u
autoload -Uz url-quote-magic
autoload -Uz vcs_info
autoload colors && colors

zle -N self-insert url-quote-magic

export LANG=en_US.UTF-8
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=92:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'


zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'yes'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export PATH="/usr/local/opt/gettext/bin:$PATH"

alias d='docker'
alias dc='docker-compose'
alias du='/usr/bin/dropbox_uploader.sh'
alias tf='/usr/local/opt/terraform@0.11/bin/terraform'
alias tf12='/usr/local/opt/terraform@0.12/bin/terraform'
alias gc='gcloud'

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
