
#########################
# NAVIGATION
#########################

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias projects='cd /mnt/d/projects'

#########################
# DIRECTORIES 
#########################

LS_FLAGS="--all --group-directories-first --time-style=relative --sort=name --hyperlink --no-permissions --icons=never"
alias ll="eza ${LS_FLAGS} --long --binary --modified --git --classify"
alias l='eza --git-ignore ${LS_FLAGS}'
alias llm='eza --all --header --long --sort=modified ${LS_FLAGS}'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree ${LS_FLAGS}'
alias tree='eza --tree ${LS_FLAGS}'
alias home="cd ~"
alias ddisk="cd /mnt/d"

#########################
# SHORTCUTS 
#########################

alias zshrc="vim ~/.zshrc"
alias vimrc="cd ~/.config/nvim"
alias config.alacritty="vim /mnt/c/Users/jackm/AppData/Roaming/alacritty/alacritty.toml"
alias config.tmux="vim ~/.config/tmux/tmux.conf.local"
alias map="xargs -n1"

alias g="git"
alias gs="git status";
alias gp="git push";
alias gd="git diff";
alias gc="git commit -m";
alias gac="git add .; git commit -m";
alias gaa="git add .";
alias gb="git branch";
alias gco="git checkout";
alias gp="git pull";

alias custom="cd ${ZSH_CUSTOM}"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dprune="docker system prune --all"
alias copy="xclip"

for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias $method="lwp-request -m $method"
done

alias vimalias='vim ~/.oh-my-zsh/custom/aliases.zsh'
alias vimfunc="vim ~/.oh-my-zsh/custom/functions.zsh"
alias vim="nvim"
#########################
# MISC 
#########################
alias reload="exec zsh -l"
alias gitignore_origin="git config --list --show-origin"

#########################
# MISC 
#########################

alias newenv="uv venv"
alias env="source .venv/bin/activate"
alias exitenv="deactivate"
#. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"

alias ssh='ssh.exe'
alias ssh-add='ssh-add.exe'
