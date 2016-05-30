#!/bin/bash

#This script converts the GPS logs of Sony FDR-X1000V
#to GPX format for further analysis in Wolfram

for i in *.LOG;
do
         gpsbabel -i nmea  -o gpx ${i} gpx/${i}.gpx
done
