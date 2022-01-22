#!/bin/bash

#kill $(pgrep immortal -a | grep show/ | cut -c1-5)
rm /var/www/hls/s$1/*Z*.m3u8;		#pulisci vecchi streaming m3u
rm /var/www/hls/s$1/*Z*-*.ts;		#pulisci vecchi cluster stream ts
#renice -n 20 -p $(pgrep ffmpeg)	#abbassa priorita altri stream [rimosso x multiStream]

#$1 buffer rtmp
#$2 id live
#$3 show | rec
sed -i "4s/.*/ACTIVE=$2/" "/var/www/users$1.sh"
immortal /bin/sh -c "ffmpeg -re -i 'rtmp://10.8.0.1/bucketcrm$1' -codec copy -hls_time 5 -hls_flags delete_segments -f flv 'rtmp://10.8.0.1/$3_$1/oLVBzc1ZWOCZ$2'";
#renice -n -15 -p $(pgrep ffmpeg -a | grep bucketcrm$1 | cut -c1-5)	#Priorita stream selez.
#renice -n -15 -p $(pgrep ffmpeg -n)	#priorita processo re-stream
#watch --color immortalctl;
