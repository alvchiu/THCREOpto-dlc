function importMedAssociate(day, medraw, subject, structname)

% Raw Data Export
rnumoflp = readmatrix(medraw, 'Range', ('D2:AB27'));
rlatencytolp = readmatrix(medraw, 'Range', ('AD2:BB27'));
rnumcsmagentry = readmatrix(medraw, 'Range', ('BD2:CB27'));
rlatencytocsmagentry = readmatrix(medraw, 'Range', ('CD2:DB27'));
rnumncsmagentry = readmatrix(medraw, 'Range', ('DD2:EB27'));
rvariabletime = readmatrix(medraw, 'Range', ('EC2:FA27'));
rsubject = readmatrix(medraw, 'Range', ('A2:A27'));

%Save MedAssociate Raw Data 
dlcmedstruct.MedAssociate = struct('LatencyToLP', rlatencytolp, ...
    'NumberofCSMagEntry', rnumcsmagentry, 'LatencytoCSMagEntry', ...
    rlatencytocsmagentry, 'NumberofLP', rnumoflp, 'VariableTime', rvariabletime, ...
    'NumberofNCSMagEntry', rnumncsmagentry,'Subject', rsubject);
dlcmedstruct.Subject = subject;
dlcmedstruct.Day = day;

save(structname, 'dlcmedstruct')

end 