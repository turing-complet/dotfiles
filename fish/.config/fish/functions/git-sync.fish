function git-sync
  for repo in (ls); cd $repo; git pull; prevd; end
end
