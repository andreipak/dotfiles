ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="apak_solarized"

plugins=( 
    git 
    knife 
    virtualenvwrapper 
    pip
    virtualbox
    ssh 
    vagrant
    django
    dircolors
    virtualenv_solarized
    zsh-syntax-highlighting 
    zsh-history-substring-search
    autojump
)

source $ZSH/oh-my-zsh.sh

preexec () {
  #http://stackoverflow.com/questions/13125825/zsh-update-prompt-with-current-time-when-a-command-is-started
  DATE=`date +"%H:%M:%S %Y-%m-%d"`
  C=$(($COLUMNS-20))
  echo -e "\033[1A\033[${C}C \e[1m\e[38;5;240m${DATE}\e[0m"
}


# https://github.com/zsh-users/zsh-history-substring-search
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
#
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# http://dustri.org/b/my-zsh-configuration.html
setopt print_exit_value         # print return value if non-zero
# http://linuxgazette.net/184/silva.html - The reason why I have switched to zsh - Part 2
# setopt correct

unsetopt beep                   # no bell on error
unsetopt hist_beep              # no bell on error in history
unsetopt list_beep              # no bell on ambiguous completion

# History
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=10240                   # big history
SAVEHIST=10240                   # big history
setopt append_history           # append
#setopt hist_ignore_all_dups     # no duplicate
# unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword
setopt extended_history 	# save timestamp and runtime information

# http://zsh.sourceforge.net/Intro/intro_13.html
cdpath=(~/repos ~/work ~/src ~)

# https://github.com/robbyrussell/oh-my-zsh/pull/1928/files
alias history='fc -il 1'
#http://stackoverflow.com/questions/582726/alternate-way-to-trigger-reverse-i-search-without-pressing-ctrlr-in-bash
function hists() {
	if [ $# -gt 0 ]; then
		history | grep -v '^ *[0-9]* *hists' | grep $@ 
	else
		history | tail -n30
	fi
}

alias gs='git status'
alias ll='ls -alF'

alias zshconfig="vim ~/.zshrc"
alias tmux="tmux -2"

export EDITOR='vim'

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

[ -s "$HOME/.rvm/scripts/rvm" ] && {
  PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
}

# http://www.teamocil.com/#extras/zsh-autocompletion
[ -d "$HOME/.teamocil" ] && compctl -g '~/.teamocil/*(:t:r)' teamocil

# http://stackoverflow.com/questions/24005133/ubuntu-14-04-apt-aptitude-autocompletion-with-oh-my-zsh-not-working
setopt completealiases

# set PATH so it includes user's private bin if it exists

# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/fasd/fasd.plugin.zsh
#[ $commands[fasd] ] && {
  #fasd_cache="$HOME/.fasd-init-cache"

  #if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    #fasd --init auto >| "$fasd_cache"
  #fi
  #source "$fasd_cache"
  #unset fasd_cache
  #alias v='f -e vim'
  #alias o='a -e open'

  ## https://github.com/clvv/fasd/issues/10
  #alias a='fasd -a'        # any
  #alias s='fasd -si'       # show / search / select
  #alias d='fasd -d'        # directory
  #alias ds='fasd -sid'     # interactive directory selection
  #alias f='fasd -f'        # file
  #alias fs='fasd -sif'     # interactive file selection
  #alias j='fasd_cd -d'     # cd, same functionality as j in autojump
  #alias js='fasd_cd -d -i' # cd with interactive selection
#}

alias open=xdg-open
