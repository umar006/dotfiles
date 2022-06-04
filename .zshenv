#!/bin/zsh

# XDG defaults
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# ZSH settings
export ZDOTDIR="$HOME"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Virtualenvwrapper settings:
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/Devel"
export VIRTUALENVWRAPPER_PYTHON="$HOME/.asdf/shims/python3"
export VIRTUALENVWRAPPER_VIRTUALENV="$HOME/.local/bin/virtualenv"

# Programming languages and their dependenices
export LOCALBIN="$HOME/.local/bin"
export NVIMBIN="$HOME/neovim/bin"
export YARNBIN="$HOME/.yarn/bin"

# PATH configuration
export PATH="$LOCALBIN:$PATH"
export PATH="$NVIMBIN:$PATH"
export PATH="$YARNBIN:$PATH"
