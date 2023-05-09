function importLikelihood (dlcfile, maxframe, structname)

 %KEY  
 % Nose BC
 % Tail KL
 % Left Mark NO
 % Right Mark QR 
 % Food Cup Z AA
 % LeftEar EF
 % RightEar HI

load (structname)
%Exporting XY coordinates columns only  

Nose = readmatrix(dlcfile,'Range', strcat('D4:','D',maxframe));
Tail = readmatrix(dlcfile,'Range', strcat('M4:','M',maxframe));
LeftMark = readmatrix(dlcfile,'Range', strcat('S4:','S',maxframe));
RightMark = readmatrix(dlcfile, 'Range', strcat('V4:','V',maxframe));
FoodCup = readmatrix(dlcfile, 'Range', strcat('Y4:','Y',maxframe));
LeftEar = readmatrix(dlcfile, 'Range', strcat('G4:','G',maxframe));
RightEar = readmatrix(dlcfile, 'Range', strcat('J4:','J',maxframe));
Tether = readmatrix(dlcfile, 'Range', strcat('P4:','P',maxframe));

dlcmedstruct.Likelihood = struct('FoodCup', FoodCup, 'Nose',Nose,'Tail',Tail,'LeftMark',LeftMark,'RightMark',RightMark, 'LeftEar', LeftEar, 'RightEar', RightEar, 'Tether', Tether);
%dlcmedstruct.NumofFrames = str2double(maxframe);
save (structname, 'dlcmedstruct');
