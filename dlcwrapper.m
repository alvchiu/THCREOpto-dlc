%% DLC Wrapper %%

%% Written by Alvin Chiu - University of Michigan 

%% After DLC video analysis %%  

%% Inputs
% 1. Med Associates Excel File - Data structure must be structured as the example template or else it will cause problems 
% 2. DLC Collected Data Excel (.csv output from dlc) 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEW STRUCTURE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Set-Up FOR NEW STRUCTURE %% 
%Set-Up correct folders, directory, and paths 

%INPUTS
subject = ''; %Animal ID of interest 
dir = ''; %where to save file 
fps = 15; %fps of video 

dlcfile = ''; %collected data .xl from dlc  
maxframe = ''; %just the row # on the excel sheet, not actually last frame

% DO NOT CHANGE 
dlcmedstruct = struct; 
filename = 'dlcmedstruct';
connect = '\';
connect2 = '_';
structname = strcat(dir,connect,filename,connect2,subject);
save(structname, 'dlcmedstruct')

%% Med Associate Import  %% 
%Import RAW data from med associate file, see example for formating  
%11/21/2022 - only can extract from the med associate publication videos,
%will need to change cell numbers if for something else. 

%INPUT
medraw = 'MedAssociateTestData.xlsx'; %% name of medfile 
day = 3; %%day of experiment

%OUTPUTS
% 1. dlcmedstruct.MedAssociate._____: All MedAssociate info stored in structure

%FUNCTION
importMedAssociate(day, medraw, subject, structname)
load(structname); %load workspace with updated data 


%% Convert Variable Time into Lever Timing 
%Using the MedAssociate info stored in above structure, convert variable
%time into time intervals in both frames and seconds

%OUTPUTS
% 1. MedAssociates.LeverTiming_F: Lever timing in frame timepoints
% 2. MedAssociates.LeverTiming_S: Lever timing in second timepoints

%FUNCTION
leverTiming(subject,fps, structname);
load(structname); %load workspace with updated data 


%% Compare to Video Timer
%1.Take the video from DLC and put into premier pro, crop the lever as tight
%as possible and then export it as an mp4

%2. There should be 25 peaks detected, if not, need to manually check and
%align that trial, could happen if rat is covering lever 

%INPUTS 
levervideo = 'WN19_Rat40_LeverTimer.mp4';

%OUTPUTS
%1. LeverTiming_F: Timing of the lever in frames of the trials from video
%2. NumDetectedTrials: MUST be 25 trials 

%FUNCTION 
findLeverTime(structname,levervideo);
load(structname);


%% QC Step: Overlay Med Associate Timer and Video Timer 

%FUNCTION
qcLeverTiming(structname);
load(structname);


%OUTPUTS
% 1. Pop-up figure to double check, manual save 

%% Conversion of Other Med Associate Information to Frame Timepoints 
%Using the MedAssociate info stored in the above structure, convert into
%events with specific FRAME

% OUTPUTS
% 1. LatencytoFP_F: Latency to first lever press at frame timepoints
% 2. PelletDelivery_F: Pellet delivery/ trial at frame timepoints
% 3. LatencytoMagEntry_F: Latency to first mag entry at frame timepoints

%FUNCTION
convertMed(structname);
load(structname);


%% Extracting Body Points  %%
% Extracting XY coordinates of body points and import into structure

%OUTPUTs
% XYCoordinates.Nose/FoodCup/LeftMark/RightMark/LeftEar/RightEar/Tail/Tether

%FUNCTION
importBodyCoordinate(dlcfile, maxframe, structname); 
importLikelihood(dlcfile, maxframe, structname); 
load(structname)


%% Flip Lever %%
% All lever should be aligned to the bottom left, if not do this step to
% flip all coordinates, moves xycoordinates into original and repopulates
% original coordinate with flipped values

%Function
flipLever(structname);
load(structname);


%% Interpolate Nose and Tether%%
% Remove points below a certain threshold of likelihood and apply linear
% interpolation to those points 

noseInter(structname);
load(structname);

x_arena = 1281; %cut off right pixels to be multiple of 3 
y_arena = 720;

tetherInter(x_arena, y_arena, structname)
load(structname);


%% Extra maybe useful functions %% 

%% IF RELOADING JUST RUN THIS PART %%
clc
clear 


subject = ''; %Animal ID of interest
dir = '';
filename = 'dlcmedstruct';
connect = '\';
connect2 = '_';
structname = strcat(dir,connect,filename,connect2,subject);

%insert function of interest here %
%%%%
%%%%
load(structname);



%%Group Data Reload 

filename1 = 'grouponestruct';
dir1 = 'Y:\THCREOpto2023\THCREPublicationVideos\Processed Videos\Group1';
connect = '\';
structname1 = strcat(dir1,connect,filename1);


filename2 = 'grouptwostruct';
dir2 = 'Y:\THCREOpto2023\THCREPublicationVideos\Processed Videos\Group2';
connect = '\';
structname2 = strcat(dir2,connect,filename2);

