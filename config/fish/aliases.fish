## abbreviations

# generic
abbr du 'du -h'
abbr df 'df -P -kHl --exclude-type=tmpfs --exclude-type=devtmpfs'
abbr w 'wget -c'
abbr time 'time -f%E'
abbr c 'cd'
abbr . 'cd ..'
abbr .. 'cd ../..'
abbr l 'lf'
abbr p 'cp'
abbr mk 'mkdir'
abbr r 'rm'
abbr v 'nvim'
abbr n 'nvim'
abbr SS 'sudo systemctl'
abbr h 'htop'
abbr i 'get_iplayer'
abbr iu 'get_iplayer --url'
abbr ig 'get_iplayer --get'
abbr yt 'youtube-dl --add-metadata -ic'
abbr yta 'youtube-dl --add-metadata -ixc -f bestaudio/best'
abbr e 'ex'
abbr ne 'newsboat'

# git specific
abbr g 'git'
abbr gg 'git clone'
abbr gb 'git branch'
abbr gco 'git checkout'
abbr gcb "git checkout -b bugfix/(uuidgen | cut -d- -f1)"
abbr gcf "git checkout -b feature/(uuidgen | cut -d- -f1)"
abbr gm 'git merge'
abbr gs 'git status'
abbr gl 'git log --graph --decorate --oneline'
abbr gd 'git diff'
abbr ga 'git add . && git commit'
abbr gaa 'git add'
abbr gc 'git commit'
abbr gp 'git push'
abbr gpf 'git push --force'
abbr gr 'git rebase'
abbr gcm 'git checkout main'
abbr gbd 'git branch -D'
abbr gi 'git init'
abbr gy 'git pull'
abbr gu 'git reset --hard HEAD~'
abbr grc 'git reset --soft HEAD~2 && git commit'

# yay/pacman specific
abbr y 'yay'
abbr ys 'yay -Ss'
abbr yi 'yay -S'
abbr yu 'yay -Syyu'
abbr yr 'sudo pacman -Rnsc'
abbr yro 'sudo pacman -Rns (pacman -Qtdq)'
abbr yc 'yay -Sc --noconfirm'
abbr yp 'yay -Ps'
abbr ym 'sudo reflector --country Ireland --country "United Kingdom" --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

# usb mounting
abbr m 'udisksctl mount -b'
abbr um 'udisksctl unmount -b'

## aliases
alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm 'rm -vI'
alias mkdir 'mkdir -pv'
alias ls 'exa --color=always --group-directories-first --ignore-glob=lost+found --ignore-glob="System Volume Information"'
alias la 'ls -a'
alias ll 'ls -l'
alias git 'hub'
alias vim 'nvim'
alias vimdiff 'nvim -d'
alias pbcopy 'xclip -selection clipboard'
alias pbpaste 'xclip -out'
alias x 'z'
alias top 'htop'
alias grep 'rg'
alias local 'ip -o route get to 8.8.8.8 | sed -n "s/.*src \([0-9.]\+\).*/\1/p"'
alias global 'dig +short myip.opendns.com @resolver1.opendns.com'
alias bc 'bc -q'

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
