## Downloading
Make sure you have downloaded the dataset from google drive

[Download](https://drive.google.com/drive/folders/18uZjMU5_N_V3G-XuS8IVA5NSAHMheTsW?usp=sharing)

# dvscifar10, IITM, UCF11
## Environment
Make sure you have installed the software below already 
* MATLAB R2021a
* Dynamic Vision Viewer 1.4.3

## Installing Dynamic Vision Viewer
Ubuntu Bionic
We provide a separate PPA repository for Ubuntu Bionic (18.04 LTS) on the x86_64, x86, arm64, armhf and ppc64 architectures. Please note that dv-gui is only available on x86_64, the dv-runtime on all supported architectures. The separate repository is required due to needing additional backports for dependencies and PPAs.
```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo add-apt-repository ppa:inivation-ppa/inivation-bionic
sudo apt-get update
sudo apt-get install dv-gui
```

## Convert AEDAT files to AEDAT4.0

![This is a alt text.](/image/image0.png "AEDATtoAEDAT4.0.")

The converted data should have the following file structure:
```
dataset
├── dvscifar10
    ├── AEDAT4.0
        ├── airplane
            ├── cifar10_airplane_0.aedat4
            ├── cifar10_airplane_1.aedat4
            ├── ...
        ├── automobile
        ├── bird
        ├── cat
        ├── deer
        ├── dog
        ├── frog
        ├── horse
        ├── ship
        ├── truck
├── IITM
    ├── AEDAT4.0
        ├── comeHere
            ├── 00001.aedat4
            ├── 00002.aedat4
            ├── ...
        ├── left_swipe
        ├── right_swipe
        ├── rotation_CCW
        ├── rotation_CW
        ├── swipeDown
        ├── swipeUP
        ├── swipeV
        ├── X
        ├── Z
├── UCF11
    ├── AEDAT4.0
        ├── Basketball
            ├── 00001.aedat4
            ├── 00002.aedat4
            ├── ...
        ├── Biking
        ├── Diving
        ├── GolfSwing
        ├── HorseRiding
        ├── SoccerJuggling
        ├── Swing
        ├── TennisSwing
        ├── TrampolineJumping
        ├── VolleyballSpiking
        ├── WalkingWithDog        
```
## Convert AEDAT4.0 files to TXT
```
cd dataset
bash aedat4tomat.sh
```
Run ***mat2txt.m*** with matlab to finish converting.

# dvsmnist
## Environment
Make sure you have installed the software below already 
* MATLAB R2021a

The data should have the following file structure:
```
dataset
├── dvsmnist
    ├── AEDAT
        ├── 0
            ├── mnist_0_scale08_0001.aedat
            ├── mnist_0_scale08_0002.aedat
            ├── ...
        ├── 1
        ├── 2
        ├── 3
        ├── 4
        ├── 5
        ├── 6
        ├── 7
        ├── 8
        ├── 9
```
## Convert AEDAT files to TXT
Run ***aedat2txt.m*** with matlab to finish converting.

# dvsgesture
No need to convert.
The data should have the following file structure:
```
dataset
├── dvsgesture
    ├── raw
        ├── errata.txt
        ├── gesture_mapping.csv
        ├── LICENSE.txt
        ├── README.txt
        ├── trials_to_test.txt
        ├── trials_to_train.txt
        ├── user01_fluorescent.aedat
        ├── user01_fluorescent_labels.csv
        ├── ...
```
# nmnist
## Convert BIN files to TXT
The data should have the following file structure:
```
├── nmnist
    ├── bin
        ├── Test
            ├── 0
                ├── 00003.bin
                ├── 00006.bin
                ├── 00015.bin
                ├── ...
            ├── 1
            ├── 2
            ├── 3
            ├── 4
            ├── 5
            ├── 6
            ├── 7
            ├── 8
            ├── 9
        ├── Train
```
Run ***bin2txt.ipynb*** with JupyterNotebook to finish converting.

#Matlab_AER_vision
```
cd Matlab_AER_vision
```
Run ***show.m*** for event data visualization or BAF
![This is a alt text.](/image/image1.png "This is a 2D image.")
![This is a alt text.](/image/image2.png "This is a 3D image.")
