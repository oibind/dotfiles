alias ccat 'highlight --out-format=ansi'
alias g 'hub'
alias y 'yay'
alias ys 'yay -Ss'
alias yi 'yay -S'
alias yu 'yay -Syu'
alias SS 'sudo systemctl'
alias weechat 'ssh ubuntu@irc.oibind.me -t "tmux attach -t irc"'
alias cp 'cp --reflink=auto'
alias git 'hub'
alias vim 'nvim'
alias xlcip 'xclip -selection c'

# process substitution
function delete_psub_tmp
  set files /tmp/.psub.*
    if count $files > /dev/null
      rm -f /tmp/.psub.*
  end
end

function fr
  delete_psub_tmp
  xargs -I _ -ra (pacman -Qe | awk '{print $1}' | fzf | psub) yay -Rnsc _
  delete_psub_tmp
end

function fe
  fzf | xargs -r -I % $EDITOR %;
end

function fhe
  find ~/ -type f -mtime -14 ! -path "*cache*" ! -path "*mozilla*" | \
  cut -d'/' -f4- | fzf | xargs -r -I % $EDITOR %;
end

function sprunge
  curl -F 'sprunge=<-' http://sprunge.us $argv;
end
