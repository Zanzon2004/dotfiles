# Check if Vim mode is enabled
[[ $(bindkey | grep -c 'vi') -gt 0 ]] && VIM_MODE="enabled" || VIM_MODE="disabled"

# Banner
echo "╭─ $USER @ $HOST"
echo "│ Dir: $PWD"
if git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "│ Git: $(git symbolic-ref --short HEAD 2>/dev/null)"
fi
echo "│ Shell: $SHELL (Vim mode: $VIM_MODE)"
echo "╰─"

# set up prompt
PROMPT='%F{blue}%~%f %F{cyan}>%f '

