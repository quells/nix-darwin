function git-branch-select
    set -l branch (git-branches | fzf)
    if test $status = 0
        git checkout $branch
    end
end
