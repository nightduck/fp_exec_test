sudo ./ping_pong.bt `ps -e | grep ping_pong | awk '{print $1}'`