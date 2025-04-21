# ╭──────────────────────────────╮
# │       🌙 ZSH Config ✨       │
# ╰──────────────────────────────╯

# --- Shell Options ---
export EDITOR="nvim"                          # Set default editor to Neovim
setopt autocd                                # cd into directories without typing 'cd'
setopt correct                               # auto-correct small typos in commands
setopt histignorealldups                     # only keep latest duplicate in history
setopt share_history                         # share history between sessions
setopt equals

eval "$(/opt/homebrew/bin/brew shellenv)"


# --- Keybindings (Vi Mode) ---
bindkey -v                                    # Use vi keybindings (Insert/Normal mode)
export KEYTIMEOUT=1                           # Reduce delay when switching modes


# --- Essential Keybindings ---
# Arrow keys (insert + command mode)
bindkey -M viins '^[[A' up-line-or-history
bindkey -M viins '^[[B' down-line-or-history
bindkey -M viins '^[[C' forward-char
bindkey -M viins '^[[D' backward-char
bindkey -M vicmd '^[[A' up-line-or-history
bindkey -M vicmd '^[[B' down-line-or-history
bindkey -M vicmd '^[[C' forward-char
bindkey -M vicmd '^[[D' backward-char

# Backspace & Delete
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^[[3~' delete-char
bindkey -M vicmd '^[[3~' delete-char

# Home / End
bindkey -M viins '^[[H' beginning-of-line
bindkey -M viins '^[[F' end-of-line

# Word-wise motion (Alt-b / Alt-f)
bindkey -M viins '^[b' backward-word
bindkey -M viins '^[f' forward-word


# History search with up/down arrows (like bash)
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

source <(fzf --zsh)
# bindkey '^R' history-incremental-search-backward
bindkey '^R' fzf-history-widget


# --- Plugins ---
INSTALL_SCRIPT="${HOME}/.zsh/install_plugins.zsh"
source $INSTALL_SCRIPT


# https://github.com/Phantas0s/.dotfiles/blob/cb761b6a72e3593881dea6c0e922c71d0b6b81aa/zsh/completion.zsh
# --- Completion system (AFTER plugins and bindkeys)
autoload -Uz compinit && compinit

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=** r:|=**'


# TODO find out why visual mode doesn't work
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) mode="[N]" ;;
    viins|main) mode="[I]" ;;
    vivis) mode="[V]" ;;
    *) mode="[?]" ;;
  esac
  # use %F{white}%*%f instead for white text
  # RPS1="$mode %D{%H:%M:%S} "
  RPS1="$mode %*%f "
  RPS2="$RPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# --- Prompt Setup ---
autoload -Uz colors && colors
setopt PROMPT_SUBST
autoload -Uz vcs_info

# vcs_info configuration (only once)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'       # Show current Git branch

precmd() { vcs_info }

PROMPT='%F{magenta}🌙%f %F{blue}%n@%m%f %F{cyan}%~%f $(git_prompt_info) > '

# Git prompt info function
function git_prompt_info() {
  echo $vcs_info_msg_0_
}

# --- Aliases ---
alias la='ls -lah'
alias ll='ls -lh'

alias tree='tree -a -I .git'

# -S truncate long lines instead of wrap
# -R enable colors and links
# -N line numbers
# -I case insensitive search
# #.1 horizontal scroll speed = 1/10 of screen
export LESS='-SRN -#.1 --ignore-case --mouse --wheel-lines=5'

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY


#  --color="bg+:-1,\
# fg:gray,\
# fg+:white,\
# border:black,\
# spinner:0,\
# hl:yellow,\
# header:blue,\
# info:green,\
# pointer:red,\
# marker:blue,\
# prompt:gray,\
# hl+:red"


