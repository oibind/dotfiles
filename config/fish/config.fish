if status is-interactive
and not set -q TMUX
    exec tmux
end

. ~/.config/fish/aliases.fish

set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

export EDITOR='nvim'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .snapshots'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
