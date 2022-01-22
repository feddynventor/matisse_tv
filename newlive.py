import mysql.connector
import datetime
import psutil
import os

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="madgirirdu64",
  database="matisse" )

mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM channels")
channels = mycursor.fetchall()

print("ORE:",datetime.datetime.now().strftime("%H%M")+"00")
print("GIORNO",datetime.datetime.now().strftime("%Y%m%d"))

#for proc in psutil.process_iter(['pid', 'name', 'cmdline']):
#	if (proc.info['name'] == 'immortal'):
#		print(proc.info)
#for proc in psutil.process_iter(['pid', 'name', 'cmdline']):
#	if (proc.info['name'] == 'immortal'):
#		print("IMMORTAL",proc.info)
#		if ("-hls_flags" in proc.info['cmdline'][3] and ("bucketcrm2") in proc.info['cmdline'][3]):
#			psutil.Process(proc.info['pid']).terminate()
#	if (proc.info['name'] == 'ffmpeg'):
#		print("FFMPEG",proc.info)
#		if ("-hls_flags" in proc.info['cmdline'] and ("bucketcrm2") in proc.info['cmdline'][3]):
#			psutil.Process(proc.info['pid']).terminate()
##
for ch in channels:
	if (ch[2] == "0"):
		continue
	mycursor.execute("SELECT * FROM videos WHERE channel="+str(ch[0]))
	events = mycursor.fetchall()
	for ev in events:
		if ( ev[6] == datetime.datetime.now().strftime("%Y%m%d") ):
			if ( ev[4] == datetime.datetime.now().strftime("%H%M")+"00" ):
				print("START",ev)
				if (ev[9] == 1):
					os.system("/root/newlive.sh "+str(ev[7])+" "+str(ev[0])+" rec")
				else:
					os.system("/root/newlive.sh "+str(ev[7])+" "+str(ev[0])+" show")
				mycursor.execute("UPDATE videos SET air=1 WHERE id="+str(ev[0]))
				mydb.commit()
			if ( ev[5] == datetime.datetime.now().strftime("%H%M")+"00" and ev[9] != "1"): #se non e registrato!
				print("STOP",ev)
				mycursor.execute("UPDATE videos SET air=0,cost=-1 WHERE id="+str(ev[0]))
				mydb.commit()
				for proc in psutil.process_iter(['pid', 'name', 'cmdline']):
					if (proc.info['name'] == 'immortal'):
						if ("-hls_flags" in proc.info['cmdline'][-1] and ("bucketcrm"+str(ev[7])) in proc.info['cmdline'][-1]):
							#qui il comando e in ununica stringa nellultimo slot
							psutil.Process(proc.info['pid']).terminate()
					if (proc.info['name'] == 'ffmpeg'):
						if (("-hls_flags") in proc.info['cmdline'] and ("rtmp://10.8.0.1/bucketcrm"+str(ev[7])) in proc.info['cmdline']):
							#qui i parametri sono in una array esplosi da spazi
							psutil.Process(proc.info['pid']).terminate()
