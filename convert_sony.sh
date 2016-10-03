#!/bin/bash

# This script converts the GPS logs from Sony FDR-X1000V
# to GPX format for further analysis in Wolfram

for i in *.LOG;
do
         gpsbabel -s -i nmea -f ${i} -o gpx -F '-' |\
	         egrep -v "course|geoidheight|\<fix" |\
	         sed -e 's/<trk\>/\<trk\>\<name\>t\<\/name\>\<desc\>d\<\/desc/' > gpx/${i}.gpx
done
