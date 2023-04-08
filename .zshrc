#!/bin/zsh

alias update='sudo dnf check-update'
alias upgrade='sudo dnf upgrade -y && flatpak update -y'
alias install='sudo dnf install'
alias remove='sudo dnf remove'

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

alias v='nvim'
alias vi='nvim'

alias tmc="nvim ~/.config/tmux/tmux.conf"
alias vrc='cd ~/.config/nvim && nvim .'
alias zrc="nvim ~/.zshrc"

# connect wifi
alias cwla="nmcli d"
alias cwl="nmcli d wifi list"
alias cwc="nmcli d wifi connect"

# tmux setting
alias tls="tmux list-sessions"
alias tns="tmux new-session -s"
alias tas="tmux attach -t"

alias sorc="source ~/.zshrc"

bindkey -s ^f "tmux-sessionizer\n"

plugins=(asdf docker git sudo fzf zsh-yarn-completions zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source $HOME/.local/bin/virtualenvwrapper.sh

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
