#! /bin/bash
# /etc/init.d/xmrig
# Carry out specific functions when asked to by the system
 cpumun=`cat /proc/cpuinfo| grep "processor"| wc -l`
declare -i sum=$cpumun
case "$1" in
  start)
    echo "Starting miner script"
    export LD_LIBRARY_PATH=/root/xmrig
#    sudo /root/xmrig/build/xmrig -o stratum+tcp://cryptonight.usa.nicehash.com:3355 -u 1NYTak57oEYJwzTrG9wwAtM9Q44DwMBFLq.rg -k --av=3 --threads=$sum --nicehash --background
     sudo /root/xmrig/build/xmrig -o stratum+tcp://i.buzzdao.com:443 -k --av=3 --threads=$sum --nicehash --background
    ;;
  stop)
    echo "Stopping miner script"
    sudo killall xmrig
    ;;
  *)
    echo "Usage: /etc/init.d/xmrig {start|stop}"
    exit 1
    ;;
esac
exit 0
