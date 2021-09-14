clc;

%rename
oldfolder = 'mat';
newfolder = 'txt';
cmd = "mv " + '"' + oldfolder + '" "' + newfolder + '"';
system(cmd);

%mat2txt

Input_path='txt/';

namelist = dir(strcat(Input_path,'**/*.mat'));

len = length(namelist);
disp(namelist(1));

h = waitbar(0,'(1/2)Please wait for .mat converting to .txt...');

for i = 1:len
    
    name = namelist(i).name;
    folder = namelist(i).folder;
    filename = strcat(folder,'/',name);
    disp(filename);
    savename1 = strrep(filename,'.mat','.txt');
    
    Data = load(filename);
    
    x = Data.aedat.data.polarity.x;
    y = Data.aedat.data.polarity.y;
    t = Data.aedat.data.polarity.timeStamp;
    p = Data.aedat.data.polarity.polarity;
    
    class(x);
    %disp(x.');
    
    newData = [t.' p.' x.' y.'];
    %disp(newData);
    
    dlmwrite(savename1, newData,'delimiter',' ', 'precision', 10);
    delete(filename);
    
    waitbar(i / len);

end
close(h)

%timestampFIX
namelist = dir(strcat(Input_path,'**/*.txt'));

len = length(namelist);
disp(namelist(1));

h = waitbar(0,'(2/2)Please wait for timestampFIX...');
for i = 1:len
    
    name = namelist(i).name;
    folder = namelist(i).folder;
    filename = strcat(folder,'/',name);
    disp(filename);
    
    A = dlmread(filename);
    
    %disp(A(1,1));
    shift = A(1,1); 
    B = A(:,1)-shift;
    
    newData = [A(:,1)-shift A(:,2:4)];
    dlmwrite(filename, newData,'delimiter',' ', 'precision', 7);
    
    waitbar(i / len);

end
close(h)

%random_extraction

a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'};
b = {'Basketball', 'Biking', 'Diving', 'GolfSwing', 'HorseRiding', 'SoccerJuggling', 'Swing', 'TennisSwing', 'TrampolineJumping', 'VolleyballSpiking', 'WalkingWithDog'};

for folder0 = 1:11
    foldername = sprintf('txt/Test/%s/', a{folder0});
    
    Input_path = sprintf('txt/%s/', b{folder0});
    FileList = dir(fullfile(Input_path, '*.txt'));
    
    if ~exist(foldername, 'dir')
        mkdir(foldername)
    end
    
    Index = randperm(numel(FileList), 20);
    for k = 1:20
        Source = fullfile(Input_path, FileList(Index(k)).name);
        copyfile(Source, foldername);
        delete(Source);
    end
    
end

for folder0 = 1:11
    foldername = sprintf('txt/Train/%s/', a{folder0});
    
    Input_path = sprintf('txt/%s/', b{folder0});
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

for folder0 = 1:11
    foldername = sprintf('txt/%s/', b{folder0});
    %disp(foldername);
    rmdir(foldername);
end


