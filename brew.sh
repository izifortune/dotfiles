mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
pip3 install neovim howdoi --user

# Hammerspoon
# TODO Review if necessary
mkdir -p $HOME/.hammerspoon/hs

# Added TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Fonts
cp /usr/local/etc/fonts/fonts.conf.bak /usr/local/etc/fonts/fonts.conf
git clone https://github.com/powerline/fonts.git
./fonts/install.sh

#Fish shell
# echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /bin/zsh

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fisher add z
fisher add edc/bass
fisher add cprintf
fisher add patrickf3139/fzf.fish
fisher add grc
fisher add jorgebucaran/nvm.fish

curl -L https://get.oh-my.fish | fish
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
omf install bobthefish
omf install pyenv

git config --global push.default current

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

brew link imagemagick 
# pywal
git clone https://github.com/robwaz/pywal ~/code/pywal
cd pywal
sudo pip3 install -e ./
brew cleanup


