# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000
	setopt inc_append_history # To save every command before it is executed
	setopt share_history # setopt inc_append_history

# Aliases
    case `uname` in
    Darwin)
        # commands for OS X go here
        alias v="vim -p"
        alias vi="vim -p"
        #alias xclip="~/dotfiles/bin/osx-xclip"
    ;;
    Linux)
        if [[ "$(which vimx)" != "vimx not found" ]]; then
            alias v="vimx -p"
            alias vi="vimx -p"
            alias vim="vimx -p"
        else
            alias v="vim -p"
            alias vi="vim -p"
        fi
    ;;
    esac

	alias cls="clear"
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
    alias rd='rm -rf'

    # Alias definitions.
    # You may want to put all your additions into a separate file like
    # ~/.user_aliases, instead of adding them here directly.
    if [ -f ~/.user_aliases ]; then
        source ~/.user_aliases
    fi

    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi

	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim

source ~/dotfiles/zsh/plugins/fixls.zsh

#Functions
	# Custom cd
	c() {
		cd $1;
		ls;
	}
	alias cd="c"

# For vim mappings:
	stty -ixon

ZSH_THEME=af-magic

source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
source ~/dotfiles/zsh/plugins/vi-mode.plugin.zsh
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# keys
source ~/dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
source ~/dotfiles/zsh/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source ~/dotfiles/zsh/prompt.sh
