#!/bin/bash

# This script converts the GPS logs 
# from Holux M-241 logger to GPX format 
# for further analysis in Wolfram

for i in *.bin;
do
  gpsbabel -t  -i m241-bin -f  ${i} -o gpx -F gpx/${i}.gpx
done
