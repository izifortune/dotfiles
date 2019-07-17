# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/fortune/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/fortune/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/fortune/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/fortune/.fzf/shell/key-bindings.zsh"
