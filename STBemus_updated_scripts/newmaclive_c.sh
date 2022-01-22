SERVER=$1
PORT=$2
MAC=$3
RTMP=$4
CHANNEL=$5

#Autenticazione
AUTH=$(curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'X-User-Agent: Model: MAG250;Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' "http://${SERVER}:${PORT}/portal.php?type=stb&action=handshake&token=&JsHttpRequest=1-xml" | jq '.[].token' | tr -d '"')

echo "Bearer: ${AUTH}"

#Info profilo - no necessaria
curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG250;Link: WiFi' -H 'Cache-Control: no-cache' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?&action=get_profile&mac=${MAC}&type=stb&hd=1&sn=&stb_type=MAG250&client_type=STB&image_version=218&device_id=&hw_version=1.7-BD-00&hw_version_2=1.7-BD-00&auth_second_step=1&video_out=hdmi&num_banks=2&metrics={'mac':${MAC},'sn':'','model':'MAG250','type':'STB','uid':'','random':'null'}&ver=ImageDescription: 0.2.18-r14-pub-250; ImageDate: Fri Jan 15 15:20:44 EET 2016; PORTAL version: 5.6.1; API Version: JS API version: 328; STB API version: 134; Player Engine version: 0x566" > /dev/null

#Lista eventi - no necessaria
curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG250;Link: WiFi' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=watchdog&action=get_events" > /dev/null

curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG250;Link: WiFi' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=vod&action=get_categories" > /dev/null


#Scadenza - stampata
echo "Scadenza: "
curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG250;Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=account_info&action=get_main_info&JsHttpRequest=1-xml&mac=${MAC}" | jq '.[].phone' | tr -d '"'

#LINK
LINK=$(curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e 'http://${SERVER}:${PORT}/c/' -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG250;Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=itv&action=create_link&forced_storage=undefined&download=0&cmd=ffmpeg http://localhost/ch/${CHANNEL}_" | jq -r '.[].cmd' | tr -d '"' | cut -c8-)
echo $LINK

ffmpeg -re -i "${LINK}" -vcodec copy -acodec aac -b:a 192k -ac 2 -ar 44100 -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -f flv "rtmp://10.8.0.1/bucketcrm${RTMP}"

TOREST=$(pgrep ffmpeg -a | grep "bucketcrm${RTMP} -codec copy -hls_flags delete_segments" | cut -c1-5)
echo $TOREST
kill $TOREST

date +"%T"
echo "  #############  "
sleep 4
