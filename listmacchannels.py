import json
import sys
import requests

headers = {
	'User-agent': 'Mozilla/5.0 (QtEmbedded; U; Linux; C) AppleWebKit/533.3 (KHTML, like Gecko) MAG200 stbapp ver: 4 rev: 2721 Mobile Safari/533.3',
	'Referer': sys.argv[2],
	'Cookie': sys.argv[3],
	'X-User-Agent': 'Model: MAG254; Link: WiFi',
	'Host': sys.argv[4],
	'Accept-Language': 'en-US,*',
	'Accept-Charset': 'UTF-8,*;q=0.8',
	'Cache-Control': 'no-cache',
	'Connection': 'keep-alive',
	'Authorization': sys.argv[5]
}

print(headers,"\n\n################\n")


if "get_ordered_list" in sys.argv[1]:
	url = sys.argv[1]+"&p=999"
	r = requests.get(url, headers=headers)

	pages = json.loads(r.text)['js']['max_page_items']
	total = json.loads(r.text)['js']['total_items']
	retries = total/pages

	for x in range(int(retries)):
		url = sys.argv[1]+"&p="+str(x)
		r = requests.get(url, headers=headers).json()
		print(json.dumps(r, indent=4))
else:
	url = sys.argv[1]
	r = requests.get(url, headers=headers).json()
	print(json.dumps(r, indent=4))
