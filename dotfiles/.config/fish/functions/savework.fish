function savework
    git log -1 | tail -n1 | grep 'save work' >/dev/null
    if test $status -eq 0
        git commit -a --amend
    else
        git commit -am 'save work'
    end
end
