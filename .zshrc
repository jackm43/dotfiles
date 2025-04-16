export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export QLTY_INSTALL="$HOME/.qlty"
export RPROMPT='%t'
export PATH="$QLTY_INSTALL/bin:$PATH"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"


# -------------------
# THEME
#  -------------------

ZSH_THEME="robbyrussell"


# -------------------
# Options
# -------------------

zstyle ':omz:update' frequency 7

setopt EXTENDED_HISTORY          # Write history in ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to history immediately.
setopt SHARE_HISTORY             # Share history between sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate events first.
setopt HIST_IGNORE_DUPS          # Skip immediately repeated commands.
setopt HIST_IGNORE_ALL_DUPS      # Remove older duplicates.
setopt HIST_FIND_NO_DUPS         # Hide dupes when searching.
setopt HIST_IGNORE_SPACE         # Skip commands that start with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write dupes to file.
setopt HIST_VERIFY               # Confirm before executing from history.
setopt APPEND_HISTORY            # Append instead of overwrite.
setopt HIST_NO_STORE             # Don't log history commands (like `history`).

HIST_STAMPS="dd.mm.yyyy"
DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# -------------------
# Plugins
# -------------------

plugins=(aliases z gitignore zsh-autosuggestions)

# Custom plugin path for completions

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# -------------------
# Oh My Zsh
# -------------------

source $ZSH/oh-my-zsh.sh

