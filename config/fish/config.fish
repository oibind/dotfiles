if status is-interactive
and not set -q TMUX
    exec tmux
end

. ~/.config/fish/aliases.fish

export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .snapshots'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
