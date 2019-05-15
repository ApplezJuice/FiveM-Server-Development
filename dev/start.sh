#!/bin/bash

cd /home/svcfivem/FiveM-Server-Development/dev/server-data

tmux new-session -d -s gtaserver '/home/svcfivem/FiveM-Server-Development/dev//server/run.sh +exec server.cfg'
