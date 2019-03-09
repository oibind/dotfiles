abbr v 'nvim'
abbr g 'git'
abbr gg 'git clone'
abbr gb 'git branch'
abbr gco 'git checkout'
abrr gm 'git merge'
abbr gs 'git status'
abbr gl 'git log'
abbr gd 'git diff'
abbr ga 'git add'
abbr gc 'git commit'
abbr gp 'git push'
abbr y 'yay'
abbr ys 'yay -Ss'
abbr yi 'yay -S'
abbr yu 'yay -Syu'
abbr SS 'sudo systemctl'

alias ccat 'highlight --out-format=ansi'
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
  cut -d'/' -f4- | fzf | xargs -r -I % $EDITOR ~/%;
end

function sprunge
  curl -F 'sprunge=<-' http://sprunge.us $argv;
end
