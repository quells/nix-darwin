function ssh --description 'ssh with per-host background tint'
    set -l color '#3b1f1f'
    switch "$argv[-1]"
        case 'utm'
            set color '#370828'
    end

    printf '\e]11;%s\a' $color
    command ssh $argv
    set -l rc $status
    printf '\e]111\a'
    return $rc
end