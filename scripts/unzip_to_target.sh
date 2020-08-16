#!/bin/bash

# This script tests to see if redump compressed files exist as decompressed images on the target drive
# Usage: [prog] source_path output_target

# Remove Trailing slash from input + output paths
INPUT_PATH="${1%/}"
OUTPUT_PATH="${2%/}"

# Escape ls to remove and aliases and use basic ls output
\ls -1 "$INPUT_PATH"/*7z |\
while read -r foo
  do
    basename "${foo%.7z}"
  done |\
    while read -r filename
      do
      if [[ ! -f "$OUTPUT_PATH"/"$filename".iso && \
            ! -f "$OUTPUT_PATH/$filename".bin ]]; then
        echo "${filename}".7z
      fi
      done |\
        while read -r bar
          do
            7z x "$INPUT_PATH"/"$bar" -o"$OUTPUT_PATH"/
          done


