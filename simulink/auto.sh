#!/bin/bash

counter=0

while true
do
        # Run command
        echo "Started mlab"
        matlab -r "run('init.m');" &>log.1 &

        # Wait for 20 hours
        sleep 72000
        #sleep 120
        # Kill the process
        # Get the PIDs of processes containing "mlab"
        pids=$(ps -aux | grep -i "matlab" | awk '{print $2}')

        # Kill the processes
        for pid in $pids
        do
          kill "$pid"
        done

        echo "Counter: $counter"
        counter=$((counter + 1))
done
