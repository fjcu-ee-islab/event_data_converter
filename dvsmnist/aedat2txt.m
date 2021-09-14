clc;clear;

a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

%aedat2mat

h = waitbar(0,'(1/2)Please wait for .aedat converting to .mat...');


for folder0 = 1:10
    for file0 = 1:1000
        if mod(file0, 10) == 0
            fprintf('step: %s %d\n', a{folder0}, file0)
        end
        
        addr = sprintf('AEDAT/%s/mnist_%s_scale08_%04d.aedat', a{folder0}, a{folder0}, file0);    
        disp(addr);

        foldername = sprintf('mat/%s/', a{folder0});
        
        if ~exist(foldername, 'dir')
            mkdir(foldername)
        end

        out = dat2mat(addr);
        save(sprintf('mat/%s/%05d.mat', a{folder0}, file0), 'out');

    end
    waitbar(folder0 / 10);
end 
close(h)

%aedat2txt

Input_path='mat/';

namelist = dir(strcat(Input_path,'**/*.mat'));

len = length(namelist);
disp(namelist(1));

h = waitbar(0,'(2/2)Please wait for .mat converting to .txt...');

for i = 1:len
    
    name = namelist(i).name;
    folder = namelist(i).folder;
    
    filename = strcat(folder,'/',name);
    
    disp(filename);
    
    savename1 = strrep(filename,'.mat','.txt') ;
    savename1 = strrep(savename1,'mat','txt');
    
    Data = load(filename);
    Data = struct2array(Data);
    
    %disp(Data);

    Data = max(Data,0);
    pol = Data(:,6);
    newData = [Data(:,1) pol Data(:,4:5)];
    
    a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    
    for folder0 = 1:10
        foldername = sprintf('txt/%s/', a{folder0}); 
        
        %disp(foldername);

        if ~exist(foldername, 'dir')
            mkdir(foldername)
        end
    end
    
    %disp(savename1)
    
    dlmwrite(savename1, newData,'delimiter',' ', 'precision', 7);
    
    waitbar(i / len);

end
close(h)
%random_extraction

a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

for folder0 = 1:10
    foldername = sprintf('txt/Test/%s/', a{folder0});
    
    Input_path = sprintf('txt/%s/', a{folder0});
    FileList = dir(fullfile(Input_path, '*.txt'));
    
    if ~exist(foldername, 'dir')
        mkdir(foldername)
    end
    
    Index = randperm(numel(FileList), 12);
    for k = 1:12
        Source = fullfile(Input_path, FileList(Index(k)).name);
        copyfile(Source, foldername);
        delete(Source);
    end
    
end

for folder0 = 1:10
    foldername = sprintf('txt/Train/%s/', a{folder0});
    
    Input_path = sprintf('txt/%s/', a{folder0});
    FileList = dir(fullfile(Input_path, '*.txt'));
    
    if ~exist(foldername, 'dir')
        mkdir(foldername)
    end
    
    Index = numel(FileList);
    
    for k = 1:Index
        Source = fullfile(Input_path, FileList(k).name);
        disp(Source)
        copyfile(Source, foldername);
        delete(Source);
    end    
end

for folder0 = 1:10
    foldername = sprintf('txt/%s/', a{folder0});
    %disp(foldername);
    rmdir(foldername);
end

