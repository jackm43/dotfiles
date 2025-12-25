#!/usr/bin/env bash

set -e



ZSH="$HOME/.oh-my-zsh"



#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended



git clone https://github.com/jackm43/dotfiles.git "$HOME/dotfiles"



#mkdir -p "$ZSH/custom"



cp "$HOME/dotfiles/.oh-my-zsh-custom/aliases.zsh" "$ZSH/custom/aliases.zsh"

cp "$HOME/dotfiles/.oh-my-zsh-custom/exports.zsh" "$ZSH/custom/exports.zsh"

cp "$HOME/dotfiles/.oh-my-zsh-custom/functions.zsh" "$ZSH/custom/functions.zsh"



ln -sf "$HOME/dotfiles/.oh-my-zsh-custom/aliases.zsh" "$ZSH/custom/aliases.zsh"

ln -sf "$HOME/dotfiles/.oh-my-zsh-custom/exports.zsh" "$ZSH/custom/exports.zsh"

ln -sf "$HOME/dotfiles/.oh-my-zsh-custom/functions.zsh" "$ZSH/custom/functions.zsh"



cp "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"

ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

exec zsh -l
