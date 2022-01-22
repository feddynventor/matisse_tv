#!/bin/bash

#kill $(pgrep immortal -a | grep show/ | cut -c1-5)
rm /var/www/html/hls/*Z$2.m3u8;         #pulisci vecchi streaming
rm /var/www/html/hls/*Z$2-*.ts;         #pulisci vecchi cluster stream
#renice -n 20 -p $(pgrep ffmpeg)	#abbassa priorita altri stream [rimosso x multiStream]
#nano /var/www/html/users.sh;		#conferma codice, bash per HLS
sed -i "4s/.*/ACTIVE=$2/" "/var/www/html/users$3.sh"
immortal ffmpeg -re -i "rtmp://10.8.0.1/bucketcrm$1" -vn -acodec copy -hls_flags delete_segments -f flv "rtmp://10.8.0.1/show/oLVBzc1ZWOCZ$2";
renice -n -15 -p $(pgrep ffmpeg -a | grep bucketcrm$1 | cut -c1-5)	#Priorita stream selez.
renice -n -15 -p $(pgrep ffmpeg -n)	#priorita processo re-stream
#watch --color immortalctl;
