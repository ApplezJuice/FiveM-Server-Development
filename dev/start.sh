#!/bin/bash

cd /home/svcfivem/FiveM-Server-Development/dev/server-data

tmux new-session -d -s gta '/home/svcfivem/FiveM-Server-Development/dev/server/run.sh +exec server.cfg'
tmux select-window -t gta:0
tmux split-window -h 'htop'

