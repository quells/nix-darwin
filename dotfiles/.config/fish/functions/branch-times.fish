function branch-times
    for b in (git branch)
        set b (echo $b | tr -d ' *')
        set h (git rev-parse $b)
        set t (git show --no-patch --no-notes --pretty='%cd' $h)
        echo $t $b
    end
end
