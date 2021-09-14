#!/usr/bin/python


"""
data = {'e_p': e_p,
            'e_ts': e_ts,
            'e_x': e_x,
            'e_y': e_y,
            'f_image': f_image,
            'f_position': f_position,
            'f_size': f_size,
            'f_ts': f_ts,
            'f_framestart': f_framestart,
            'f_frameend': f_frameend,
            'f_expstart': f_expstart,
            'f_expend': f_expend,
            'i_ax': i_ax,
            'i_ay': i_ay,
            'i_az': i_az,
            'i_gx': i_gx,
            'i_gy': i_gy,
            'i_gz': i_gz,
            'i_mx': i_mx,
            'i_my': i_my,
            'i_mz': i_mz,
            'i_temp': i_temp,
            'i_ts': i_ts
           }
"""

import sys, getopt
from dv import AedatFile
import scipy.io as sio
import numpy as np
import os

class Struct:
    pass

def main(argv):
    inputfile = ''
    outputfile = ''
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
    except getopt.GetoptError:
        print('aedat4tomat.py -i <inputfile> -o <outputfile>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('aedat4tomat.py -i <inputfile> -o <outputfile>')
            sys.exit()
        elif opt in ("-i", "--ifile"):
            inputfile = arg
        elif opt in ("-o", "--ofile"):
            outputfile = arg
    print('Input file is "', inputfile)
    print('Output file is "', outputfile)
    
    #Define output struct
    out = Struct()
    out.data = Struct()
    out.data.polarity = Struct()

    #Events
    out.data.polarity.polarity = []
    out.data.polarity.timeStamp = []
    out.data.polarity.x = []
    out.data.polarity.y = []

    data = {'aedat': out}

    with AedatFile(inputfile) as f:

        # loop through the "events" stream
        for e in f['events']:
            out.data.polarity.timeStamp.append(e.timestamp)
            out.data.polarity.polarity.append(e.polarity)
            out.data.polarity.x.append(e.x)
            out.data.polarity.y.append(e.y)

        
    #Add counts
    out.data.polarity.numEvents = len(out.data.polarity.x)
    #out.data.imu6.numEvents = len(out.data.imu6.accelX)
    sio.savemat(outputfile, data)
    
    os.remove(inputfile)

if __name__ == "__main__":
   main(sys.argv[1:])
