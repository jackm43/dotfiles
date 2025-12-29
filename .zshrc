export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export QLTY_INSTALL="$HOME/.qlty"
export RPROMPT='%t'
export PATH="$QLTY_INSTALL/bin:$PATH"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

export EDITOR="vim"
ZSH_THEME="robbyrussell"

# -------------------
# Options
# -------------------

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
#ENABLE_CORRECTION="true"
#DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_COMPFIX="true"
# -------------------
# Plugins
# -------------------

plugins=(
    #gitfast
    httpie
    zsh-autosuggestions
    zsh-syntax-highlighting
    uv
    bazel
)

# -------------------
# Oh My Zsh
# -------------------

# Cache completions aggressively

autoload -Uz compinit

if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then

    compinit

else

    compinit -C

fi

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#663399,standout"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

#indkey " " globalias
bindkey "^[[Z" magic-space
bindkey -M isearch " " magic-space

#setopt MENU_COMPLETE
#setopt AUTO_MENU
#setopt AUTO_LIST
#setopt AUTO_PARAM_SLASH 




export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
