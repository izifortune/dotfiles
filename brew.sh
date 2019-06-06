# z hopping around folders
brew install z

# run this script when this file changes guy.
brew install entr

# github util. gotta love `hub fork`, `hub create`, `hub checkout <PRurl>`
brew install hub


# mtr - ping & traceroute. best.
brew install mtr

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr


# Install other useful binaries
brew install the_silver_searcher
brew install fzf

brew install git
brew install imagemagick@6 --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install pv
brew install rename
brew install tree
brew install zopfli
brew install ffmpeg --with-libvpx

brew install terminal-notifier

brew install pidcat   # colored logcat guy

brew install ncdu # find where your diskspace went

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

brew install python3

pip3 install neovim

brew tap neovim/neovim

brew install neovim

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

mkdir -p $HOME/.hammerspoon/hs
git clone https://github.com/dsanson/hs.tiling $HOME/.hammerspoon/hs/tiling

cat brew.list | xargs brew install
brew cleanup

#Fish shell
brew install fontconfig
cp /usr/local/etc/fonts/fonts.conf.bak /usr/local/etc/fonts/fonts.conf
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
brew install fish --HEAD
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
brew install --with-default-names gnu-sed
fisher z
fisher edc/bass
fisher cprintf
fisher fzf
brew install grc; fisher grc

brew tap caskroom/fonts
brew install font-firacode-nerd-font
brew install ripgrep
brew install tmux

brew tap koekeishiya/formulae
brew install chunkwm
brew install koekeishiya/formulae/skhd
brew install ranger

curl -L https://get.oh-my.fish | fish
omf install bobthefish

