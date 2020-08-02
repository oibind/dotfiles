# terminal pastebin
function sprunge --description "Terminal pastebin"
  curl -s -F 'sprunge=<-' http://sprunge.us $argv | xclip -selection clipboard;
end
