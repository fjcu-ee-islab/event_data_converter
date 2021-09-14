clc;clear;

addpath('display/');
addpath('N-dataset functions/');
addpath('processing_functions/');
addpath('tools/');

%filename = '../IITM/00001.txt';
%filename = '../UCF11/00001.txt';
%filename = '../dvscifar10/00000.txt';
%filename = '../dvsmnist/00001.txt';
filename = '../nmnist/00002.txt';

TD = Read_txt(filename);
%ShowTD(TD); 
%Show3D(TD);
Show3D1(TD);

disp(TD);
%disp(TD.x);
%disp(TD.y);
%disp(TD.p);
%disp(TD.ts);

TD_filtered = FilterTD(TD, 1e3);
%ShowTD(TD_filtered);
%Show3D(TD_filtered);
