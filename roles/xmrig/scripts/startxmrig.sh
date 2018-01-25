#! /bin/bash
# /etc/init.d/xmrig
# Carry out specific functions when asked to by the system
 cpumun=`cat /proc/cpuinfo| grep "processor"| wc -l`
declare -i sum=$cpumun
case "$1" in
  start)
    echo "Starting miner script"
    export LD_LIBRARY_PATH=/root/xmrig
    sudo tsocks /root/xmrig/build/xmrig -o stratum+tcp://cryptonight.usa.nicehash.com:3355 -u 3BMEXHqQtVV51Rf5f4SkB8Repn8yaqvSys.rg -k --av=3 --threads=$sum --nicehash --background
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
