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

export LANG=ja_JP.UTF-8
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=94:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

export GOPATH=/Users/daisuke.sato.a.ts/.go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/github.com/flutter/flutter/bin:$PATH
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH=$PATH:$HOME/.pub-cache/bin

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'yes'

alias d='docker'
alias dc='docker-compose'
alias tf='/usr/local/Cellar/terraform@0.11/0.11.14/bin/terraform'

if which direnv > /dev/null; then eval "$(direnv hook zsh)"; fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh
#export CGO_CXXFLAGS="--std=c++11"
#export CGO_CPPFLAGS="-I/opt/homebrew/Cellar/opencv/4.5.3_2/include"
#export CGO_LDFLAGS="-L/opt/homebrew/Cellar/opencv/4.5.3_2/lib -lopencv_stitching -lopencv_superres -lopencv_videostab -lopencv_aruco -lopencv_bgsegm -lopencv_bioinspired -lopencv_ccalib -lopencv_dnn_objdetect -lopencv_dpm -lopencv_face -lopencv_photo -lopencv_fuzzy -lopencv_hfs -lopencv_img_hash -lopencv_line_descriptor -lopencv_optflow -lopencv_reg -lopencv_rgbd -lopencv_saliency -lopencv_stereo -lopencv_structured_light -lopencv_phase_unwrapping -lopencv_surface_matching -lopencv_tracking -lopencv_datasets -lopencv_dnn -lopencv_plot -lopencv_xfeatures2d -lopencv_shape -lopencv_video -lopencv_ml -lopencv_ximgproc -lopencv_calib3d -lopencv_features2d -lopencv_highgui -lopencv_videoio -lopencv_flann -lopencv_xobjdetect -lopencv_imgcodecs -lopencv_objdetect -lopencv_xphoto -lopencv_imgproc -lopencv_core"

export PATH="${GOENV_ROOT}/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH=$PATH:/Users/daisuke.sato.a.ts/Library/Android/sdk/platform-tools
export C_INCLUDE_PATH=/opt/homebrew/include:$C_INCLUDE_PATH
export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH
#export PATH="/opt/homebrew/opt/openjdk@19/bin:$PATH"
#export CPPFLAGS="-I/opt/homebrew/opt/openjdk@19/include"

#. ~/.asdf/plugins/java/set-java-home.zsh
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home
export PATH="$JAVA_HOME/bin:$PATH"
export ANDROID_HOME=$HOME'/Library/Android/sdk'

