# Defined in - @ line 1
function git-log --wraps='git log --graph --pretty=oneline' --description 'alias git-log=git log --graph --pretty=oneline'
  git log --graph --pretty=oneline $argv;
end
