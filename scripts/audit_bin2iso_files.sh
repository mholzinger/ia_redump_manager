#!/bin/bash

# This script tests for bin files not yet converted to iso
# By testing for presence of both types in path
# Tools expected to convert bin + cue to iso: cmdpack-1.03-macosx-x86_64/bin2iso

#!/bin/bash

\ls -1 *bin|\
  while read -r foo
    do
      if [ ! -f "${foo%.bin}".iso ]; then
        echo "[${foo%.bin}".iso] does not exist
      fi
    done

