# abbreviatons
abbr du 'du -h'
abbr df 'df -h'
abbr w 'wget -c'
abbr time 'time -f%E'
abbr c. 'cd ..'
abbr c 'cd'
abbr l 'ls'
abbr p 'cp'
abbr t 'tmux'
abbr v 'nvim'
abbr n 'nvim'

# git specific
abbr g 'git'
abbr gg 'git clone'
abbr gb 'git branch'
abbr gco 'git checkout'
abbr gm 'git merge'
abbr gs 'git status'
abbr gl 'git log'
abbr gd 'git diff'
abbr ga 'git add .'
abbr gc 'git commit'
abbr gp 'git push'
abbr gr 'git rebase'

# arch specific
abbr y 'yay'
abbr ys 'yay -Ss'
abbr yi 'yay -S'
abbr yu 'yay -Syu'
abbr yr 'sudo pacman -Rnsc'
abbr yro 'sudo pacman -Rns (pacman -Qtdq)'
abbr yc 'yay -Sc'

abbr SS 'sudo systemctl'

# USB mounting
abbr m 'udisksctl mount -b'
abbr um 'udisksctl unmount -b'

alias ls 'ls --color --ignore=lost+found'
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
