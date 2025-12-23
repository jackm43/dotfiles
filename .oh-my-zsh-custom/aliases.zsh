#########################
# SEARCHING 
#########################

alias grep='grep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias egrep='egrep --colour=auto'

#########################
# NAVIGATION
#########################

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias projects='cd /mnt/chatting/projects'
alias nas='cd /mnt/nas'
alias dir='dir'
alias vdir='vdir'
alias home="cd $HOME"

#########################
# DIRECTORIES 
#########################

LS_FLAGS="--all --group-directories-first --time-style=relative --sort=name --hyperlink --no-permissions --icons=never"
alias ls="eza ${LS_FLAGS}"
alias ll="eza ${LS_FLAGS} --long --binary --modified --git --classify"
alias tree="ll --tree"

alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'
alias home="cd ~"
alias ddisk="cd /mnt/d"

#########################
# SHORTCUTS 
#########################

alias ideas="vim /mnt/chatting/projects/ideas.md"
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vim_runtime/my_configs.vim"
alias kittyconf="vim ~/.config/kitty/kitty.conf"
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
	alias "${method}"="lwp-request -m '${method}'"
done
alias a="alias_list"
alias aliasgrep="alias_list"
alias aliasfind="alias_list"
alias vimalias='vim ~/.oh-my-zsh/custom/aliases.zsh'
alias vimfunc="vim ~/.oh-my-zsh/custom/functions.zsh"
alias h="fh"
alias history-stat='history 0 | awk ''{print $2}'' | sort | uniq -c | sort -n -r | head'
alias iplocal="ip addr | grep 192 | awk '{print $2}' | cut -d'/' -f1"
which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'
alias lint="qlty"

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
. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

#➜  custom git:(master) ✗ git rev-parse --show-toplevel
#/home/jackm/.oh-my-zsh
#➜  custom git:(master) ✗ dotfiles rev-parse --show-toplevel
#/home/jackm
#➜  custom git:(master) ✗ cd /home/jackm

