function mkcd --description "Create directory and cd into it"
  mkdir -pv $argv;
  cd $argv;
end
