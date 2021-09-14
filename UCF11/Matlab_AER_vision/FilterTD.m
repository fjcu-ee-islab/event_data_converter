function TD = FilterTD(TD, us_Time)

TD.x = TD.x+1;
TD.y = TD.y+1;
TD.ts = TD.ts+1+us_Time;

xmax = max(TD.x);
ymax = max(TD.y);

T0 = zeros(xmax+1,ymax+1);

for i = 1:length(TD.ts)
    T0(TD.x(i), TD.y(i)) =  0;
    
    T0temp = T0((TD.x(i)-1):(TD.x(i)+1), (TD.y(i)-1):(TD.y(i)+1));
    T0(TD.x(i), TD.y(i)) =  TD.ts(i);
    
    if  TD.ts(i) >= max(T0temp(:)) + us_Time
        TD.ts(i) = 0;
    end
    
end

TD = RemoveNulls(TD, TD.ts == 0);
TD.x = TD.x-1;
TD.y = TD.y-1;
TD.ts = TD.ts-1-us_Time;
