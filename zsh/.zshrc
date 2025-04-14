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

# --- Completion & Suggestions ---
zstyle ':completion:*' menu select            # Tab completion with menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=** r:|=**'

# History search with up/down arrows (like bash)
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

bindkey '^R' history-incremental-search-backward


# --- Plugins ---
ZSH_PLUGINS_DIR="${HOME}/.zsh_plugins"
INSTALL_SCRIPT="${HOME}/.zsh/install_plugins.zsh"

# Run install_plugins.zsh only if plugins aren't installed yet
if [[ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" || ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]]; then
  echo "🍓 Setting up your plugins for the first time..."
  [[ -x "$INSTALL_SCRIPT" ]] && "$INSTALL_SCRIPT"
fi


# https://github.com/Phantas0s/.dotfiles/blob/cb761b6a72e3593881dea6c0e922c71d0b6b81aa/zsh/completion.zsh
# --- Completion system (AFTER plugins and bindkeys)
autoload -Uz compinit && compinit

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select


# TODO find out why visual mode doesn't work
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) mode="[ N ]" ;;
    viins|main) mode="[ I ]" ;;
    vivis) mode="[ V ]" ;;
    *) mode="[ ??? ]" ;;
  esac
  RPS1="$mode"
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

# Prompt formats
# PROMPT='%F{magenta}☾%f %F{blue}%n@%m%f %F{cyan}%~%f $(git_prompt_info) > '
PROMPT='%F{magenta}🌙%f %F{blue}%n@%m%f %F{cyan}%~%f $(git_prompt_info) > '
RPROMPT='${vi_mode_indicator} %F{white}%*%f'

# Git prompt info function
function git_prompt_info() {
  echo $vcs_info_msg_0_
}

# --- Aliases ---
alias la='ls -lah'
alias ll='ls -lh'

# eval export HOMEBREW_PREFIX="/opt/homebrew";
# export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
# export HOMEBREW_REPOSITORY="/opt/homebrew";
# fpath[1,0]="/opt/homebrew/share/zsh/site-functions";
# PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Applications/Ghostty.app/Contents/MacOS"; export PATH;
# [ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
# export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

eval "$(/opt/homebrew/bin/brew shellenv)"

