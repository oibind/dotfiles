alias cp 'cp --reflink=auto'
alias git 'hub'
alias vim 'nvim'
alias xlcip 'xclip -selection c'

function fe
        fzf | xargs -r -I % $EDITOR %;
end

function sprunge
        curl -F 'sprunge=<-' http://sprunge.us $argv;
end
