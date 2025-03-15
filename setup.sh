# Create directory for the bare repository
#git clone --bare https://github.com/jackm43/dotfiles.git $HOME/.dotfiles

#alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#dotfiles checkout

#dotfiles config --local status.showUntrackedFiles no
# Create Oh My Zsh custom directory if it doesn't exist
mkdir -p ~/.oh-my-zsh-custom

# Copy existing files if they exist, otherwise create empty ones
if [ -f ~/.oh-my-zsh/custom/aliases.zsh ]; then
    cp ~/.oh-my-zsh/custom/aliases.zsh ~/.oh-my-zsh-custom/
else
    touch ~/.oh-my-zsh-custom/aliases.zsh
fi

if [ -f ~/.oh-my-zsh/custom/exports.zsh ]; then
    cp ~/.oh-my-zsh/custom/exports.zsh ~/.oh-my-zsh-custom/
else
    touch ~/.oh-my-zsh-custom/exports.zsh
fi

if [ -f ~/.oh-my-zsh/custom/functions.zsh ]; then
    cp ~/.oh-my-zsh/custom/functions.zsh ~/.oh-my-zsh-custom/
else
    touch ~/.oh-my-zsh-custom/functions.zsh
fi

# Create symbolic links
ln -sf ~/.oh-my-zsh-custom/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -sf ~/.oh-my-zsh-custom/exports.zsh ~/.oh-my-zsh/custom/exports.zsh
ln -sf ~/.oh-my-zsh-custom/functions.zsh ~/.oh-my-zsh/custom/functions.zsh

# Add to dotfiles repository
dotfiles add ~/.oh-my-zsh-custom/aliases.zsh
dotfiles add ~/.oh-my-zsh-custom/exports.zsh
dotfiles add ~/.oh-my-zsh-custom/functions.zsh
