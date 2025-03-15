alias sudo='sudo '

alias ls='ls'
alias dir='dir'
alias vdir='vdir'

alias grep='grep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias egrep='egrep --colour=auto'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias projects='cd /mnt/chatting/projects'
alias nas='cd /mnt/nas'

#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
LS_FLAGS="--all --group-directories-first --time-style=relative --sort=name --hyperlink --no-permissions --icons=never"
alias ls="eza ${LS_FLAGS}"
alias ll="eza ${LS_FLAGS} --long --binary --modified --git --classify"
alias l="ls"
alias tree="ll --tree"


alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias mntproj='sudo mount -t nfs 192.168.1.83:/volume1/projects /mnt/nas'
alias mntmedia='sudo mount -t nfs 192.168.1.83:/volume1/collections /mnt/nas_media'

alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

alias reload="exec ${SHELL} -l"

alias map="xargs -n1"

alias ideas="vim /mnt/chatting/projects/ideas.md"
alias custom="cd ${ZSH_CUSTOM}"
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

alias gitignore_origin="git config --list --show-origin"
#➜  custom git:(master) ✗ git rev-parse --show-toplevel
#/home/jackm/.oh-my-zsh
#➜  custom git:(master) ✗ dotfiles rev-parse --show-toplevel
#/home/jackm
#➜  custom git:(master) ✗ cd /home/jackm
#"
