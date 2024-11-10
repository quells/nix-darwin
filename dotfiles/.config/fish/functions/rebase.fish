function rebase -d 'Rebase current branch onto main/master'
    set -l TRUNK ''

    git branch --show-current > /dev/null 2>&1
    if test $status -ne 0
        warn -e 'not a git repository'
        return 1
    end

    git branch | grep master > /dev/null 2>&1
    if test $status -eq 0
        set TRUNK 'master'
    else
        git branch | grep main > /dev/null 2>&1
        if test $status -eq 0
            set TRUNK 'main'
        else
            warn -e 'trunk branch not found'
            return 1
        end
    end

    git reflog | head -n 1
    echo "Rebasing onto origin/$TRUNK"
    git pull origin $TRUNK -r
end
