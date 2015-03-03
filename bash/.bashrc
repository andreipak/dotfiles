# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT="%F %T "
# immediately sync history between sessions
PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"

[ -d $HOME/bin ] && PATH=$PATH:$HOME/bin

[ -f /etc/bash_completion ] && . /etc/bash_completion

[ -e /etc/bash_completion.d/git-prompt ] && {
  # http://stackoverflow.com/questions/11662735/git-completion-and-ps1-not-working-git-ps1-command-not-found-on-sudo-s
  GIT_PS1_SHOWUPSTREAM=verbose
  GIT_PS1_SHOWDIRTYSTATE=true
  . /etc/bash_completion.d/git-prompt
}
[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh

PS1="\$(date +%k:%M:%S)|\[\033[32m\]\u@\h\[\033[00m\]:\[\033[33m\]\w\[\033[31m\]\$(__git_ps1)\[\033[00m\]\\$ "

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -d ~/.bash.d ]; then
    for SCRIPT in ~/.bash.d/*; do
        source $SCRIPT
    done
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Combine multiline commands into one in history
shopt -s cmdhist

# fix spelling errors for cd, only in interactive shell
shopt -s cdspell
# avoid duplicates..
export HISTCONTROL=ignoredups:ignorespace
# append history entries..
shopt -s histappend

#http://stackoverflow.com/questions/582726/alternate-way-to-trigger-reverse-i-search-without-pressing-ctrlr-in-bash
alias hists="history | grep -v '^ *[0-9]* *hists' | grep $@"

CDPATH=$HOME:$HOME/work:$HOME/repos
EDITOR=/usr/bin/vim






export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
