#!/bin/bash
nohup lighttpd -D -f /etc/lighttpd/lighttpd.conf &> httpd.log &
nohup honeyd -d -f /app/honeyd.conf &> honeyd.log &
sh /home/OpenPLC_v3/run.sh &
wait
