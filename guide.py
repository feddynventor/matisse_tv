import xml.etree.ElementTree as ET
import mysql.connector
import pytz
import urllib.request
from datetime import datetime,timedelta

urllib.request.urlretrieve('http://www.epgitalia.tv/xml/guide.xml', '/root/guide.xml')

gmtoffset = int( datetime.now(pytz.timezone('Europe/Rome')).strftime('%z')[2] )
print("GMT Offset:",gmtoffset)

def applyGMT(time):
	hour = int( time[:2] )
	hour += gmtoffset
	if hour < 10:
		converted = "0"+str(hour)
	else:
		converted = str(hour)
	return converted+time[2:]

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="madgirirdu64",
  database="matisse"
)

mycursor = mydb.cursor()

mycursor.execute("DELETE FROM videos WHERE rec=0 OR giorno="+(datetime.now()-timedelta(6)).strftime("%Y%m%d"))
mydb.commit()

mycursor.execute("SELECT * FROM channels")
channels = mycursor.fetchall()

def channelToID(channel):
	switcher = {}
	for ch in channels:
		switcher[ch[1]] = ch[0]
	return switcher.get(channel,"-1")

def costCalc(start, stop):
	disc = 0
	if disc==-1 and datetime.datetime.today().weekday() < 5:
		disc = 1
	h_start=int(start[0:2])
	h_stop=int(stop[0:2])
	m_start=int(start[2:4])
	m_stop=int(stop[2:4])
	t_start = h_start*3600 + m_start*60
	t_stop = h_stop*3600 + m_stop*60
	time = t_stop-t_start
	if (time <= 2100):
		return 0
	elif (time > 2100) and (time <= 4800):
		return 1-disc
	elif (time > 4800) and (time <= 7500):
		return 2-disc
	else:
		return 3-disc

def timeThreshold(start, stop):
	h_start=int(start[0:2])
	h_stop=int(stop[0:2])
	m_start=int(start[2:4])
	m_stop=int(stop[2:4])
	t_start = h_start*3600 + m_start*60
	t_stop = h_stop*3600 + m_stop*60
	time = t_stop-t_start
	if (time > 7200):
		return True

sql = "INSERT INTO videos (nome, cost, air, inizio, fine, giorno, channel, descrizione) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"

tree = ET.parse('/root/guide.xml')
root = tree.getroot()

for child in root:
	if (child.tag == "programme"):
#		print(child.attrib)
		if (
		child.attrib['channel'] == "Sky Sport F1 HD" or
		child.attrib['channel'] == "Sky Sport Serie A" or
		child.attrib['channel'] == "Sky Sport MotoGP" or
		child.attrib['channel'] == "DAZN1" or
		child.attrib['channel'] == "Sky Sport Football HD" or
		child.attrib['channel'] == "Sky Sport Uno" or
		child.attrib['channel'] == "Sky Sport Arena HD"
		):
			prog = {}
			for child2 in child:
				prog[child2.tag] = child2.text
#			print(prog)
#			print("#################################")
			if ("(diretta)" in prog['title'] or timeThreshold(child.attrib['start'][-12:-6], child.attrib['stop'][-12:-6])):
#			if ("(diretta)" in prog['title']):
				print(prog['title'], costCalc(child.attrib['start'][-12:-6], child.attrib['stop'][-12:-6]), applyGMT(child.attrib['start'][-12:-6]), applyGMT(child.attrib['stop'][-12:-6]), child.attrib['start'][:8], channelToID(child.attrib['channel']), prog['desc'][:30] )
				mycursor.execute(sql, ( (prog['title']).replace("(diretta)", "").rstrip(), costCalc(child.attrib['start'][-12:-6], child.attrib['stop'][-12:-6]), "0", applyGMT(child.attrib['start'][-12:-6]), applyGMT(child.attrib['stop'][-12:-6]), child.attrib['start'][:8], channelToID(child.attrib['channel']), str(prog['desc']) ))

mydb.commit()
