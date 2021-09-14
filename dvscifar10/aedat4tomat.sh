#!/bin/bash

cp -r AEDAT4.0 mat

pip install dv

find "mat" -type f -name "*.aedat4" -exec sh -c 'python aedat4tomat.py -i "$1" -o "${1%.aedat4}.mat"' _ {} \;
