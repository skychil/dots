### zinit installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit installer

# starship (fast prompt)
zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship

# spaceship prompt
#zinit light spaceship-prompt/spaceship-prompt

# Kitty integration
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# fast syntax highlighting on the command line
zinit ice wait"0c" lucid atinit"zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

# Type 3 dots for ../..
zinit autoload'#manydots-magic' for knu/zsh-manydots-magic

# Prompt Auto Suggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# history substring searching
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Pg up/down
bindkey '^[[5~' history-substring-search-down
bindkey '^[[6~' history-substring-search-up

# tab completions
zinit ice wait"0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# ripgrep (super fast grep replacement)
zinit ice as"program" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"
zinit light BurntSushi/ripgrep

# fzf (fuzzy finder)
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf

# bind multiple widgets using fzf
#zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
#zinit light junegunn/fzf

# Replace zsh's completion selection menu with fzf
#zinit ice wait"1" lucid
#zinit light Aloxaf/fzf-tab

# fd (find replacement)
#zinit ice as"program" from"gh-r" mv"fd* -> fd" pick"fd/fd"
#zinit light sharkdp/fd

# bat (cat replacement)
# TODO: automate vdi flow
# wget https://github.com/sharkdp/bat/releases/download/v0.18.3/bat-v0.18.3-x86_64-unknown-linux-musl.tar.gz
# untar
# mv bin to path
# ln completions file bat.zsh => _bat
# ln man file
# zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat" atload"alias bat=bat"
# zinit light sharkdp/bat

# bat extras
#zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
#zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
#zinit light eth-p/bat-extras
#alias rg=batgrep.sh
#alias bd=batdiff.sh

# delta (diff-so-fancy replacement, colorized git output)
#zinit ice lucid wait"0" as"program" from"gh-r" pick"delta*/delta"
#zinit light 'dandavison/delta'

# forgit (git command line UI)
#zinit ice wait lucid
#zinit load 'wfxr/forgit'

# exa (ls replacement) # not needed with broot
# zinit ice wait"2" lucid from"gh-r" as"program" mv"bin/exa* -> exa"
# zinit light ogham/exa
# zinit ice wait blockf atpull'zinit creinstall -q .'

# dust (du replacement) // Requires glibc 2.18 :(
#zinit ice lucid wait"2" as"program" from"gh-r" mv"dust*/dust -> dust" pick"dust" atload"alias du=dust"
#zinit light bootandy/dust

# duf (df replacement)
#zinit ice lucid wait"0" as"program" from"gh-r" bpick='*linux_amd64.deb' pick"usr/bin/duf" atload"alias df=duf"
#zinit light muesli/duf

# Vim (needs ncurses)
#zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
#zinit light vim/vim

# lf (best terminal file manager)
zinit ice wait lucid as"program" from"gh-r"
zinit light gokcehan/lf

# lfcd (lf with cd)
zinit ice lucid atload"alias lf=lfcd"
zinit snippet "https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh"
#bindkey -s '^o' 'lfcd\n'

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=10000000
SAVEHIST=10000000

# Options
setopt BANG_HIST  # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY  # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY  # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY  # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS  # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS  # Do not display a line previously found.
setopt HIST_IGNORE_SPACE  # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS  # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS  # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY  # Don't execute immediately upon history expansion.
setopt HIST_BEEP  # Beep when accessing nonexistent history.

setopt always_to_end  # cursor moved to the end in full completion
setopt hash_list_all  # hash everything before completion
setopt always_to_end  # when completing from the middle of a word, move cursor to its end
setopt complete_in_word  # allow completion from within a word/phrase
setopt nocorrect  # spelling correction for commands
setopt list_ambiguous  # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
setopt autocd # Switch to directory by typing its name
unsetopt BEEP

### Environment Variables

# Set defaut programs
export EDITOR=vim
export VISUAL=vim
export DIFFPROG=delta
#export DIFFPROG=meld
#export PAGER=less

export MOZ_ENABLE_WAYLAND=1

# Aliases
source "$HOME/dots/zsh/.aliases"


# QMK
# PATH=$PATH:$HOME/.local/bin

# Put global npm modules in home dir
# PATH="$HOME/.node_modules/bin:$PATH"
# export npm_config_prefix=~/.node_modules

# Set Fuzzy File Search Default
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,node_modules}/*"'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"



### fzf settings
# Set Fuzzy File Search Default
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"
#--prompt=''
export FZF_DEFAULT_OPTS="
--ansi
--layout=default
--info=inline
--height=50%
--multi
--preview-window=right:50%
--preview-window=sharp
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--pointer='|>'
--marker='✓'
--bind 'ctrl-e:execute(vim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Update window title to current directory
precmd () {print -Pn "\e]0;zsh %~\a"}

### PATH
# Portable executables
export PATH=$HOME/.local/bin:$PATH

# Conda
export PATH=$HOME/.local/miniconda3/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sky.chilstedt/.local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sky.chilstedt/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sky.chilstedt/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sky.chilstedt/.local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Add cd script for broot
#source /home/sky.chilstedt/.config/broot/launcher/bash/br

# Launch Starship Prompt
#eval "$(/home/sky.chilstedt/.local/bin/starship init zsh)"
