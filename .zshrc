# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/fortunatof/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(git fzf nvm brew httpie vi-mode z zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v=nvim

function toggle_proxy {
  if [ -z "$http_proxy" ]; then
    echo "setting up proxy"
    export http_proxy='http://proxy03.corp.ryanair.com:3128'
    export https_proxy='http://proxy03.corp.ryanair.com:3128'
    export HTTP_PROXY='http://proxy03.corp.ryanair.com:3128'
    export HTTPS_PROXY='http://proxy03.corp.ryanair.com:3128'
  else
    echo "removing up proxy"
    export http_proxy=''
    export https_proxy=''
    export HTTP_PROXY=''
    export HTTPS_PROXY=''
  fi
}

alias define='googler -n 2 define'
alias g='googler -n 5 '

if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi
export VISUAL=nvim

prompt_dir() {
  prompt_segment blue black '%c'
}

prompt_context() {}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/fortunatof/code/homepage.ryanair.com/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/fortunatof/code/homepage.ryanair.com/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/fortunatof/code/homepage.ryanair.com/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/fortunatof/code/homepage.ryanair.com/node_modules/tabtab/.completions/sls.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias sonarrun=docker run -d --name sonarqube -p 9000:9000 sonarqube:latest
alias ggpushpr='git push origin (current_branch) 2>&1 | grep "https://s" | sed "s/[^ ]* *//" | pbcopy'
alias lg='lazygit'

autoload -U compinit; compinit


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# zscaler
export NODE_EXTRA_CA_CERTS=~/zscaler.pem
export AWS_CA_BUNDLE=~/zscaler.pem
