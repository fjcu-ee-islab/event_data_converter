function TD = Read_txt(filename)


eventData = dlmread(filename);


TD.x  = (eventData(:,3)+1);
TD.y  = (eventData(:,4)+1);
TD.p  = (eventData(:,2)+1);
TD.ts = (eventData(:,1));

return