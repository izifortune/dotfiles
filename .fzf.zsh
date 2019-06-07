# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/fortunatof/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}~/fortunatof/.fzf/bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "~/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "~/.fzf/shell/key-bindings.zsh"
