SERVER=$1
PORT=$2
MAC=$3
LISTALL=$4
GENRE=$5

if [ "$6" == "1" ]
then
/root/newmaclive.sh $1 $2 $3 $4 $5
exit 1
fi

#Autenticazione
AUTH=$(curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' "http://${SERVER}:${PORT}/portal.php?type=stb&action=handshake&token=&JsHttpRequest=1-xml" | jq '.[].token' | tr -d '"')

echo "Bearer: ${AUTH}"

#Info profilo - no necessaria
curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 2 rev: 250 Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H 'Cache-Control: no-cache' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Connection: keep-alive' -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=stb&action=get_profile&JsHttpRequest=1-xml&hd=1&num_banks=2&not_valid_token=0&auth_second_step=0&video_out=hdmi&client_type=STB&metrics={'mac':${MAC},'sn':'','model':'MAG254','type':'stb','uid':''}" > /dev/null

#Scadenza - stampata
echo "Scadenza: "
SCAD=$(curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Accept-Encoding: gzip' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=account_info&action=get_main_info&JsHttpRequest=1-xml&mac=${MAC}" | jq '.[].phone' | tr -d '"')
echo $SCAD

if [ -e "/root/listmac/${SERVER}:${PORT} # $SCAD # ${MAC}" ]
then
    nano "/root/listmac/${SERVER}:${PORT} # $SCAD # ${MAC}"
    exit
else
    echo "NUOVA"
fi

if ! [ -z "$GENRE" ]
then
#curl -O -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H "Authorization: Bearer ${AUTH}" -H 'Accept-Encoding: gzip' "http://${SERVER}:${PORT}/portal.php?type=itv&action=get_ordered_list&genre=${GENRE}"
#echo "http://${SERVER}:${PORT}/portal.php?type=itv&action=get_ordered_list&genre=${GENRE}"
python3 /root/listmacchannels.py "http://${SERVER}:${PORT}/portal.php?type=itv&action=get_ordered_list&genre=${GENRE}" "http://${SERVER}:${PORT}/c/" "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" "${SERVER}:${PORT}" "Bearer ${AUTH}" > "listmac/${SERVER}:${PORT} # $SCAD # ${MAC}"
nano "/root/listmac/${SERVER}:${PORT} # $SCAD # ${MAC}"
else
#curl --compressed -s -A 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3' -e "http://${SERVER}:${PORT}/c/" -b "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" -H 'X-User-Agent: Model: MAG254; Link: WiFi' -H "Host: ${SERVER}:${PORT}" -H "Accept-Language: en-US,*" -H "Accept-Charset: UTF-8,*;q=0.8" -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H "Authorization: Bearer ${AUTH}" "http://${SERVER}:${PORT}/portal.php?type=itv&action=get_genres"
#echo "http://${SERVER}:${PORT}/portal.php?type=itv&action=get_genres"
if [ -z "$LISTALL" ]
then
python3 /root/listmacchannels.py "http://${SERVER}:${PORT}/portal.php?type=itv&action=get_genres" "http://${SERVER}:${PORT}/c/" "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" "${SERVER}:${PORT}" "Bearer ${AUTH}" | grep "ITA" -B 5 -A 5 -i
#python3 /root/listmacchannels.py "http://${SERVER}:${PORT}/portal.php?type=itv&action=get_genres" "http://${SERVER}:${PORT}/c/" "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" "${SERVER}:${PORT}" "Bearer ${AUTH}"
else
python3 /root/listmacchannels.py "http://${SERVER}:${PORT}/portal.php?type=itv&action=get_genres" "http://${SERVER}:${PORT}/c/" "mac=${MAC}; stb_lang=en; timezone=Europe/Paris" "${SERVER}:${PORT}" "Bearer ${AUTH}"
fi
fi

echo "./listmacchannels.sh ${SERVER} ${PORT} ${MAC} 1"
