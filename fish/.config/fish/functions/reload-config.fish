# Defined in - @ line 1
function reload-config --wraps='source ~/.config/fish/config.fish' --description 'alias reload-config=source ~/.config/fish/config.fish'
  source ~/.config/fish/config.fish $argv;
end
