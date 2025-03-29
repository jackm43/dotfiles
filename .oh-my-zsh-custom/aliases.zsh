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
alias ls='ls'
alias dir='dir'
alias vdir='vdir'
alias home="cd /home/jackm"

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
alias vimrc="vim ~/.vim_runtime/my_configs.vim"

alias gstatus="git status -s | fzf --multi --preview 'git diff --color=always {2}' --preview-window=right:70% --bind 'ctrl-a:execute(git add {2})+reload(git status -s),enter:execute(vim {2})'"
alias gadd="git ls-files -m | fzf --multi --preview 'git diff --color=always {}' --preview-window=right:70% | xargs git add"
alias gdiff="git ls-files -m | fzf --preview 'git diff --color=always {}' --preview-window=right:70% | xargs git diff"

alias map="xargs -n1"
alias custom="cd ${ZSH_CUSTOM}"
alias dcomposeup="sudo docker compose up -d"
alias dcomposedown="sudo docker compose down"
alias dps="sudo docker ps"
alias dpsa="sudo docker ps -a"
alias dpruneall="sudo docker system prune --all"
alias copy="xclip"
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

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

