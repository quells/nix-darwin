function git-branch-clean
    for f in (git-branches | fzf -m)
        git branch -D (echo $f | tr -d ' ')
    end
end
