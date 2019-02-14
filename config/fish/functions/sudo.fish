# Defined in - @ line 1
function sudo --description 'alias sudo doas'
	doas  $argv;
end
