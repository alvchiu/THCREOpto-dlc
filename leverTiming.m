function leverTiming(subject, fps, structname)%% Lever Presentation Timing%%  

%Importing Excel Sheet%
%levertiming = readmatrix(medfile);

% 25 Trials, first lever and pellet presentation at variable time (S(0)) 
% Column 1: Subject ID 
% Column 2-26: Trial Number
load(structname)

subjectID = dlcmedstruct.MedAssociate.Subject(:,1);
ltimer = [];
row = find(subjectID == str2double(subject));

%Trial 1 
for i = 1:25 %columns 2-25 from excel sheet are trials  
    for ii = 1:length(subjectID) %number of subjects in excel sheet
        ltimer(ii,1) = dlcmedstruct.MedAssociate.VariableTime(ii,1); 
    end 
end 

%Trial 2-26
%8.2 seconds for lever
for i = 3:25 %Trials 2=25 
    for ii = 1:length(subjectID)
        ltimer(ii,i-1) = ltimer(ii,i-2) + 8.2 + dlcmedstruct.MedAssociate.VariableTime(ii,i-1);
    end 
end 

ltimer1 = zeros(26,25);
ltimer1(:,1) = 1876/15;
ltimer1(:,2:end) = ltimer +(1876/15);

ltimer = ltimer1;

% connect = '\';
% final = strcat(dir,connect,filename2);
% save (final, 'subjectID', 'ltimer')

%load(structname);
dlcmedstruct.MedAssociate.LeverTiming_S = ltimer(row(),:);
dlcmedstruct.MedAssociate.LeverTiming_F = (dlcmedstruct.MedAssociate.LeverTiming_S) * fps; 
dlcmedstruct.SubjectRow = row; 
dlcmedstruct.FramesPerSecond = fps;
save(structname, 'dlcmedstruct')



