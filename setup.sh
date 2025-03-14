# Create directory for the bare repository
git clone --bare https://github.com/jackm43/dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles checkout

dotfiles config --local status.showUntrackedFiles no

source ~/.bashrc

# dotfiles commit -m "Add .bashrc"
# dotfiles push -u origin main
# dotfiles push
