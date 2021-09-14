#!/bin/bash

find "AEDAT4.0" -type f -name "*.aedat4" -exec sh -c 'python aedat4tomat.py -i "$1" -o "${1%.aedat4}.mat"' _ {} \;
