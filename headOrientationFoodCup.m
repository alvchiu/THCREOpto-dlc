function headOrientationFoodCup(structname)
%%Head Orientation Video and Graph%% 



load (structname)

Nose = dlcmedstruct.InterNose;
Tether = dlcmedstruct.XYCoordinates.Tether;
FoodCup = dlcmedstruct.XYCoordinates.FoodCup;



leftedgex = mean(FoodCup(:,1));
leftedgey = mean(FoodCup(:,2));

%% Generate Head Direction Over Time FOODCUP %%

headangle = [];

for i = 1:dlcmedstruct.NumofFrames
sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
sideB = sqrt((Nose(i)- leftedgex)^2 + (Nose(i,2)- leftedgey)^2);
sideC = sqrt((leftedgex-Tether(i))^2 + (leftedgey-Tether(i,2))^2);

headangle(i,1) = i;
headangle(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;
end 


% plot(k,m)
% title('Head Orientation Towards FOODCUP')
% xlabel('Frame')
% ylabel('Angle between 0-180')
% yline(180);
% 
% figure
% polarplot(m)
% title('Head Orientation Towards FOODCUP Combined')

%Polar IN VS OUT 

ltimer = dlcmedstruct.LeverTiming_F; %convert frames (i) into seconds 
% headoriIN = [];
% headoriOUT = [];
% 
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
        i= r;
        sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
        sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 300)^2);
        sideC = sqrt((leftedge-Tether(i))^2 + (300-Tether(i,2))^2);
        headoriOUT(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
    else 
        i = r;
        sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
        sideB = sqrt((Nose(i)- leftedge)^2 + (Nose(i,2)- 300)^2);
        sideC = sqrt((leftedge-Tether(i))^2 + (300-Tether(i,2))^2);
        headoriIN(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
    end 
end 
% 
% tiledlayout (1,2)
% nexttile;
% polarplot(headoriIN)
% title('Head Orientation Towards FoodCup - LeverIN')
% nexttile;
% polarplot(headoriOUT)
% title('Head Orientation Towards FoodCup - Lever OUT')

% POLAR BEfore DURING AFTER 
headoriDURING = [];
headoriBEFORE = [];
headoriBEAFTER = [];
headoriAFTER = [];
headoriITI = [];

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
        sideB = sqrt((Nose(i)- leftedgex)^2 + (Nose(i,2)- leftedgey)^2);
        sideC = sqrt((leftedgex-Tether(i))^2 + (leftedgey-Tether(i,2))^2);
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
        sideB = sqrt((Nose(i)- leftedgex)^2 + (Nose(i,2)- leftedgey)^2);
        sideC = sqrt((leftedgex-Tether(i))^2 + (leftedgey-Tether(i,2))^2);
        headoriBEFORE(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
        headoriBEFORE(i,1) = i; 
        if Nose(i,2) >= Tether (i,2)
            headoriBEFORE(i,3) = 1;
        else 
            headoriBEFORE(i,3) = 2;
        end 

    %2SECBEFOREAFTER 
    elseif((r >= ltimer(1,1) + 63) && (r < ltimer(1,1) + 123)) || ((r >= ltimer(1,2) + 63) && (r < ltimer(1,2) + 123)) || ... 
    ((r >= ltimer(1,3) + 63) && (r < ltimer(1,3) + 123)) || ((r >= ltimer(1,4) + 63) && (r < ltimer(1,4) + 123)) || ...
    ((r >= ltimer(1,5) + 63) && (r < ltimer(1,5) + 123)) || ((r >= ltimer(1,6) + 63) && (r < ltimer(1,6) + 123)) || ...
    ((r >= ltimer(1,7) + 63) && (r < ltimer(1,7) + 123)) || ((r >= ltimer(1,8) + 63) && (r < ltimer(1,8) + 123)) || ...
    ((r >= ltimer(1,9) + 63) && (r < ltimer(1,9) + 123)) || ((r >= ltimer(1,10) + 63) && (r < ltimer(1,10) + 123)) || ...
    ((r >= ltimer(1,11) + 63) && (r < ltimer(1,11) + 123)) || ((r >= ltimer(1,12) + 63) && (r < ltimer(1,12) + 123)) || ...
    ((r >= ltimer(1,13) + 63) && (r < ltimer(1,13) + 123)) || ((r >= ltimer(1,14) + 63) && (r < ltimer(1,14) + 123)) || ...
    ((r >= ltimer(1,15) + 63) && (r < ltimer(1,15) + 123)) || ((r >= ltimer(1,16) + 63) && (r < ltimer(1,16) + 123)) || ...
    ((r >= ltimer(1,17) + 63) && (r < ltimer(1,17) + 123)) || ((r >= ltimer(1,18) + 63) && (r < ltimer(1,18) + 123)) || ...
    ((r >= ltimer(1,19) + 63) && (r < ltimer(1,19) + 123)) || ((r >= ltimer(1,20) + 63) && (r < ltimer(1,20) + 123)) || ...
    ((r >= ltimer(1,21) + 63) && (r < ltimer(1,21) + 123)) || ((r >= ltimer(1,22) + 63) && (r < ltimer(1,22) + 123)) || ...
    ((r >= ltimer(1,23) + 63) && (r < ltimer(1,23) + 123)) || ((r >= ltimer(1,24) + 63) && (r < ltimer(1,24) + 123)) || ...
    ((r >= ltimer(1,25) + 63) && (r < ltimer(1,25) + 123))

        i= r;
        sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
        sideB = sqrt((Nose(i)- leftedgex)^2 + (Nose(i,2)- leftedgey)^2);
        sideC = sqrt((leftedgex-Tether(i))^2 + (leftedgey-Tether(i,2))^2);
        headoriBEAFTER(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
        headoriBEAFTER(i,1) = i; 
        if Nose(i,2) >= Tether (i,2)
            headoriBEAFTER(i,3) = 1;
        else 
            headoriBEAFTER(i,3) = 2;
        end
  

    %AFTER
    elseif((r >= ltimer(1,1) + 123) && (r < ltimer(1,1) + 246)) || ((r >= ltimer(1,2) + 246) && (r < ltimer(1,2) + 246)) || ... 
    ((r >= ltimer(1,3) + 123) && (r < ltimer(1,3) + 246)) || ((r >= ltimer(1,4) + 123) && (r < ltimer(1,4) + 246)) || ...
    ((r >= ltimer(1,5) + 123) && (r < ltimer(1,5) + 246)) || ((r >= ltimer(1,6) + 123) && (r < ltimer(1,6) + 246)) || ...
    ((r >= ltimer(1,7) + 123) && (r < ltimer(1,7) + 246)) || ((r >= ltimer(1,8) + 123) && (r < ltimer(1,8) + 246)) || ...
    ((r >= ltimer(1,9) + 123) && (r < ltimer(1,9) + 246)) || ((r >= ltimer(1,10) + 123) && (r < ltimer(1,10) + 246)) || ...
    ((r >= ltimer(1,11) + 123) && (r < ltimer(1,11) + 246)) || ((r >= ltimer(1,12) + 123) && (r < ltimer(1,12) + 246)) || ...
    ((r >= ltimer(1,13) + 123) && (r < ltimer(1,13) + 246)) || ((r >= ltimer(1,14) + 123) && (r < ltimer(1,14) + 246)) || ...
    ((r >= ltimer(1,15) + 123) && (r < ltimer(1,15) + 246)) || ((r >= ltimer(1,16) + 123) && (r < ltimer(1,16) + 246)) || ...
    ((r >= ltimer(1,17) + 123) && (r < ltimer(1,17) + 246)) || ((r >= ltimer(1,18) + 123) && (r < ltimer(1,18) + 246)) || ...
    ((r >= ltimer(1,19) + 123) && (r < ltimer(1,19) + 246)) || ((r >= ltimer(1,20) + 123) && (r < ltimer(1,20) + 246)) || ...
    ((r >= ltimer(1,21) + 123) && (r < ltimer(1,21) + 246)) || ((r >= ltimer(1,22) + 123) && (r < ltimer(1,22) + 246)) || ...
    ((r >= ltimer(1,23) + 123) && (r < ltimer(1,23) + 246)) || ((r >= ltimer(1,24) + 123) && (r < ltimer(1,24) + 246)) || ...
    ((r >= ltimer(1,25) + 123) && (r < ltimer(1,25) + 246))

        i= r;
        sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
        sideB = sqrt((Nose(i)- leftedgex)^2 + (Nose(i,2)- leftedgey)^2);
        sideC = sqrt((leftedgex-Tether(i))^2 + (leftedgey-Tether(i,2))^2);
        headoriAFTER(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
        headoriAFTER(i,1) = i; 
        if Nose(i,2) >= Tether (i,2)
            headoriAFTER(i,3) = 1;
        else 
            headoriAFTER(i,3) = 2;
        end
    
    %ITI 

    elseif(r >= ((ltimer(1,2) - (ltimer(1,1) + 123))/2) + (ltimer(1,1) + 123)  && (r < ((ltimer(1,2) - (ltimer(1,1) + 123))/2) + (ltimer(1,1) + 123) + 123)|| ...
          (r >= ((ltimer(1,3) - (ltimer(1,2) + 123))/2) + (ltimer(1,2) + 123) && (r < ((ltimer(1,3) - (ltimer(1,2) + 123))/2)  + (ltimer(1,2) + 123) + 123))|| ...
          (r >= ((ltimer(1,4) - (ltimer(1,3) + 123))/2) + (ltimer(1,3) + 123) && (r < ((ltimer(1,4) - (ltimer(1,3) + 123))/2)  + (ltimer(1,3) + 123) + 123))|| ...
          (r >= ((ltimer(1,5) - (ltimer(1,4) + 123))/2) + (ltimer(1,4) + 123) && (r < ((ltimer(1,5) - (ltimer(1,4) + 123))/2)  + (ltimer(1,4) + 123) + 123))|| ...
          (r >= ((ltimer(1,6) - (ltimer(1,5) + 123))/2) + (ltimer(1,5) + 123) && (r < ((ltimer(1,6) - (ltimer(1,5) + 123))/2)  + (ltimer(1,5) + 123) + 123))|| ...
          (r >= ((ltimer(1,7) - (ltimer(1,6) + 123))/2) + (ltimer(1,6) + 123) && (r < ((ltimer(1,7) - (ltimer(1,6) + 123))/2)  + (ltimer(1,6) + 123) + 123))|| ...
          (r >= ((ltimer(1,8) - (ltimer(1,7) + 123))/2) + (ltimer(1,7) + 123) && (r < ((ltimer(1,8) - (ltimer(1,7) + 123))/2)  + (ltimer(1,7) + 123) + 123))|| ...
          (r >= ((ltimer(1,9) - (ltimer(1,8) + 123))/2) + (ltimer(1,8) + 123) && (r < ((ltimer(1,9) - (ltimer(1,8) + 123))/2)  + (ltimer(1,8) + 123) + 123))|| ...
          (r >= ((ltimer(1,10) - (ltimer(1,9) + 123))/2) + (ltimer(1,9) + 123) && (r < ((ltimer(1,10) - (ltimer(1,9) + 123))/2)  + (ltimer(1,9) + 123) + 123))|| ...
          (r >= ((ltimer(1,11) - (ltimer(1,10) + 123))/2) + (ltimer(1,10) + 123) && (r < ((ltimer(1,11) - (ltimer(1,10) + 123))/2)  + (ltimer(1,10) + 123) + 123))|| ...
          (r >= ((ltimer(1,12) - (ltimer(1,11) + 123))/2) + (ltimer(1,11) + 123) && (r < ((ltimer(1,12) - (ltimer(1,11) + 123))/2)  + (ltimer(1,11) + 123) + 123))|| ...
          (r >= ((ltimer(1,13) - (ltimer(1,12) + 123))/2) + (ltimer(1,12) + 123) && (r < ((ltimer(1,13) - (ltimer(1,12) + 123))/2)  + (ltimer(1,12) + 123) + 123))|| ...
          (r >= ((ltimer(1,14) - (ltimer(1,13) + 123))/2) + (ltimer(1,13) + 123) && (r < ((ltimer(1,14) - (ltimer(1,13) + 123))/2)  + (ltimer(1,13) + 123) + 123))|| ...
          (r >= ((ltimer(1,15) - (ltimer(1,14) + 123))/2) + (ltimer(1,14) + 123) && (r < ((ltimer(1,15) - (ltimer(1,14) + 123))/2)  + (ltimer(1,14) + 123) + 123))|| ...
          (r >= ((ltimer(1,16) - (ltimer(1,15) + 123))/2) + (ltimer(1,15) + 123) && (r < ((ltimer(1,16) - (ltimer(1,15) + 123))/2)  + (ltimer(1,15) + 123) + 123))|| ...
          (r >= ((ltimer(1,17) - (ltimer(1,16) + 123))/2) + (ltimer(1,16) + 123) && (r < ((ltimer(1,17) - (ltimer(1,16) + 123))/2)  + (ltimer(1,16) + 123) + 123))|| ...
          (r >= ((ltimer(1,18) - (ltimer(1,17) + 123))/2) + (ltimer(1,17) + 123) && (r < ((ltimer(1,18) - (ltimer(1,17) + 123))/2)  + (ltimer(1,17) + 123) + 123))|| ...
          (r >= ((ltimer(1,19) - (ltimer(1,18) + 123))/2) + (ltimer(1,18) + 123) && (r < ((ltimer(1,19) - (ltimer(1,18) + 123))/2)  + (ltimer(1,18) + 123) + 123))|| ...
          (r >= ((ltimer(1,20) - (ltimer(1,19) + 123))/2) + (ltimer(1,19) + 123) && (r < ((ltimer(1,20) - (ltimer(1,19) + 123))/2)  + (ltimer(1,19) + 123) + 123))|| ...
          (r >= ((ltimer(1,21) - (ltimer(1,20) + 123))/2) + (ltimer(1,20) + 123) && (r < ((ltimer(1,21) - (ltimer(1,20) + 123))/2)  + (ltimer(1,20) + 123) + 123))|| ...
          (r >= ((ltimer(1,22) - (ltimer(1,21) + 123))/2) + (ltimer(1,21) + 123) && (r < ((ltimer(1,22) - (ltimer(1,21) + 123))/2)  + (ltimer(1,21) + 123) + 123))|| ...
          (r >= ((ltimer(1,23) - (ltimer(1,22) + 123))/2) + (ltimer(1,22) + 123) && (r < ((ltimer(1,23) - (ltimer(1,22) + 123))/2)  + (ltimer(1,22) + 123) + 123))|| ...
          (r >= ((ltimer(1,24) - (ltimer(1,23) + 123))/2) + (ltimer(1,23) + 123) && (r < ((ltimer(1,24) - (ltimer(1,23) + 123))/2)  + (ltimer(1,23) + 123) + 123))|| ...
          (r >= ((ltimer(1,25) - (ltimer(1,24) + 123))/2) + (ltimer(1,24) + 123) && (r < ((ltimer(1,25) - (ltimer(1,24) + 123))/2)  + (ltimer(1,24) + 123) + 123)))
            
            i= r;
            sideA = sqrt((Nose(i)-Tether(i))^2 + (Nose(i,2)-Tether(i,2))^2);
            sideB = sqrt((Nose(i)- leftedgex)^2 + (Nose(i,2)- leftedgey)^2);
            sideC = sqrt((leftedgex-Tether(i))^2 + (leftedgey-Tether(i,2))^2);
            headoriITI(i,2) = (acos(((sideA)^2 + (sideC)^2 - (sideB)^2)/ (2 * sideA * sideC))) * 180/pi;  
            headoriITI(i,1) = i; 
            if Nose(i,2) >= Tether (i,2)
                headoriITI(i,3) = 1;
            else 
                headoriITI(i,3) = 2;
            end 
    end 

end 

headoriBEFORE( all(~headoriBEFORE,2), : ) = [];
headoriDURING( all(~headoriDURING,2), : ) = [];
headoriAFTER( all(~headoriAFTER,2), : ) = [];
headoriITI( all(~headoriITI,2), : ) = [];
headoriBEAFTER( all(~headoriBEAFTER,2), : ) = [];


% tiledlayout (1,3)
% nexttile;
% polarplot(headoriBEFORE)
% title('Head Orientation Towards FoodCup - Before')
% nexttile;
% polarplot(headoriDURING)
% title('Head Orientation Towards FoodCup - During')
% nexttile; 
% polarplot(headoriAFTER)
% title('Head Orientation Towards FoodCup - After')

dlcmedstruct.HeadOrientation.HeadOrientation_Before8 = headoriBEFORE;
dlcmedstruct.HeadOrientation.HeadOrientation_During8 = headoriDURING;
dlcmedstruct.HeadOrientation.HeadOrientation_After8 = headoriAFTER;
dlcmedstruct.HeadOrientation.HeadOrientation_ITI8 = headoriITI;
% dlcmedstruct.HeadOrientation.HeadOrientation_BeAfter4 = headoriBEAFTER;


save(structname, 'dlcmedstruct')
end 