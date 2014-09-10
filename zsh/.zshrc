ZSH=$HOME/.oh-my-zsh
ZSH_THEME="apak_solarized"

plugins=(
	git knife virtualenvwrapper autojump pip
	ssh 
	vagrant
	django
	dircolors
	virtualenv_solarized
	zsh-syntax-highlighting 
	zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

preexec () {
  #http://stackoverflow.com/questions/13125825/zsh-update-prompt-with-current-time-when-a-command-is-started
  DATE=`date +"%H:%M:%S %Y-%m-%d"`
  C=$(($COLUMNS-20))
  echo -e "\033[1A\033[${C}C \e[1m\e[38;5;240m${DATE}\e[0m"
}

# http://linuxgazette.net/184/silva.html - The reason why I have switched to zsh - Part 2
setopt correct

# https://github.com/zsh-users/zsh-history-substring-search
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
#
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
#
# bind k and j for VI mode
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down

# http://dustri.org/b/my-zsh-configuration.html
setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt hist_beep              # no bell on error in history
unsetopt list_beep              # no bell on ambiguous completion

# History
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=10240                   # big history
SAVEHIST=10240                   # big history
setopt append_history           # append
#setopt hist_ignore_all_dups     # no duplicate
#unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword

# http://zsh.sourceforge.net/Intro/intro_13.html
cdpath=( ~/repos ~/work ~ )

# https://github.com/robbyrussell/oh-my-zsh/pull/1928/files
alias history='fc -il 1'
#http://stackoverflow.com/questions/582726/alternate-way-to-trigger-reverse-i-search-without-pressing-ctrlr-in-bash
alias hists="history | grep -v '^ *[0-9]* *hists' | grep $@"
setopt extendedhistory

alias gs='git status'
alias ll='ls -alF'

EDITOR=/usr/bin/vim
alias zshconfig="vim ~/.zshrc"
alias tmux="tmux -2"

