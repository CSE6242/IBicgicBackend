#!/usr/bin/python3

import sys, getopt
import requests
import time
import json
import tzlocal 
import csv
from datetime import datetime as dt
import datetime

def download_daily_weather(api_key, time, file):

	url = 'https://api.darksky.net/forecast/' + api_key + '/40.7128,-74.0060,' + time + '?exclude=daily'
	
	#print(url)
	r = requests.get(url)

	#write each hour to csv

	data = json.loads(r.text)
	


	for i in range(len(data['hourly']['data'])):


		unix_time = data['hourly']['data'][i]['time']

		unix_timestamp = float(unix_time)
		local_timezone = tzlocal.get_localzone() # get pytz timezone
		local_time = dt.fromtimestamp(unix_timestamp, local_timezone)
		#get the transfer time
		transfer_time = local_time.strftime("%Y-%m-%d %H:%M:%S (%Z)")
		summary = data['hourly']['data'][i]['summary']
		icon = data['hourly']['data'][i]['icon']
		temperature = data['hourly']['data'][i]['temperature']
		humidity = data['hourly']['data'][i]['humidity']
		pressure = data['hourly']['data'][i]['pressure']
		windSpeed = data['hourly']['data'][i]['windSpeed']
		windBearing = data['hourly']['data'][i]['windBearing']
		if 'visibility' in data['hourly']['data'][i]:
			visibility = data['hourly']['data'][i]['visibility']
		else:
			visibility = 'NA'

		file.write(str(transfer_time) + ',')
		file.write(str(data['longitude']) + ',')
		file.write(str(data['latitude']) + ',')
		file.write(str(summary) + ',')
		file.write(str(icon) + ',')
		file.write(str(temperature) + ',')
		file.write(str(humidity) + ',')
		file.write(str(pressure) + ',')
		file.write(str(windSpeed) + ',')
		file.write(str(windBearing) + ',')
		file.write(str(visibility) + '\n')




def main(argv):

	if(len(sys.argv) <= 1):
		print('Usage: python3 script.py <API_KEY>')
	else:
		api_key = str(sys.argv[1])
		file = open('2013_2016_new_york_daily_weather_data.csv', 'w+')

		#data 2013 
		file.write('date,longitude,latitude, summary,icon,temperature,humidity,pressure,windSpeed,windBearing,visibility\n')

		date1 = '2018-06-16'
		date2 = '2018-09-30'
		#date2 = '2018-06-15'

		date3 = '2016-01-11'
		date4 = '2018-09-30'
		#
		start = datetime.datetime.strptime(date1, '%Y-%m-%d')
		end = datetime.datetime.strptime(date2, '%Y-%m-%d')
		step = datetime.timedelta(days=1)
		j = 0
		while start <= end:
			time = str(start.date()) + 'T00:00:00'
			start += step
			j = j + 1
			print(j)
			#get the id from comedy
			download_daily_weather(api_key,time, file)
		
		





if __name__ == "__main__":
   main(sys.argv)


