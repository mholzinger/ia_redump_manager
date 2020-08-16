#!/bin/bash

# This script scans a source redump path with compressed images and scans 
# compressed redump files that dont exist yet as decompressed on the 
# target path. Scans for file types on the source path as [iso,bin]

# Path with zip files
ZIP_FILES=/Volumes/Games/ISO/redumpSonyPlaystation2UsaGames2018Aug01

# Compression type
COMPRESSION=7z

# Output path
OUTPUT=/Volumes/BLANK_2T

# Generate our report
missinglist=$(mktemp)

# Populate the report
find "$ZIP_FILES"* -iname "*$COMPRESSION"|\
  while read -r foo
    do isofile=`basename "$foo"`
      if [[ ! -f "$OUTPUT/${isofile%.7z}.iso" && \
            ! -f "$OUTPUT/${isofile%.7z}.bin" ]]
        then
          echo "${isofile%.7z}"
      fi
    done > "$missinglist"

echo "[ Free space on drive ]"
df -h "$OUTPUT"
echo
echo "----------"

echo -n "[ Isofiles present ] "
\ls -1 *iso|wc -l|awk '{print $NF}'

echo -n "[ Missing ] "
cat "$missinglist" |wc -l |awk '{print $NF}'

echo "----------"
echo
cat "$missinglist" | sort -u

