function git-branches
    git branch | cut -c 3- # omit first two characters of each line
end
