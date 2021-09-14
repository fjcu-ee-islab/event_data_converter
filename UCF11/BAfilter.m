addpath('Matlab_AER_vision/');

Input_path = 'txt/Train/';

a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'};

for folder0 = 1:11
    Output_path = sprintf('txt/Train-1f/%s/', a{folder0});
    
    if ~exist(Output_path, 'dir')
        mkdir(Output_path)
    end
end

for folder0 = 1:11
    Output_path = sprintf('txt/Train-3f/%s/', a{folder0});
    
    if ~exist(Output_path, 'dir')
        mkdir(Output_path)
    end
end

namelist = dir(strcat(Input_path,'**/*.txt')); 

len = length(namelist);
%disp(namelist(1));

for i = 1:len
    name = namelist(i).name;
    folder = namelist(i).folder;
    
    filename = strcat(folder,'/',name);
    
    %disp(name)
    
    % To apply noise filtering to the TD data with 1ms history:
    
    TD = Read_txt(filename);
    TD_filtered = FilterTD(TD, 1e3);

    matrix = [TD_filtered.ts,TD_filtered.p-1,TD_filtered.x-1,TD_filtered.y-1];
    
    savename = strrep(filename,'Train','Train-1f');
    savename = strrep(savename,'/00','/10');
    disp(savename);
    
    dlmwrite(savename,matrix,'delimiter', ' ', 'precision', 10);
    
    % Delete the .out file; but don't do this until you've backed up your data!!
    % delete(file)  
    
end

Output_path= 'txt/Train-3f/';
    
if ~exist(Output_path, 'dir')
    mkdir(Output_path)
end

namelist = dir(strcat(Input_path,'**/*.txt')); 

len = length(namelist);
%disp(namelist(1));

for i = 1:len
    name = namelist(i).name;
    folder = namelist(i).folder;
    
    filename = strcat(folder,'/',name);
    
    %disp(name)
    
    % To apply noise filtering to the TD data with 1ms history:
    
    TD = Read_txt(filename);
    TD_filtered = FilterTD(TD, 3e3);

    matrix = [TD_filtered.ts,TD_filtered.p-1,TD_filtered.x-1,TD_filtered.y-1];
    
    savename = strrep(filename,'Train','Train-3f');
    savename = strrep(savename,'/00','/30');
    disp(savename);
    
    dlmwrite(savename,matrix,'delimiter', ' ', 'precision', 10);
    
    % Delete the .out file; but don't do this until you've backed up your data!!
    % delete(file)  
    
end
