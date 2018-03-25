# up => Ctrl-k
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^k" up_widget

# git => Ctrl-g
	function git_prepare() {
		if [ -n "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
			then
				BUFFER="git add -A; git commit -v && git push"
		fi
				
		zle accept-line
	}
	zle -N git_prepare
	bindkey "^g" git_prepare

# home => Ctrl-h
	function goto_home() { 
		BUFFER="cd ~/"$BUFFER
		zle end-of-line
		zle accept-line
	}
	zle -N goto_home
	bindkey "^h" goto_home

# Edit and rerun => Ctrl-v
	function edit_and_run() {
		BUFFER="fc"
		zle accept-line
	}
	zle -N edit_and_run
	bindkey "^v" edit_and_run

# LS => Ctrl-l
	function ctrl_l() {
		BUFFER="ls"
		zle accept-line
	}
	zle -N ctrl_l
	bindkey "^l" ctrl_l

# Enter => Ctrl-0
	function enter_line() {
		zle accept-line
	}
	zle -N enter_line
	bindkey "^o" enter_line

# Sudo => Ctrl-s
	function add_sudo() {
		BUFFER="sudo "$BUFFER
		zle end-of-line
	}
	zle -N add_sudo
	bindkey "^s" add_sudo

# Update dotfile => Ctrl-d
	function update_dotfiles() {
		BUFFER="(cd ~/dotfiles && git pull && git submodule update --init --recursive)"
		zle end-of-line
	}
	zle -N update_dotfiles
	bindkey "^r" update_dotfiles