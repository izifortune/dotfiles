# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/fortunatof/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/fortunatof/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/fortunatof/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/fortunatof/.fzf/shell/key-bindings.zsh"
