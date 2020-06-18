if status is-interactive
and not set -q TMUX
    exec tmux
end

# source aliases
. ~/.config/fish/aliases.fish

# source ~/.profile
env -i HOME=$HOME dash -l -c 'export -p' | \
  sed -e "/PATH/s/'//g;/PATH/s/:/ /g;s/=/ /;s/^export/set -x/;/PWD/d" | \
  source
