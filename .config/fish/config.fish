source ~/.fish_aliases
source ~/.local.fish

function toggle_proxy
  if [ -z "$http_proxy" ]
    echo "setting up proxy";
    set -g -x http_proxy 'http://10.11.19.40:8080'
    set -g -x https_proxy 'http://10.11.19.40:8080'
    set -g -x HTTP_PROXY 'http://10.11.19.40:8080'
    set -g -x HTTPS_PROXY 'http://10.11.19.40:8080'
    # set -g -x NO_PROXY 'assets.ryanair.com'

  else
    echo "removing up proxy";
    set -g -x http_proxy ''
    set -g -x https_proxy ''
    set -g -x HTTP_PROXY ''
    set -g -x HTTPS_PROXY ''
  end
end

set -gx PATH ~/.config/bin $PATH
set -gx PATH ~/.local/bin $PATH

#pyenv
status --is-interactive; and source (pyenv init -|psub)


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
#[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
#[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fishset -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -gx EDITOR nvim
set -g fish_user_paths "/usr/local/opt/mozjpeg/bin" $fish_user_paths

function img_size_folder
  mkdir $argv[1]
  cp $argv[2] $argv[1]
  cd $argv[1]
  # mogrify -resize $argv[1]x$argv[2]^ -gravity $argv[4] -crop $argv[1]x$argv[2]+0+600 $argv[3]
  mogrify -resize $argv[1] $argv[2]
  # imageOptim --directory ./
  cd ..
end

function create_image_sizes
  img_size_folder 1920 367 $argv[1] $argv[2]
  img_size_folder 1440 367 $argv[1] $argv[2]
  img_size_folder 1024 367 $argv[1] $argv[2]
  img_size_folder 450 210 $argv[1] $argv[2]
  img_size_folder 42 42 $argv[1] $argv[2]
end

function create_image_sizes_2
  img_size_folder 1140 $argv[1]
  img_size_folder 2280 $argv[1]
  img_size_folder 1024 $argv[1]
  img_size_folder 450 $argv[1]
  img_size_folder 42 $argv[1]
end

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

if status --is-interactive
  # set BASE16_SHELL "$HOME/.config/base16-shell/"
  # source "$BASE16_SHELL/profile_helper.fish"
end

set -g _Z_CMD "j"

set -g MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -g fish_key_bindings fish_vi_key_bindings

set -g FZF_DEFAULT_COMMAND 'fd --type f'


# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish

# MAN Page nvim
set MANPAGER 'nvim +Man!'
set MANWIDTH 999

# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
