#!/bin/sh

SESSION="vela"

if ! tmux has-session -t $SESSION 2>/dev/null; then
    tmux new-session -d -s $SESSION -n "server"
    tmux send-keys -t $SESSION:server "cd ~/dev/vivian/vela-api" C-m
    tmux send-keys -t $SESSION:server "nvim ." C-m

    tmux new-window -t $SESSION -n "client"
    tmux send-keys -t $SESSION:client "cd ~/dev/vivian/vela" C-m
    tmux send-keys -t $SESSION:client "nvim ." C-m

    tmux attach-session -t $SESSION:server
else
    tmux attach-session -t $SESSION
fi


