function git --description 'alias git hub'
	hub  $argv;
end

function packer --description 'alias packer packer-aur'
	packer-aur  $argv;
end

function sprunge --description alias\ sprunge\ curl\ -F\ \'sprunge=\<-\'\ http://sprunge.us
	curl -F 'sprunge=<-' http://sprunge.us $argv;
end

function xclip --description 'alias xclip xclip -selection c'
	command xclip -selection c $argv;
end
