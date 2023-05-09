function quadHeatMap(x_arena, y_arena, structname)
%% Combined LEVER AND LEVER - ALL DATA %% 

load(structname)
Nose = dlcmedstruct.XYCoordinates.Nose;

xarena = x_arena;
yarena = y_arena;
timespent = zeros(yarena,xarena);

for i = 1:length(Nose)
     timespent(round(Nose(i,2)), round(Nose(i,1))) = timespent(round(Nose(i,2)), round(Nose(i,1))) + 1;
end 
xtime = (length(timespent))/3;
ytime = length(timespent(:,1))/3;
tsfinal = zeros(ytime,xtime);

for i = 0:(xtime-1) %
    for ii = 0:(ytime-1)
        temp = [0 0 0; 0 0 0; 0 0 0];
        temp(1,1) = timespent((3*ii)+1, (3*i)+1); 
        temp(1,2) = timespent((3*ii)+2, (3*i)+1); 
        temp(1,3) = timespent((3*ii)+3, (3*i)+1); 

        temp(2,1) = timespent((3*ii)+1, (3*i)+2); 
        temp(2,2) = timespent((3*ii)+2, (3*i)+2); 
        temp(2,2) = timespent((3*ii)+3, (3*i)+2); 

        temp(3,1) = timespent((3*ii)+1, (3*i)+3); 
        temp(3,2) = timespent((3*ii)+2, (3*i)+3); 
        temp(3,3) = timespent((3*ii)+3, (3*i)+3); 
 
        M = mean(temp, 'All');
        tsfinal(ii+1,i+1) = M;
    end 
end 


combinedheatmap = zscore(tsfinal);

%For making NaNs 
for i = 1:ytime
    for ii = 1:xtime
        if combinedheatmap(i,ii) < 0.2
        combinedheatmap(i,ii) = NaN;
        end 
        
    end 
end 

%% LEVER IN vs. LEVER OUT 

ltimer = dlcmedstruct.LeverTiming_F; %convert frames (i) into seconds 
tsfinal1 = zeros(ytime,xtime);
tsfinal2 = zeros(ytime,xtime);
timespentin = zeros(yarena,xarena);
timespentout = zeros(yarena,xarena);

for r = 1:dlcmedstruct.NumofFrames
    if ((r >= ltimer(1,1)) && (r <= ltimer(1,1) + 123)) || ((r >= ltimer(1,2)) && (r <= ltimer(1,2) + 123)) || ... 
    ((r >= ltimer(1,3)) && (r <= ltimer(1,3) + 123)) || ((r >= ltimer(1,4)) && (r <= ltimer(1,4) + 123)) || ...
    ((r >= ltimer(1,5)) && (r <= ltimer(1,5) + 123)) || ((r >= ltimer(1,6)) && (r <= ltimer(1,6) + 123)) || ...
    ((r >= ltimer(1,7)) && (r <= ltimer(1,7) + 123)) || ((r >= ltimer(1,8)) && (r <= ltimer(1,8) + 123)) || ...
    ((r >= ltimer(1,9)) && (r <= ltimer(1,9) + 123)) || ((r >= ltimer(1,10)) && (r <= ltimer(1,10) + 123)) || ...
    ((r >= ltimer(1,11)) && (r <= ltimer(1,11) + 123)) || ((r >= ltimer(1,12)) && (r <= ltimer(1,12) + 123)) || ...
    ((r >= ltimer(1,13)) && (r <= ltimer(1,13) + 123)) || ((r >= ltimer(1,14)) && (r <= ltimer(1,14) + 123)) || ...
    ((r >= ltimer(1,15)) && (r <= ltimer(1,15) + 123)) || ((r >= ltimer(1,16)) && (r <= ltimer(1,16) + 123)) || ...
    ((r >= ltimer(1,17)) && (r <= ltimer(1,17) + 123)) || ((r >= ltimer(1,18)) && (r <= ltimer(1,18) + 123)) || ...
    ((r >= ltimer(1,19)) && (r <= ltimer(1,19) + 123)) || ((r >= ltimer(1,20)) && (r <= ltimer(1,20) + 123)) || ...
    ((r >= ltimer(1,21)) && (r <= ltimer(1,21) + 123)) || ((r >= ltimer(1,22)) && (r <= ltimer(1,22) + 123)) || ...
    ((r >= ltimer(1,23)) && (r <= ltimer(1,23) + 123)) || ((r >= ltimer(1,24)) && (r <= ltimer(1,24) + 123)) || ...
    ((r >= ltimer(1,25)) && (r <= ltimer(1,25) + 123))
        
        timespentout(round(Nose(r,2)), round(Nose(r,1))) = timespentout(round(Nose(r,2)), round(Nose(r,1))) + 1;
    else
        timespentin(round(Nose(r,2)), round(Nose(r,1))) = timespentin(round(Nose(r,2)), round(Nose(r,1))) + 1;
    end 
end 

for i = 0:(xtime-1)
    for ii = 0:(ytime-1)
        temp = [0 0 0; 0 0 0; 0 0 0];
        temp(1,1) = timespentin((3*ii)+1, (3*i)+1); 
        temp(1,2) = timespentin((3*ii)+2, (3*i)+1); 
        temp(1,3) = timespentin((3*ii)+3, (3*i)+1); 

        temp(2,1) = timespentin((3*ii)+1, (3*i)+2); 
        temp(2,2) = timespentin((3*ii)+2, (3*i)+2); 
        temp(2,2) = timespentin((3*ii)+3, (3*i)+2); 

        temp(3,1) = timespentin((3*ii)+1, (3*i)+3); 
        temp(3,2) = timespentin((3*ii)+2, (3*i)+3); 
        temp(3,3) = timespentin((3*ii)+3, (3*i)+3);

        M = mean(temp, 'All');
        tsfinal2(ii+1,i+1) = M;
    end 
end 

tsfinalin = tsfinal2;

for i = 0:(xtime-1)
    for ii = 0:(ytime-1)
        temp = [0 0 0; 0 0 0; 0 0 0];
        temp(1,1) = timespentout((3*ii)+1, (3*i)+1); 
        temp(1,2) = timespentout((3*ii)+2, (3*i)+1); 
        temp(1,3) = timespentout((3*ii)+3, (3*i)+1); 

        temp(2,1) = timespentout((3*ii)+1, (3*i)+2); 
        temp(2,2) = timespentout((3*ii)+2, (3*i)+2); 
        temp(2,2) = timespentout((3*ii)+3, (3*i)+2); 

        temp(3,1) = timespentout((3*ii)+1, (3*i)+3); 
        temp(3,2) = timespentout((3*ii)+2, (3*i)+3); 
        temp(3,3) = timespentout((3*ii)+3, (3*i)+3); 
        
        M = mean(temp, 'All');
        tsfinal1(ii+1,i+1) = M;
    end 
end 

tsfinalout = tsfinal1;

%For making NaNs 
for i = 1:ytime
    for ii = 1:xtime
        if tsfinalin(i,ii) < 0.2
        tsfinalin(i,ii) = NaN;
        end 
        
    end 
end 

%For making NaNs 
for i = 1:ytime
    for ii = 1:xtime
        if tsfinalout(i,ii) < 0.2
        tsfinalout(i,ii) = NaN;
        end 
        
    end 
end 

%% Lever Before - Lever During - Lever After 

tsfinal3 = zeros(ytime,xtime); %DURING
tsfinal4 = zeros(ytime,xtime); %BEFORE
tsfinal5 = zeros(ytime,xtime); %AFTER
tsfinal6 = zeros(ytime,xtime); %AFTERAFTER
timespentdur = zeros(yarena,xarena); %DURING
timespentbefore = zeros(yarena,xarena); %BEFORE
timespentafter = zeros(yarena,xarena); %AFTER
timespentafterafter = zeros(yarena,xarena); %AFTERAFTER; 

for r = 1:dlcmedstruct.NumofFrames
    %DURING 
    if ((r >= ltimer(1,1)) && (r < ltimer(1,1) + 123)) || ((r >= ltimer(1,2)) && (r < ltimer(1,2) + 123)) || ... 
    ((r >= ltimer(1,3)) && (r < ltimer(1,3) + 123)) || ((r >= ltimer(1,4)) && (r < ltimer(1,4) + 123)) || ...
    ((r >= ltimer(1,5)) && (r < ltimer(1,5) + 123)) || ((r >= ltimer(1,6)) && (r < ltimer(1,6) + 123)) || ...
    ((r >= ltimer(1,7)) && (r < ltimer(1,7) + 123)) || ((r >= ltimer(1,8)) && (r < ltimer(1,8) + 123)) || ...
    ((r >= ltimer(1,9)) && (r < ltimer(1,9) + 123)) || ((r >= ltimer(1,10)) && (r < ltimer(1,10) + 123)) || ...
    ((r >= ltimer(1,11)) && (r < ltimer(1,11) + 123)) || ((r >= ltimer(1,12)) && (r < ltimer(1,12) + 123)) || ...
    ((r >= ltimer(1,13)) && (r < ltimer(1,13) + 123)) || ((r >= ltimer(1,14)) && (r < ltimer(1,14) + 123)) || ...
    ((r >= ltimer(1,15)) && (r < ltimer(1,15) + 123)) || ((r >= ltimer(1,16)) && (r < ltimer(1,16) + 123)) || ...
    ((r >= ltimer(1,17)) && (r < ltimer(1,17) + 123)) || ((r >= ltimer(1,18)) && (r < ltimer(1,18) + 123)) || ...
    ((r >= ltimer(1,19)) && (r < ltimer(1,19) + 123)) || ((r >= ltimer(1,20)) && (r < ltimer(1,20) + 123)) || ...
    ((r >= ltimer(1,21)) && (r < ltimer(1,21) + 123)) || ((r >= ltimer(1,22)) && (r < ltimer(1,22) + 123)) || ...
    ((r >= ltimer(1,23)) && (r < ltimer(1,23) + 123)) || ((r >= ltimer(1,24)) && (r < ltimer(1,24) + 123)) || ...
    ((r >= ltimer(1,25)) && (r < ltimer(1,25) + 123))
         
       timespentdur(round(Nose(r,2)), round(Nose(r,1))) = timespentdur(round(Nose(r,2)), round(Nose(r,1))) + 1;
    
    %BEFORE
    elseif ((r < ltimer(1,1)) && (r >= ltimer(1,1) - 123)) || ((r < ltimer(1,2)) && (r >= ltimer(1,2) - 123)) || ... 
    ((r < ltimer(1,3)) && (r >= ltimer(1,3) - 123)) || ((r < ltimer(1,4)) && (r >= ltimer(1,4) - 123)) || ...
    ((r < ltimer(1,5)) && (r >= ltimer(1,5) - 123)) || ((r < ltimer(1,6)) && (r >= ltimer(1,6) - 123)) || ...
    ((r < ltimer(1,7)) && (r >= ltimer(1,7) - 123)) || ((r < ltimer(1,8)) && (r >= ltimer(1,8) - 123)) || ...
    ((r < ltimer(1,9)) && (r >= ltimer(1,9) - 123)) || ((r < ltimer(1,10)) && (r >= ltimer(1,10) - 123)) || ...
    ((r < ltimer(1,11)) && (r >= ltimer(1,11) - 123)) || ((r < ltimer(1,12)) && (r >= ltimer(1,12) - 123)) || ...
    ((r < ltimer(1,13)) && (r >= ltimer(1,13) - 123)) || ((r < ltimer(1,14)) && (r >= ltimer(1,14) - 123)) || ...
    ((r < ltimer(1,15)) && (r >= ltimer(1,15) - 123)) || ((r < ltimer(1,16)) && (r >= ltimer(1,16) - 123)) || ...
    ((r < ltimer(1,17)) && (r >= ltimer(1,17) - 123)) || ((r < ltimer(1,18)) && (r >= ltimer(1,18) - 123)) || ...
    ((r < ltimer(1,19)) && (r >= ltimer(1,19) - 123)) || ((r < ltimer(1,20)) && (r >= ltimer(1,20) - 123)) || ...
    ((r < ltimer(1,21)) && (r >= ltimer(1,21) - 123)) || ((r < ltimer(1,22)) && (r >= ltimer(1,22) - 123)) || ...
    ((r < ltimer(1,23)) && (r >= ltimer(1,23) - 123)) || ((r < ltimer(1,24)) && (r >= ltimer(1,24) - 123)) || ...
    ((r < ltimer(1,25)) && (r >= ltimer(1,25) - 123))

        timespentbefore(round(Nose(r,2)), round(Nose(r,1))) = timespentbefore(round(Nose(r,2)), round(Nose(r,1))) + 1;

    %AFTER
    elseif((r > ltimer(1,1)) && (r < ltimer(1,1) + 246)) || ((r > ltimer(1,2)) && (r < ltimer(1,2) + 246)) || ... 
    ((r >= ltimer(1,3)) && (r < ltimer(1,3) + 246)) || ((r > ltimer(1,4)) && (r < ltimer(1,4) + 246)) || ...
    ((r >= ltimer(1,5)) && (r < ltimer(1,5) + 246)) || ((r > ltimer(1,6)) && (r < ltimer(1,6) + 246)) || ...
    ((r >= ltimer(1,7)) && (r < ltimer(1,7) + 246)) || ((r > ltimer(1,8)) && (r < ltimer(1,8) + 246)) || ...
    ((r >= ltimer(1,9)) && (r < ltimer(1,9) + 246)) || ((r > ltimer(1,10)) && (r < ltimer(1,10) + 246)) || ...
    ((r >= ltimer(1,11)) && (r < ltimer(1,11) + 246)) || ((r > ltimer(1,12)) && (r < ltimer(1,12) + 246)) || ...
    ((r >= ltimer(1,13)) && (r < ltimer(1,13) + 246)) || ((r > ltimer(1,14)) && (r < ltimer(1,14) + 246)) || ...
    ((r >= ltimer(1,15)) && (r < ltimer(1,15) + 246)) || ((r > ltimer(1,16)) && (r < ltimer(1,16) + 246)) || ...
    ((r >= ltimer(1,17)) && (r < ltimer(1,17) + 246)) || ((r > ltimer(1,18)) && (r < ltimer(1,18) + 246)) || ...
    ((r >= ltimer(1,19)) && (r < ltimer(1,19) + 246)) || ((r > ltimer(1,20)) && (r < ltimer(1,20) + 246)) || ...
    ((r >= ltimer(1,21)) && (r < ltimer(1,21) + 246)) || ((r > ltimer(1,22)) && (r < ltimer(1,22) + 246)) || ...
    ((r >= ltimer(1,23)) && (r < ltimer(1,23) + 246)) || ((r > ltimer(1,24)) && (r < ltimer(1,24) + 246)) || ...
    ((r >= ltimer(1,25)) && (r < ltimer(1,25) + 246))

       timespentafter(round(Nose(r,2)), round(Nose(r,1))) = timespentafter(round(Nose(r,2)), round(Nose(r,1))) + 1;
    
    %%AFTER AFTER 
    elseif(r >= ((ltimer(1,2) - (ltimer(1,1) + 123))/2) && (r < ((ltimer(1,2) - (ltimer(1,1) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,3) - (ltimer(1,2) + 123))/2) && (r < ((ltimer(1,3) - (ltimer(1,2) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,4) - (ltimer(1,3) + 123))/2) && (r < ((ltimer(1,4) - (ltimer(1,3) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,5) - (ltimer(1,4) + 123))/2) && (r < ((ltimer(1,5) - (ltimer(1,4) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,6) - (ltimer(1,5) + 123))/2) && (r < ((ltimer(1,6) - (ltimer(1,5) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,7) - (ltimer(1,6) + 123))/2) && (r < ((ltimer(1,7) - (ltimer(1,6) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,8) - (ltimer(1,7) + 123))/2) && (r < ((ltimer(1,8) - (ltimer(1,7) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,9) - (ltimer(1,8) + 123))/2) && (r < ((ltimer(1,9) - (ltimer(1,8) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,10) - (ltimer(1,9) + 123))/2) && (r < ((ltimer(1,10) - (ltimer(1,9) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,11) - (ltimer(1,10) + 123))/2) && (r < ((ltimer(1,11) - (ltimer(1,10) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,12) - (ltimer(1,11) + 123))/2) && (r < ((ltimer(1,12) - (ltimer(1,11) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,13) - (ltimer(1,12) + 123))/2) && (r < ((ltimer(1,13) - (ltimer(1,12) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,14) - (ltimer(1,13) + 123))/2) && (r < ((ltimer(1,14) - (ltimer(1,13) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,15) - (ltimer(1,14) + 123))/2) && (r < ((ltimer(1,15) - (ltimer(1,14) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,16) - (ltimer(1,15) + 123))/2) && (r < ((ltimer(1,16) - (ltimer(1,15) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,17) - (ltimer(1,16) + 123))/2) && (r < ((ltimer(1,17) - (ltimer(1,16) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,18) - (ltimer(1,17) + 123))/2) && (r < ((ltimer(1,18) - (ltimer(1,17) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,19) - (ltimer(1,18) + 123))/2) && (r < ((ltimer(1,19) - (ltimer(1,18) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,20) - (ltimer(1,19) + 123))/2) && (r < ((ltimer(1,20) - (ltimer(1,19) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,21) - (ltimer(1,20) + 123))/2) && (r < ((ltimer(1,21) - (ltimer(1,20) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,22) - (ltimer(1,21) + 123))/2) && (r < ((ltimer(1,22) - (ltimer(1,21) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,23) - (ltimer(1,22) + 123))/2) && (r < ((ltimer(1,23) - (ltimer(1,22) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,24) - (ltimer(1,23) + 123))/2) && (r < ((ltimer(1,24) - (ltimer(1,23) + 123))/2) + 123))|| ...
          (r >= ((ltimer(1,25) - (ltimer(1,24) + 123))/2) && (r < ((ltimer(1,25) - (ltimer(1,24) + 123))/2) + 123))
       
        timespentafterafter(round(Nose(r,2)), round(Nose(r,1))) = timespentafterafter(round(Nose(r,2)), round(Nose(r,1))) + 1;
    end 
end 


for i = 0:(xtime-1)
    for ii = 0:(ytime-1)
        temp = [0 0 0; 0 0 0; 0 0 0];
        temp(1,1) = timespentdur((3*ii)+1, (3*i)+1); 
        temp(1,2) = timespentdur((3*ii)+2, (3*i)+1); 
        temp(1,3) = timespentdur((3*ii)+3, (3*i)+1); 

        temp(2,1) = timespentdur((3*ii)+1, (3*i)+2); 
        temp(2,2) = timespentdur((3*ii)+2, (3*i)+2); 
        temp(2,2) = timespentdur((3*ii)+3, (3*i)+2); 

        temp(3,1) = timespentdur((3*ii)+1, (3*i)+3); 
        temp(3,2) = timespentdur((3*ii)+2, (3*i)+3); 
        temp(3,3) = timespentdur((3*ii)+3, (3*i)+3);
        
        M = mean(temp, 'All');
        tsfinal3(ii+1,i+1) = M;
    end 
end 

for i = 1:ytime
    for ii = 1:xtime
        if ii > 300
        tsfinal3(i,ii) = 0;
        end 
        
    end 
end 

flag = 0;
tsfinaldur = zscore(tsfinal3,flag,'all');

%For making NaNs 
for i = 1:ytime
    for ii = 1:xtime
        if tsfinaldur(i,ii) < 1
        tsfinaldur(i,ii) = 0;
        end 
        
    end 
end 

for i = 0:(xtime-1)
    for ii = 0:(ytime-1)
        temp = [0 0 0; 0 0 0; 0 0 0];
        temp(1,1) = timespentbefore((3*ii)+1, (3*i)+1); 
        temp(1,2) = timespentbefore((3*ii)+2, (3*i)+1); 
        temp(1,3) = timespentbefore((3*ii)+3, (3*i)+1); 

        temp(2,1) = timespentbefore((3*ii)+1, (3*i)+2); 
        temp(2,2) = timespentbefore((3*ii)+2, (3*i)+2); 
        temp(2,2) = timespentbefore((3*ii)+3, (3*i)+2); 

        temp(3,1) = timespentbefore((3*ii)+1, (3*i)+3); 
        temp(3,2) = timespentbefore((3*ii)+2, (3*i)+3); 
        temp(3,3) = timespentbefore((3*ii)+3, (3*i)+3);
        
        M = mean(temp, 'All');
        tsfinal4(ii+1,i+1) = M;
    end 
end 

for i = 1:ytime
    for ii = 1:xtime
        if ii > 300
        tsfinal4(i,ii) = 0;
        end 
        
    end 
end 

flag = 0;
tsfinalbefore = zscore(tsfinal4,flag,'all');

%For making NaNs 
for i = 1:ytime
    for ii = 1:xtime
        if tsfinalbefore(i,ii) < 1
        tsfinalbefore(i,ii) = 0;
        end 
        
    end 
end 

for i = 0:(xtime-1)
    for ii = 0:(ytime-1)
        temp = [0 0 0; 0 0 0; 0 0 0];
        temp(1,1) = timespentafter((3*ii)+1, (3*i)+1); 
        temp(1,2) = timespentafter((3*ii)+2, (3*i)+1); 
        temp(1,3) = timespentafter((3*ii)+3, (3*i)+1); 

        temp(2,1) = timespentafter((3*ii)+1, (3*i)+2); 
        temp(2,2) = timespentafter((3*ii)+2, (3*i)+2); 
        temp(2,2) = timespentafter((3*ii)+3, (3*i)+2); 

        temp(3,1) = timespentafter((3*ii)+1, (3*i)+3); 
        temp(3,2) = timespentafter((3*ii)+2, (3*i)+3); 
        temp(3,3) = timespentafter((3*ii)+3, (3*i)+3);   
        
        M = mean(temp, 'All');
        tsfinal5(ii+1,i+1) = M;
    end 
end 

for i = 1:ytime
    for ii = 1:xtime
        if ii > 300
        tsfinal5(i,ii) = 0;
        end 
        
    end 
end 

flag = 0;
tsfinalafter = zscore(tsfinal5, flag,'all');

%For making NaNs 
for i = 1:ytime
    for ii = 1:xtime
        if tsfinalafter(i,ii) < 1
        tsfinalafter(i,ii) = 0;
        end 
        
    end 
end 

for i = 0:(xtime-1)
    for ii = 0:(ytime-1)
        temp = [0 0 0; 0 0 0; 0 0 0];
        temp(1,1) = timespentafterafter((3*ii)+1, (3*i)+1); 
        temp(1,2) = timespentafterafter((3*ii)+2, (3*i)+1); 
        temp(1,3) = timespentafterafter((3*ii)+3, (3*i)+1); 

        temp(2,1) = timespentafterafter((3*ii)+1, (3*i)+2); 
        temp(2,2) = timespentafterafter((3*ii)+2, (3*i)+2); 
        temp(2,2) = timespentafterafter((3*ii)+3, (3*i)+2); 

        temp(3,1) = timespentafterafter((3*ii)+1, (3*i)+3); 
        temp(3,2) = timespentafterafter((3*ii)+2, (3*i)+3); 
        temp(3,3) = timespentafterafter((3*ii)+3, (3*i)+3);   
        
        M = mean(temp, 'All');
        tsfinal6(ii+1,i+1) = M;
    end 
end 

for i = 1:ytime
    for ii = 1:xtime
        if ii > 300
        tsfinal6(i,ii) = 0;
        end 
        
    end 
end 
flag = 0;
tsfinalafterafter = zscore(tsfinal6, flag,'all');
%For making NaNs 
for i = 1:ytime
    for ii = 1:xtime
        if tsfinalafterafter(i,ii) < 1
        tsfinalafterafter(i,ii) = 0;
        end 
        
    end 
end 

for i = 1:ytime
    for ii = 1:xtime
        if tsfinalafterafter(i,ii) > 30
        tsfinalafterafter(i,ii) = 30;
        end   
    end 
end 




%% Graphing 


% h = heatmap(combinedheatmap);
% h.GridVisible = 'off';
% h.ColorLimits = [.2 1];
% h.Colormap = jet;
% h.MissingDataColor = [1 1 1];
% h.Title = 'Time Spent - Combined';
% Ax = gca;
% Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
% Ax.YDisplayLabels = nan(size(Ax.YDisplayData));



% figure;
% tiledlayout (1,2)
% nexttile;
% h = heatmap(tsfinalout);
% h.GridVisible = 'off';
% h.MissingDataColor = [1 1 1];
% h.ColorLimits = [.2 .8];
% h.Colormap = jet;
% h.Title = 'Lever Out';
% h.ColorbarVisible = 'off';
% Ax = gca;
% Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
% Ax.YDisplayLabels = nan(size(Ax.YDisplayData));
% 
% nexttile;
% h = heatmap(tsfinalin);
% h.GridVisible = 'off';
% h.ColorLimits = [.2 .8];
% h.MissingDataColor = [1 1 1];
% h.Colormap = jet;
% h.Title = 'Lever In';
% Ax = gca;
% Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
% Ax.YDisplayLabels = nan(size(Ax.YDisplayData));

figure
t = tiledlayout (2,2);
t.TileSpacing = 'Compact';

nexttile;
h = heatmap(tsfinalbefore);
h.GridVisible = 'off';
h.ColorbarVisible = 'off';
h.ColorLimits = [1 10];
h.MissingDataColor = [1 1 1];
h.Colormap = jet;
h.Title = 'Before Lever';
Ax = gca;
Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
Ax.YDisplayLabels = nan(size(Ax.YDisplayData));

nexttile;
h = heatmap(tsfinaldur);
h.GridVisible = 'off';
h.ColorbarVisible = 'off';
h.MissingDataColor = [1 1 1];
h.ColorLimits = [0 10];
h.Colormap = jet;
h.Title = 'During Lever';
Ax = gca;
Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
Ax.YDisplayLabels = nan(size(Ax.YDisplayData));

nexttile;
h = heatmap(tsfinalafter);
h.ColorLimits = [1 10];
h.MissingDataColor = [1 1 1];
h.GridVisible = 'off';
h.ColorbarVisible = 'off';
h.Colormap = jet;
h.Title = 'After Lever';
Ax = gca;
Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
Ax.YDisplayLabels = nan(size(Ax.YDisplayData));


nexttile;
h = heatmap(tsfinalafterafter);
h.ColorLimits = [1 10];
h.MissingDataColor = [1 1 1];
h.GridVisible = 'off';
h.ColorbarVisible = 'off';
h.Colormap = jet;
h.Title = 'Intertrial Interval';
Ax = gca;
Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
Ax.YDisplayLabels = nan(size(Ax.YDisplayData));


%% Storing in structure

dlcmedstruct.HeatMap.Timespent.Timespent = timespent;
dlcmedstruct.HeatMap.Timespent.TimeSpentBefore = timespentbefore;
dlcmedstruct.HeatMap.Timespent.TimeSpentAfter = timespentafter;
dlcmedstruct.HeatMap.Timespent.TimeSpentOut = timespentout;
dlcmedstruct.HeatMap.Timespent.TimeSpentIn = timespentin;

dlcmedstruct.HeatMap.TimespentDownSampled.TimeBefore = flip(tsfinalbefore);
dlcmedstruct.HeatMap.TimespentDownSampled.TimeDuring = flip(tsfinaldur);
dlcmedstruct.HeatMap.TimespentDownSampled.TimeAfter = flip(tsfinalafter);
dlcmedstruct.HeatMap.TimespentDownSampled.TimeAfterAfter = flip(tsfinalafterafter);
dlcmedstruct.HeatMap.TimespentDownSampled.TimeSpentIn = tsfinalin;
dlcmedstruct.HeatMap.TimespentDownSampled.TimeSpentOut = tsfinalout; 

save(structname, 'dlcmedstruct')

