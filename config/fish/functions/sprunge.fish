# Defined in - @ line 1
function sprunge --description alias\ sprunge\ curl\ -F\ \'sprunge=\<-\'\ http://sprunge.us
	curl -F 'sprunge=<-' http://sprunge.us $argv;
end
