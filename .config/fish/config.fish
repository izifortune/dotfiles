source ~/.fish_aliases
source ~/.local.fish

function pythonserve
  if [ "$1" != "" ]
    then
      python -m SimpleHTTPServer $1
  else
    python -m SimpleHTTPServer 8000
  end
end

function toggle_proxy
  if [ -z "$http_proxy" ]
    echo "setting up proxy";
    set -g -x http_proxy '10.11.19.40:8080'
    set -g -x https_proxy '10.11.19.40:8080'
    set -g -x HTTP_PROXY '10.11.19.40:8080'
    set -g -x HTTPS_PROXY '10.11.19.40:8080'

  else
    echo "removing up proxy";
    set -g -x http_proxy ''
    set -g -x https_proxy ''
    set -g -x HTTP_PROXY ''
    set -g -x HTTPS_PROXY ''
  end
end

set -gx PATH ~/Library/Python/2.7/bin $PATH
set -gx PATH ~/Library/Python/3.6/bin $PATH

set -gx PATH ~/.config/bin $PATH

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
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish