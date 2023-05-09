function findLeverTime(structname, levervideo)

load(structname);

progress = waitbar(0, 'Please wait...');
vidObj = VideoReader(levervideo);
vidObj.NumFrames;


bright = zeros(vidObj.NumFrames,1);
steps = vidObj.NumFrames;

framenum = 1;
while hasFrame(vidObj)
   frame = readFrame(vidObj);
   bright(framenum) = mean2(frame);
   framenum = framenum +1;
   waitbar(framenum/steps);
end


bright1 = zeros(vidObj.NumFrames,2);
bright1(:,1) = 1:vidObj.NumFrames;
bright1(:,2) = bright;


[peaks, locs] = findpeaks(bright1(:,2), bright1(:,1), 'MinPeakDistance', 123, 'MinPeakHeight', 0.3);

locs = locs.';
findpeaks(bright1(:,2), bright1(:,1), 'MinPeakDistance', 123, 'MinPeakHeight', 0.3)

dlcmedstruct.NumofFrames = vidObj.NumFrames;
dlcmedstruct.LeverTiming_F = locs;
dlcmedstruct.NumDetectedTrials = peaks;
save(structname, 'dlcmedstruct')

end 

