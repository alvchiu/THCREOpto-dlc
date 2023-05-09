function qcLeverTiming(structname)

load (structname)

diff = dlcmedstruct.MedAssociate.LeverTiming_F(1,1) - dlcmedstruct.LeverTiming_F(1,1);

for i = 1:length(dlcmedstruct.MedAssociate.LeverTiming_F)
    dlcmedstruct.MedAssociate.LeverTiming_F(1,i) = dlcmedstruct.MedAssociate.LeverTiming_F(1,i) - diff;
end 

%lever pulse
ltimer = dlcmedstruct.MedAssociate.LeverTiming_F;

leverPulse = zeros(1,(dlcmedstruct.NumofFrames));
 
for r = 1:length(ltimer)
    leverPulse(1,round(ltimer(1,r))) = 1; 
     for p = 1:123 
         leverPulse(1,round(ltimer(1,r)+p)) = 1;
     end 
end 

%peak pulse
ptimer = dlcmedstruct.LeverTiming_F;

peakPulse = zeros(1,(dlcmedstruct.NumofFrames));
 
for r = 1:length(ptimer)
    peakPulse(1,round(ptimer(1,r))) = 1; 
     for p = 1:123 
         peakPulse(1,round(ptimer(1,r)+p)) = 1;
     end 
end 

hold on
plot(leverPulse)
plot(peakPulse)


xlabel('Frames')
ylower = 0 ;
yupper = 1.5;
ylim([ylower yupper])
legend('MedAssociates Lever', 'Video Derived Lever')
hold off 

end 
