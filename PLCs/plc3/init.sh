#!/bin/bash
nohup lighttpd -D -f /etc/lighttpd/lighttpd.conf &> httpd.log &
nohup honeyd -d -f /app/honeyd.conf &> honeyd.log &
sh /home/OpenPLC_v3/run.sh &
sudo bash /home/honeyplc/snap7/examples/cpp/x86_64-linux/server 0.0.0.0 &
sudo -u newuser snmpsimd.py --data-dir=/data --agent-udpv4-endpoint=0.0.0.0:161 --v2c-arc &
wait