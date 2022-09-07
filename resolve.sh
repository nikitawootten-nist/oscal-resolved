#!/usr/bin/env bash

IDIR="OSCAL/src/metaschema"
ODIR="resolved"
TRANSFORM_STYLESHEET="transform.xsl"

# remove old transformed files
rm $ODIR/*.xml

find $IDIR -type f -iname '*.xml' | while read filepath ; do
    echo "Processing $filepath"
    filename=$(basename $filepath)

    saxon -s:$filepath -xsl:$TRANSFORM_STYLESHEET -o:$ODIR/$filename
done
