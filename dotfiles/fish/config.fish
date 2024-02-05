function fish_prompt
    echo -n "["(date +'%H:%M')" "
    set_color $fish_color_cwd; echo -n (prompt_pwd); set_color normal
    echo -n "] » "
end

alias bc="bc -lq"
set -x BC_ENV_ARGS $HOME/.bc
