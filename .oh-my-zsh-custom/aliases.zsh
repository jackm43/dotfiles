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
realbackup="cd /mnt/nas/backup/Projects"
#########################
# SHORTCUTS 
#########################

alias ideas="vim /mnt/chatting/projects/ideas.md"
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vim_runtime/my_configs.vim"
alias kittyconf="vim ~/.config/kitty/kitty.conf"
alias chmodx="find_chmod_sh"
alias gstatus="git status -s | fzf --multi --preview 'git diff --color=always {2}' --preview-window=right:70% --bind 'ctrl-a:execute(git add {2})+reload(git status -s),enter:execute(vim {2})'"
alias gadd="git ls-files -m | fzf --multi --preview 'git diff --color=always {}' --preview-window=right:70% | xargs git add"
alias gdiff="git ls-files -m | fzf --preview 'git diff --color=always {}' --preview-window=right:70% | xargs git diff"
alias gundo="git_undo_last_commit"
alias gitundo="git_undo_last_commit"
alias bookmarktomd="bookmarks_to_markdown"
alias map="xargs -n1"
alias custom="cd ${ZSH_CUSTOM}"
alias dcomposeup="sudo docker compose up -d"
alias dcomposedown="sudo docker compose down"
alias dps="sudo docker ps"
alias dpsa="sudo docker ps -a"
alias dprune="sudo docker system prune --all"
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

alias uvactivate="source .venv/bin/activate"

#########################
# MOUNTING 
#########################

alias mntproj='sudo mount -t nfs 192.168.1.83:/volume1/projects /mnt/nas'
alias mntmedia='sudo mount -t nfs 192.168.1.83:/volume1/Media/collections /mnt/nas_media'

#########################
# MISC 
#########################
alias reload="exec zsh -l"
alias gitignore_origin="git config --list --show-origin"
alias opensnitch_daemon="systemctl enable --now opensnitch.service"


#➜  custom git:(master) ✗ git rev-parse --show-toplevel
#/home/jackm/.oh-my-zsh
#➜  custom git:(master) ✗ dotfiles rev-parse --show-toplevel
#/home/jackm
#➜  custom git:(master) ✗ cd /home/jackm

