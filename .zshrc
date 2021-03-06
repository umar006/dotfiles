#!/bin/zsh

alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'

export ZSH="$HOME/.oh-my-zsh"

eval "$(starship init zsh)"

alias v='nvim'
alias vi='nvim'

alias tmc="nvim ~/.config/tmux/tmux.conf"
alias vrc='nvim ~/.config/nvim/init.vim'
alias zrc="nvim ~/.zshrc"

# connect wifi
alias cwla="nmcli d"
alias cwl="nmcli d wifi list"
alias cwc="nmcli d wifi connect"

# tmux setting
alias tls="tmux list-sessions"
alias tns="tmux new-session -s halo"
alias tas="tmux attach -t halo"
alias tsc="tmux switch-client -t"

alias sorc="source ~/.zshrc"

COMPLETION_WAITING_DOTS="true"

plugins=(asdf git sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


source $HOME/.local/bin/virtualenvwrapper.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
