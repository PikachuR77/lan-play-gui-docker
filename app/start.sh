#! /usr/bin/env bash

echo Running on port $(< /config/port.txt)
cd /app
#./lan-play-linux --relay-server-addr $(< /config/server.txt)
./lan-play-gui --port $(< /config/port.txt)
