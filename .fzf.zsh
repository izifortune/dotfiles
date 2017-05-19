# Setup fzf
# ---------
export PATH="$PATH:.fzf/bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source ".fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source ".fzf/shell/key-bindings.zsh"

