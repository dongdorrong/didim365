#!/bin/bash

#10 초 주기로 cronjob 실행
for i in {1..30}; do

        #cpu 확인
        CPU_DAGT=`ps aux | grep didimagent | grep -v grep | awk -F "     " '{print $2}' | awk -F "  " '{total+=$3} END {print total}'`
        CPU_LIMIT=50
        CPU_MAX_LIMIT=100

        #CPU 검사 결과
        RESULT_CPU=`expr $CPU_DAGT \< $CPU_LIMIT`
        CHECK_MAX_CPU=`expr $CPU_DAGT \< $CPU_MAX_LIMIT`

        #검사 시간
        TIME_NOW=$(date +"%y-%m-%d %T")

        if [ $CHECK_MAX_CPU -eq 1 ]
        then
                if [ $RESULT_CPU -eq 1 ]
                then
                        echo "[$TIME_NOW] DidimAgent Process CPU Usage : $CPU_DAGT %. The process is kept running state." >> /root/didim/monitor_result/dagt_cpu_usage.log >&1
                else
                        echo "[$TIME_NOW] DidimAgent Process CPU Usage : $CPU_DAGT %. The process is being killed." >> /root/didim/monitor_result/dagt_cpu_usage.log >&1
                        pkill -9 didimagent
                        pkill -9 didimupdater
                fi
        else
        fi

sleep 10;
done
