alias git 'hub'
alias vim 'nvim'
alias packer 'packer-aur'
alias xlcip 'xclip -selection c'


function sprunge
        curl -F 'sprunge=<-' http://sprunge.us $argv;
end
