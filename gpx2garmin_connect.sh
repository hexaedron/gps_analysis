#!/bin/bash

# This script converts the GPX file 
# from Holux M-241 logger to GPX format 
# for upload to Garmin Connect.

# P.S. I know, you can't parse XML
# with regex, I just don't give a heck
# since it works for a fixed format

TIME=$(grep time $1 | head -2 | tail -1)
TRKLINE=$(grep -n -m 1 trkseg $1|cut -d : -f 1)

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<gpx xmlns=\"http://www.topografix.com/GPX/1/1\" xmlns:gpxdata=\"http://www.cluetrust.com/XML/GPXDATA/1/0\" creator=\"Garmin Vivoactive 3\" version=\"8.2\">
  <metadata>
      <text>Holux M-241 to Garmin Connect</text>
      <link href=\"https://github.com/hexaedron/gps_analysis\">
    </link>
    $TIME
  </metadata>
    <trk>
    <name>Holux M-241</name>
    <type>Walking</type>" > $2
  
tail -n +$TRKLINE $1 >> $2