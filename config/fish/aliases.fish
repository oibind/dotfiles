## abbreviatons

# generic
abbr du 'du -h'
abbr df 'df -h'
abbr w 'wget -c'
abbr time 'time -f%E'
abbr c 'cd'
abbr . 'cd ..'
abbr .. 'cd ../..'
abbr l 'ls'
abbr p 'cp'
abbr m 'mkdir'
abbr t 'tmux'
abbr v 'nvim'
abbr n 'nvim'
abbr SS 'sudo systemctl'
abbr h 'htop'
abbr i 'get_iplayer'
abbr iu 'get_iplayer --url'
abbr ig 'get_iplayer --get'
abbr yt 'youtube-dl --add-metadata -i'

# tar specific
abbr tgz 'tar -xvzf'
abbr tbz 'tar -xvjf'

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
abbr yu 'yay -Syu'
abbr yr 'sudo pacman -Rnsc'
abbr yro 'sudo pacman -Rns (pacman -Qtdq)'
abbr yc 'yay -Sc'
abbr yp 'yay -Ps'

# usb mounting
abbr m 'udisksctl mount -b'
abbr um 'udisksctl unmount -b'

## aliases
alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm 'rm -vI'
alias mkdir 'mkdir -pv'
alias ls 'exa --color=always --group-directories-first'
alias git 'hub'
alias vim 'nvim'
alias vimdiff 'nvim -d'
alias xlcip 'xclip -selection clipboard'
alias x 'z'
alias top 'htop'
alias grep 'rg'

## functions

# archive extraction
function ex --description "Expand or extract bundled & compressed files"
  set --local ext (echo $argv[1] | awk -F. '{print $NF}')
  switch $ext
    case tar  # non-compressed, just bundled
      tar -xvf $argv[1]
    case gz
      if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar  # tar bundle compressed with gzip
        tar -zxvf $argv[1]
      else  # single gzip
        gunzip $argv[1]
      end
    case tgz  # same as tar.gz
      tar -zxvf $argv[1]
    case bz2  # tar compressed with bzip2
      tar -jxvf $argv[1]
    case rar
      unrar x $argv[1]
    case zip
      unzip $argv[1]
    case '*'
      echo "unknown extension"
  end
end

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
