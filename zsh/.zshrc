#!/bin/zsh

alias update='sudo dnf check-update'
alias upgrade='sudo dnf upgrade -y && flatpak update -y'
alias install='sudo dnf install'
alias remove='sudo dnf remove'

export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export VISUAL='nvim'
export DOTNET_ROOT=$HOME/.dotnet

ZSH_THEME="robbyrussell"

alias v='nvim'
alias vi='nvim'
alias lazyvim='NVIM_APPNAME=lazyvim nvim'
alias chad='NVIM_APPNAME=nvim-nvchad nvim'
alias min='NVIM_APPNAME=nvim-min nvim'

alias tmc="nvim ~/.config/tmux/tmux.conf"
alias vrc='cd ~/.config/nvim && nvim .'
alias zrc="nvim ~/.zshrc"

# connect wifi
alias cwla="nmcli d"
alias cwl="nmcli d wifi list"
alias cwc="nmcli d wifi connect"

# tmux setting
alias tls="tmux list-sessions"
alias tns="tmux new-session -s $(basename $(pwd))"
alias tas="tmux attach -t"

# use bat instead of cat
alias cat="bat"

alias dvorak="setxkbmap -layout \"us\" -variant \"dvorak\""
alias qwerty="setxkbmap -layout \"us\""

alias sorc="source ~/.zshrc"

bindkey -s ^f "tmux-sessionizer\n"

plugins=(asdf git sudo fzf zsh-yarn-completions zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# source $HOME/.local/bin/virtualenvwrapper.sh

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/home/reborn/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$PATH:/home/reborn/.bin"

# fly.io
export FLYCTL_INSTALL="/home/reborn/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/reborn/.bun/_bun" ] && source "/home/reborn/.bun/_bun"

export PATH="/home/reborn/.cargo/bin:$PATH"

export PATH="$PATH:$HOME/.dotnet"
export PATH="$PATH:$HOME/.azure/bin"

eval "$(zoxide init zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/home/reborn/.npm-global/bin:$PATH"
