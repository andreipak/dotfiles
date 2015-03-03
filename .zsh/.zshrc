cdpath=(~/repos ~/work ~/src ~)

setopt print_exit_value         # print return value if non-zero

alias gs='git status'
alias ll='ls -alF'
alias zshconfig="vim ~/.zshrc"
alias tmux="tmux -2"

export EDITOR='vim'
export VISUAL='vim'

if [ "$(uname -s)" = "Darwin" ]; then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  alias vim='mvim -v'
else
  alias open='xdg-open'
fi

source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle virtualenvwrapper
antigen bundle brew

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen bundle andreipak/my-zsh plugins/virtualenv-prompt
antigen bundle andreipak/my-zsh plugins/history
antigen bundle andreipak/my-zsh plugins/no-beep
antigen bundle andreipak/my-zsh plugins/print-time
antigen bundle andreipak/my-zsh plugins/dircolors

antigen theme  andreipak/my-zsh themes/andreipak

antigen apply

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
