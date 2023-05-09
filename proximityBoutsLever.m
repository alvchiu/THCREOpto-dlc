function proximityBoutsLever(structname)

load(structname)

FoodCup = dlcmedstruct.XYCoordinates.FoodCup;
Nose = dlcmedstruct.XYCoordinates.Nose;
ltimer = dlcmedstruct.LeverTiming_F;

%%  Distance to Lever %% 
%center = [mean(FoodCup(:,1)) mean(FoodCup(:,2))];
xcenter = mean(FoodCup(:,1)) + 100;
%ycenter = mean(FoodCup(:,2));
ycenter = 100;
%dist = sqrt((Nose(i)-xcenter)^2 + (Nose(i,2)-ycenter)^2);

distance = [];

for i = 1:length(Nose)
    distance (i,1) = i; 
    distance (i,2) = sqrt((Nose(i)-xcenter)^2 + (Nose(i,2)-ycenter)^2);
end  

%figure
k = smooth(distance(:,1));
m = smooth(distance(:,2)); %actual distance 

%plot(k,m);

duration = [];
%count = 1;
for ii = 1:length(m)
    if m(ii,1) > 200
    else 
        duration(ii,1) = ii;
    end 
end 

diffdur = diff(duration);
% > 1 and positive number  = onset
% < 1 and negative number  = offset 

duration_storage = [];
%column 1 = start frame
%column 2 = finish frame
%column 3 = duration 
for iii = 1:length(diffdur)
    if iii == 1
        diffdur(1,1) = 0;
        diffdur(2,1) = 3;
    end 
end 

for iii = 1:length(diffdur)
%     if iii == 1
%         diffdur(1,1) = 0;
%         diffdur(2,1) = 3;
%     end 
    if diffdur(iii) == 0
    elseif diffdur(iii) > 1 && diffdur(iii-1) == 0
        startframe = diffdur(iii); 
        duration_storage(startframe,1) = startframe;
    elseif diffdur(iii) < -1 && diffdur(iii-1) == 1 
        duration_storage(startframe,2) = iii;
        duration_storage(startframe,3) = abs(startframe - iii);
        %clear startframe;  
    elseif diffdur(iii) == 1 && iii == length(diffdur)      
        duration_storage(startframe,2) = iii;
        duration_storage(startframe,3) = abs(startframe - iii);
        %clear startframe;
    end 

end 

duration_storage( all(~duration_storage,2), : ) = []; % removes all rows with all zero
for iiii = 1:length(duration_storage)
    if duration_storage(iiii,3) == 0
        duration_storage(iiii,:) = 0;
    end 
end 
duration_storage( all(~duration_storage,2), : ) = [];

clear i ii iii iiii

bouts = [];

bout = duration_storage;

boutfinal = zeros(500,2);
same = 0; 
for i = 1:length(duration_storage)
    if duration_storage(i,3) < 15 && same == 0 && i < length(bout) %find start of bouts
        if duration_storage(i+1,3) >= 15 && ((duration_storage(i+1,1) ...
        - duration_storage(i,2)) <= 15) %start bout 
            start = i; 
            boutfinal(start,1) = duration_storage(i,1);
            boutfinal(start,2) = duration_storage(i,2);
            same = 1;
        else 
            same = 0;
        end 
    elseif duration_storage(i,3) >= 15 && same == 0 %start bout
        start = i;
        boutfinal(start,1) = duration_storage(i,1);
        boutfinal(start,2) = duration_storage(i,2);
        same = 1; 
    elseif duration_storage(i,3) >= 15 && same == 1
        if(duration_storage(i,1) - duration_storage(i-1,2)) <= 15 % if same bout 
            add = duration_storage(i,2) - boutfinal(start,2); 
            boutfinal(start,2) = boutfinal(start,2) + add; 
        else %lets say not the same bout 
            start = i; 
            boutfinal(start,1) = duration_storage(i,1);
            boutfinal(start,2) = duration_storage(i,2);
        end 
    elseif duration_storage(i,3) < 15 && same == 1 && i < length(bout)
        if(duration_storage(i,1) - duration_storage(i-1,2)) <= 15
            add = duration_storage(i,2) - boutfinal(start,2); 
            boutfinal(start,2) = boutfinal(start,2) + add;
        elseif duration_storage(i+1,3) >= 15 && ((duration_storage(i+1,1) ...
            - duration_storage(i,2)) <= 15) %start bout 
                start = i; 
                boutfinal(start,1) = duration_storage(i,1);
                boutfinal(start,2) = duration_storage(i,2);
                same = 1;
        else 
            same = 0;      
        end 
    end 
end 

boutfinal( all(~boutfinal,2), : ) = [];

for i= 1:length(boutfinal)
    boutfinal(i,3) = boutfinal(i,2) - boutfinal(i,1); 
end 


for ii = 1:length(duration)
    if duration(ii) >= 1
       duration(ii) = 1;
    end 
end 

plot(duration);
hold on
for i = 1:length (boutfinal) 
    x = [boutfinal(i,1) boutfinal(i,1) boutfinal(i,2) boutfinal(i,2)];
    y = [0 1 1 0];
    patch(x,y,'green','FaceAlpha',.4,'EdgeColor', 'None')
end 

%histogram(boutfinal(:,3),20);
average = mean(boutfinal(:,3));

%%Caring about the ones during the lever %% 

leverInteractions = [];
ltimer = dlcmedstruct.LeverTiming_F;
for j = 1:length(duration_storage)
    r = duration_storage(j,1);
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
        leverInteractions(j,:) = duration_storage(j,:);
    else 
    end 
end 

leverInteractions( all(~leverInteractions,2), : ) = [];

leverTotalInteract = 0;
ltimer = dlcmedstruct.LeverTiming_F;
for j = 1:length(duration)
    r = j;
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
        if duration(r) == 1
            leverTotalInteract = leverTotalInteract + 1;
        else 
        end 
    else 
    end 
end 


dlcmedstruct.Proximity.Lever.TotalInteractionsRaw = duration_storage;
dlcmedstruct.Proximity.Lever.TotalBouts = boutfinal;
dlcmedstruct.Proximity.Lever.DistanceTraceRaw = m;
dlcmedstruct.Proximity.Lever.ProximityTraceRaw = duration;
dlcmedstruct.Proximity.Lever.NumberofBouts = length(boutfinal);
dlcmedstruct.Proximity.Lever.Average = average;
dlcmedstruct.Proximity.Lever.LeverInteractions = leverInteractions;
dlcmedstruct.Proximity.Lever.TotalInteractionLever = leverTotalInteract;

save(structname, 'dlcmedstruct') 
end 