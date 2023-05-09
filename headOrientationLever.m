function headOrientationLever(structname)
%%Head Orientation Video and Graph%% 

load (structname)

Nose = dlcmedstruct.InterNose;
Tether = dlcmedstruct.InterTether;

startframe = 1;
finalframe = dlcmedstruct.NumofFrames;
angleB = [];


%% Generate Head Direction Over Time LEVER %%

headangle = [];

for i = 1:dlcmedstruct.NumofFrames
sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 100)^2);
sideC = sqrt((leftedge-Tether(i))^2 + (100-Tether(i,2))^2);

headangle(i,1) = i;
headangle(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;
end 

k = headangle(:,1);
m = headangle(:,2);

% plot(k,m)
% title('Head Orientation Towards LEVER')
% xlabel('Frame')
% ylabel('Angle between 0-180')
% yline(180);

%% Generate Head Direction Over Time Lever %%

headangle = [];

for i = 1:dlcmedstruct.NumofFrames
sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 300)^2);
sideC = sqrt((leftedge-Tether(i))^2 + (300-Tether(i,2))^2);

headangle(i,1) = i;
headangle(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;
end 

k = headangle(:,1);
m = headangle(:,2);

% plot(k,m)
% title('Head Orientation Towards Lever')
% xlabel('Frame')
% ylabel('Angle between 0-180')
% yline(180);
% 
% figure
% polarplot(m)
% title('Head Orientation Towards Lever Combined')

%Polar IN VS OUT 

ltimer = dlcmedstruct.LeverTiming_F; %convert frames (i) into seconds 
% headoriIN = [];
% headoriOUT = [];
% 
% for r = 1:dlcmedstruct.NumofFrames
%     if ((r >= ltimer(1,1)) && (r <= ltimer(1,1) + 123)) || ((r >= ltimer(1,2)) && (r <= ltimer(1,2) + 123)) || ... 
%     ((r >= ltimer(1,3)) && (r <= ltimer(1,3) + 123)) || ((r >= ltimer(1,4)) && (r <= ltimer(1,4) + 123)) || ...
%     ((r >= ltimer(1,5)) && (r <= ltimer(1,5) + 123)) || ((r >= ltimer(1,6)) && (r <= ltimer(1,6) + 123)) || ...
%     ((r >= ltimer(1,7)) && (r <= ltimer(1,7) + 123)) || ((r >= ltimer(1,8)) && (r <= ltimer(1,8) + 123)) || ...
%     ((r >= ltimer(1,9)) && (r <= ltimer(1,9) + 123)) || ((r >= ltimer(1,10)) && (r <= ltimer(1,10) + 123)) || ...
%     ((r >= ltimer(1,11)) && (r <= ltimer(1,11) + 123)) || ((r >= ltimer(1,12)) && (r <= ltimer(1,12) + 123)) || ...
%     ((r >= ltimer(1,13)) && (r <= ltimer(1,13) + 123)) || ((r >= ltimer(1,14)) && (r <= ltimer(1,14) + 123)) || ...
%     ((r >= ltimer(1,15)) && (r <= ltimer(1,15) + 123)) || ((r >= ltimer(1,16)) && (r <= ltimer(1,16) + 123)) || ...
%     ((r >= ltimer(1,17)) && (r <= ltimer(1,17) + 123)) || ((r >= ltimer(1,18)) && (r <= ltimer(1,18) + 123)) || ...
%     ((r >= ltimer(1,19)) && (r <= ltimer(1,19) + 123)) || ((r >= ltimer(1,20)) && (r <= ltimer(1,20) + 123)) || ...
%     ((r >= ltimer(1,21)) && (r <= ltimer(1,21) + 123)) || ((r >= ltimer(1,22)) && (r <= ltimer(1,22) + 123)) || ...
%     ((r >= ltimer(1,23)) && (r <= ltimer(1,23) + 123)) || ((r >= ltimer(1,24)) && (r <= ltimer(1,24) + 123)) || ...
%     ((r >= ltimer(1,25)) && (r <= ltimer(1,25) + 123))
%         i= r;
%         sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
%         sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 300)^2);
%         sideC = sqrt((leftedge-Tether(i))^2 + (300-Tether(i,2))^2);
%         headoriOUT(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
%     else 
%         i = r;
%         sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
%         sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 300)^2);
%         sideC = sqrt((leftedge-Tether(i))^2 + (300-Tether(i,2))^2);
%         headoriIN(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
%     end 
% end 
% 
% figure
% tiledlayout (1,2)
% nexttile;
% polarplot(headoriIN)
% title('Head Orientation Towards Lever - LeverIN')
% nexttile;
% polarplot(headoriOUT)
% title('Head Orientation Towards Lever - Lever OUT')

% POLAR BEfore DURING AFTER 
headoriDURING = [];
headoriBEFORE = [];
headoriAFTER = [];

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
         
        i= r;
        sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
        sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 300)^2);
        sideC = sqrt((leftedge-Tether(i))^2 + (300-Tether(i,2))^2);
        headoriDURING(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
        headoriDURING(i,1) = i;
        if Nose(i,2) >= Tether (i,2)
            headoriDURING(i,3) = 1;
        else 
            headoriDURING(i,3) = 2;
        end 
    
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

        i= r;
        sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
        sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 300)^2);
        sideC = sqrt((leftedge-Tether(i))^2 + (300-Tether(i,2))^2);
        headoriBEFORE(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
        headoriBEFORE(i,1) = i;
        if Nose(i,2) >= Tether (i,2)
            headoriBEFORE(i,3) = 1;
        else 
            headoriBEFORE(i,3) = 2;
        end 

    %AFTER
    elseif((r >= ltimer(1,1)) && (r < ltimer(1,1) + 246)) || ((r >= ltimer(1,2)) && (r < ltimer(1,2) + 246)) || ... 
    ((r >= ltimer(1,3)) && (r < ltimer(1,3) + 246)) || ((r >= ltimer(1,4)) && (r < ltimer(1,4) + 246)) || ...
    ((r >= ltimer(1,5)) && (r < ltimer(1,5) + 246)) || ((r >= ltimer(1,6)) && (r < ltimer(1,6) + 246)) || ...
    ((r >= ltimer(1,7)) && (r < ltimer(1,7) + 246)) || ((r >= ltimer(1,8)) && (r < ltimer(1,8) + 246)) || ...
    ((r >= ltimer(1,9)) && (r < ltimer(1,9) + 246)) || ((r >= ltimer(1,10)) && (r < ltimer(1,10) + 246)) || ...
    ((r >= ltimer(1,11)) && (r < ltimer(1,11) + 246)) || ((r >= ltimer(1,12)) && (r < ltimer(1,12) + 246)) || ...
    ((r >= ltimer(1,13)) && (r < ltimer(1,13) + 246)) || ((r >= ltimer(1,14)) && (r < ltimer(1,14) + 246)) || ...
    ((r >= ltimer(1,15)) && (r < ltimer(1,15) + 246)) || ((r >= ltimer(1,16)) && (r < ltimer(1,16) + 246)) || ...
    ((r >= ltimer(1,17)) && (r < ltimer(1,17) + 246)) || ((r >= ltimer(1,18)) && (r < ltimer(1,18) + 246)) || ...
    ((r >= ltimer(1,19)) && (r < ltimer(1,19) + 246)) || ((r >= ltimer(1,20)) && (r < ltimer(1,20) + 246)) || ...
    ((r >= ltimer(1,21)) && (r < ltimer(1,21) + 246)) || ((r >= ltimer(1,22)) && (r < ltimer(1,22) + 246)) || ...
    ((r >= ltimer(1,23)) && (r < ltimer(1,23) + 246)) || ((r >= ltimer(1,24)) && (r < ltimer(1,24) + 246)) || ...
    ((r >= ltimer(1,25)) && (r < ltimer(1,25) + 246))

        i= r;
        sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
        sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 300)^2);
        sideC = sqrt((leftedge-Tether(i))^2 + (300-Tether(i,2))^2);
        headoriAFTER(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;
        headoriAFTER(i,1) = i; 
        if Nose(i,2) >= Tether (i,2)
            headoriAFTER(i,3) = 1;
        else 
            headoriAFTER(i,3) = 2;
        end 
      
    end 
end 

headoriBEFORE( all(~headoriBEFORE,2), : ) = [];
headoriDURING( all(~headoriDURING,2), : ) = [];
headoriAFTER( all(~headoriAFTER,2), : ) = [];


dlcmedstruct.HeadOrientation.HeadOrientationLever_Before = headoriBEFORE;
dlcmedstruct.HeadOrientation.HeadOrientationLever_During = headoriDURING;
dlcmedstruct.HeadOrientation.HeadOrientationLever_After = headoriAFTER;
save(structname, 'dlcmedstruct')

% figure
% tiledlayout (1,3)
% nexttile;
% polarplot(headoriBEFORE)
% title('Head Orientation Towards Lever - Before')
% nexttile;
% polarplot(headoriDURING)
% title('Head Orientation Towards Lever - During')
% nexttile; 
% polarplot(headoriAFTER)
% title('Head Orientation Towards Lever - After')



