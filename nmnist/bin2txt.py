import struct
import numpy as np
import sys
import os
import time
import os
from pathlib import Path
from tqdm import tqdm, trange

np.set_printoptions(threshold=sys.maxsize)

def load_ATIS_bin(filename):
    """Reads in the TD events contained in the N-MNIST/N-CALTECH101 dataset file specified by 'filename'"""
    f = open(filename, 'rb')
    raw_data = np.fromfile(f, dtype=np.uint8)
    f.close()
    raw_data = np.uint32(raw_data)

    all_y = raw_data[1::5]
    all_x = raw_data[0::5]
    all_p = (raw_data[2::5] & 128) >> 7 #bit 7
    all_ts = ((raw_data[2::5] & 127) << 16) | (raw_data[3::5] << 8) | (raw_data[4::5])

    #Process time stamp overflow events
    time_increment = 2 ** 13
    overflow_indices = np.where(all_y == 240)[0]
    for overflow_index in overflow_indices:
        all_ts[overflow_index:] += time_increment

    #Everything else is a proper td spike
    td_indices = np.where(all_y != 240)[0]
    return all_ts, all_x, all_y, all_p

# from /torchneuromorphic/nmnist/create_hdf5.py
def nmnist_load_events_from_bin(file_path, max_duration=None):
    timestamps, xaddr, yaddr, pol = load_ATIS_bin(file_path)
    return np.column_stack([
        np.array(timestamps, dtype=np.uint32),
        np.array(pol, dtype=np.uint8),
        np.array(xaddr, dtype=np.uint16),
        np.array(yaddr, dtype=np.uint16)])

p = Path("bin/")
FileList=list(p.glob("**/*.bin"))

for File in FileList:
    
    #print(type(File))
    File=str(File)
    #print(File)
    File_str = File[:-4]+str('.txt') 
    #print(File_str)
    nmnist_load_events_from_bin(File)
    np.savetxt(File_str,nmnist_load_events_from_bin(File),fmt='%i')
    
    os.remove(File)
