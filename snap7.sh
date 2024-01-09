tmux new-session -s plc2 'bash --rcfile <(echo ". ~/.bashrc; docker exec -it plc2 /home/honeyplc/snap7/examples/cpp/x86_64-linux/server 0.0.0.0")'
tmux new-session -s plc3 'bash --rcfile <(echo ". ~/.bashrc; docker exec -it plc3 /home/honeyplc/snap7/examples/cpp/x86_64-linux/server 0.0.0.0")'


