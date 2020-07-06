## abbreviatons

# generic
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
abbr SS 'sudo systemctl'

# git specific
abbr g 'git'
abbr gg 'git clone'
abbr gb 'git branch'
abbr gco 'git checkout'
abbr gcb 'git checkout -b'
abbr gm 'git merge'
abbr gs 'git status'
abbr gl 'git log'
abbr gd 'git diff'
abbr gaa 'git add . && git commit'
abbr ga 'git add'
abbr gc 'git commit'
abbr gp 'git push'
abbr gr 'git rebase'
abbr gcm 'git checkout master'
abbr gbd 'git branch -D'
abbr gi 'git init'
abbr gy 'git pull'

# yay/pacman specific
abbr y 'yay'
abbr ys 'yay -Ss'
abbr yi 'yay -S'
abbr yu 'yay -Syu'
abbr yr 'sudo pacman -Rnsc'
abbr yro 'sudo pacman -Rns (pacman -Qtdq)'
abbr yc 'yay -Sc'
abbr yp 'yay -Ps'

# usb mounting
abbr m 'udisksctl mount -b'
abbr um 'udisksctl unmount -b'

## aliases
alias ls 'ls --color --ignore=lost+found'
alias git 'hub'
alias vim 'nvim'
alias xlcip 'xclip -selection clipboard'

## functions

# arch specific
function fr
  delete_psub_tmp
  xargs -I _ -ra (pacman -Qe | awk '{print $1}' | fzf | psub) yay -Rnsc _
  delete_psub_tmp
end

# find and edit files
function fe
  fzf | xargs -r -I % $EDITOR %;
end

function fhe
  find ~/ -type f -mtime -14 ! -path "*cache*" ! -path "*mozilla*" | \
  cut -d'/' -f4- | fzf | xargs -r -I % $EDITOR ~/%;
end

# terminal pastebin
function sprunge
  curl -F 'sprunge=<-' http://sprunge.us $argv;
end
