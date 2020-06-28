mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
pip3 install neovim
npm install -g neovim typescript eslint tslint http-server postcss-syntax bash-language-server

# Hammerspoon
# TODO Review if necessary
mkdir -p $HOME/.hammerspoon/hs
git clone https://github.com/dsanson/hs.tiling $HOME/.hammerspoon/hs/tiling

# Fonts
cp /usr/local/etc/fonts/fonts.conf.bak /usr/local/etc/fonts/fonts.conf
git clone https://github.com/powerline/fonts.git
./fonts/install.sh

#Fish shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fisher add z
fisher add edc/bass
fisher add cprintf
fisher add fzf
fisher add grc

curl -L https://get.oh-my.fish | fish
omf install bobthefish
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes


brew cleanup
