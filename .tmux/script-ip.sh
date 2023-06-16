#!/bin/bash

function tmux_print_ip() {
    file=~/.tmux/ip
    last_modified=$(stat -f %m $file)
    current_time=$(date +%s)
    time_diff=$((current_time - last_modified))

    if [ $time_diff -ge 30 ]; then
        curl -qs https://ipinfo.io | jq -r '.ip' > $file
    fi

    cat $file
}
