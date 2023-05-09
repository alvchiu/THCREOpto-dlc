function convertMed(structname)

% 1. Latency to First Lever Press
% 2. 

load(structname)
%% Latency to LP %% 

templatency = dlcmedstruct.MedAssociate.LatencyToLP((dlcmedstruct.SubjectRow),:); 

templat = [];
templat2 = [];

for i = 1:length(templatency)
    if templatency(1,i) >= 8
        templat(1,i) = 0;
        templat2(1,i) = 0;
    else 
        templat(1,i) = templatency(1,i);
        templat2(1,i) = templatency(1,i) + dlcmedstruct.LeverTiming_F(1,i);

    end  
end 

%% Pellet Delivery %% 

ftimer = (dlcmedstruct.LeverTiming_F) + 123;


%% Latency to Magazine Entry %% 
tempmaglatency = dlcmedstruct.MedAssociate.LatencytoCSMagEntry((dlcmedstruct.SubjectRow),:); 

tempmaglat = [];
tempmaglat2 = [];
for i = 1:length(tempmaglatency)
    if tempmaglatency(1,i) >= 8
        tempmaglat(1,i) = 0;
        tempmaglat2(1,i) = 0;
    else 
        tempmaglat(1,i) = tempmaglatency(1,i);
        tempmaglat2(1,i) = tempmaglatency(1,i) + dlcmedstruct.LeverTiming_F(1,i);
    end  
end 


%save data 
dlcmedstruct.LatencytoFP_F = templat2;
dlcmedstruct.PelletDelivery_F = ftimer;
dlcmedstruct.LatencytoMagEntry_F = tempmaglat2;

save (structname, 'dlcmedstruct');

end 

