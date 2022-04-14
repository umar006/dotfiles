alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'

export ZSH="/home/reborn/.oh-my-zsh"

eval "$(starship init zsh)"

alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vrc='nvim ~/.config/nvim/init.vim'

alias condaon='conda activate'
alias condaoff='conda deactivate'

COMPLETION_WAITING_DOTS="true"

plugins=(asdf git sudo zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# neovim environment
export PATH="$HOME/neovim/bin:$PATH"

# golang environment
export PATH=$PATH:$HOME/.asdf/shims/go
# export PATH=$PATH:$HOME/go/bin

# added by travis gem
[ ! -s /home/reborn/.travis/travis.sh ] || source /home/reborn/.travis/travis.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


#Virtualenvwrapper settings:
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/home/reborn/.asdf/shims/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
source $HOME/.local/bin/virtualenvwrapper.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/reborn/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/reborn/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/reborn/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/reborn/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias config='/usr/bin/git --git-dir=/home/reborn/dotfiles/ --work-tree=/home/reborn'
