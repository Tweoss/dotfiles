function gpm --description "gpm; fetch upstream, checkout master, and rebase upstream/master"
    git fetch upstream && git checkout master && git rebase upstream/master
end
