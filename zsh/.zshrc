# Execute commands at the start of an interactive session.

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Custom aliases
alias ll='ls -latr --color=auto'
alias ls='ls --color=auto'
alias pacman='sudo pacman'

# Set defaut programs
export DIFFPROG=meld
export VISUAL=vim
export EDITOR=vim

# Start firefox in wayland mode
export MOZ_ENABLE_WAYLAND=1

# QMK
PATH=$PATH:$HOME/.local/bin

# Put global npm modules in home dir
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# Set Fuzzy File Search Default
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"
