#!/bin/bash

# This script creates the CSV file list
# to be imported by the SemanticImport function

echo "Filename;Date" > gpx/file_list.csv

for i in gpx/*.gpx;
do
  echo  $(basename ${i})"; "'"'$(grep time ${i} | head -2| tail -1 | sed -e 's/\s//;s/T/ /;s/[a-zA-Z<>\/]//g')'"' >> gpx/file_list.csv
done
