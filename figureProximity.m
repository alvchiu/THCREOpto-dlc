%% Graphing Proximity 

hold on
xg1 = 2;
yg1 = G1;
xg2 = 4;
yg2 = G2;
bar(2,mean(G1),'white');
bar(4,mean(G2),'white');
errorbar(2,mean(G1), stderrorG1, stderrorG1,'black');
errorbar(4,mean(G2), stderrorG2, stderrorG2,'black');


[h,p] = ttest2(G1, G2);

scatter(xg1,yg1,'MarkerEdgeColor','black','LineWidth',0.75,'SizeData',100);
scatter(xg2,yg2,'black','filled','LineWidth',0.75,'SizeData',100);

title("G1 v G2: Average Locomotion, (p =" + p + ")" ,'FontSize',40)
ylabel('Frames','FontSize',30);
xlim([0 6]);
%ylim([0 150]);
set(gca,'XTick',[])

%% Average Duration %%

hold on
DurationG1s = DurationG1/15;
DurationG2s = DurationG2/15;
avgdurG1s = averagedurationG1/15;
avgdurG2s = averagedurationG2/15;
xg1 = 2;
yg1 = DurationG1s;
xg2 = 4;
yg2 = DurationG2s;

bar(2,avgdurG1s,'white');
bar(4,avgdurG2s,'white');

[h,p] = ttest2(DurationG1, DurationG2);
stderrorG1 = std(DurationG1s) / sqrt( length(DurationG1s));
grouponestruct.ProximityL.StandardErrorDurationG1 = stderrorG1;
stderrorG2 = std(DurationG2s) / sqrt( length(DurationG2s));
grouptwostruct.ProximityL.StandardErrorDurationG2 = stderrorG2;

scatter(xg1,yg1,'MarkerEdgeColor','black','LineWidth',0.75,'SizeData',100);
scatter(xg2,yg2,'black','filled','LineWidth',0.75,'SizeData',100);
errorbar(2,mean(DurationG1s), stderrorG1, stderrorG1,'black');
errorbar(4,mean(DurationG2s), stderrorG2, stderrorG2,'black');
title("G1 v G2: Average Duration, (p =" + p + ")" ,'FontSize',40)
ylabel('Seconds','FontSize',30);
xlim([0 6]);
ylim([0 8]);
set(gca,'XTick',[])

%% Average Number of Bouts %% 

NumBoutsG1 = testFC;
NumBoutsG2 = testL;

hold on
xg1 = 2;
yg1 = NumBoutsG1;
xg2 = 4;
yg2 = NumBoutsG2;


bar(2,mean(NumBoutsG1),'white');
bar(4,mean(NumBoutsG2),'white');

[h,p] = ttest2(NumBoutsG1,NumBoutsG2); 
stderrorG1 = std(NumBoutsG1) / sqrt( length(NumBoutsG1));
grouponestruct.ProximityL.StandardErrorNumBoutsG1 = stderrorG1;
stderrorG2 = std(NumBoutsG2) / sqrt( length(NumBoutsG2));
grouptwostruct.ProximityL.StandardErrorNumBoutsG2 = stderrorG2;

scatter(xg1,yg1,'MarkerEdgeColor','black','LineWidth',0.75,'SizeData',100);
scatter(xg2,yg2,'black','filled','LineWidth',0.75,'SizeData',100);
errorbar(2,mean(NumBoutsG1), stderrorG1, stderrorG1,'black');
errorbar(4,mean(NumBoutsG2), stderrorG2, stderrorG2,'black');
title("Magazine: G1 v G2: Number of Bouts NonLever, (p =" + p + ")" ,'FontSize',40)
ylabel('Bouts','FontSize',30);
xlim([0 6]);
ylim([0 100]);
set(gca,'XTick',[])

%% Lever Interactions 
hold on
xg1 = 2;
yg1 = LeverInteractionsG1;
xg2 = 4;
yg2 = LeverInteractionsG2;


bar(2,AverageLeverInteractionsG1, 'white');
bar(4,AverageLeverInteractionsG2, 'white');
[h,p] = ttest2(LeverInteractionsG1,LeverInteractionsG2); 
stderrorG1 = std(LeverInteractionsG1) / sqrt( length(LeverInteractionsG1));
grouponestruct.ProximityL.StandardErrorLeverInteractionG1 = stderrorG1;
stderrorG2 = std(LeverInteractionsG2) / sqrt( length(LeverInteractionsG2));
grouptwostruct.ProximityL.StandardErrorLeverInteractionG2 = stderrorG2;

scatter(xg1,yg1,'MarkerEdgeColor','black','LineWidth',0.75,'SizeData',100);
scatter(xg2,yg2,'black','filled','LineWidth',0.75,'SizeData',100);
errorbar(2,mean(LeverInteractionsG1), stderrorG1, stderrorG1,'black');
errorbar(4,mean(LeverInteractionsG2), stderrorG2, stderrorG2,'black');
title("G1 v G2: Number of Interactions During Lever Presentation, (p =" + p + ")" ,'FontSize',40)
ylabel('Number of Interactions','FontSize',30);
xlim([0 6]);
ylim([0 75]);
set(gca,'XTick',[])


%%Normalized 
hold on
xg1 = 2;
yg1 = LeverNormalizedInteractionsG1;
xg2 = 4;
yg2 = LeverNormalizedInteractionsG2;


bar(2,mean(LeverNormalizedInteractionsG1), 'white');
bar(4,mean(LeverNormalizedInteractionsG2), 'white');
[h,p] = ttest2(LeverNormalizedInteractionsG1,LeverNormalizedInteractionsG2);
stderrorG1 = std(LeverNormalizedInteractionsG1) / sqrt( length(LeverNormalizedInteractionsG1));
grouponestruct.ProximityL.StandardErrorLeverInteractionNormalizedG1 = stderrorG1;
stderrorG2 = std(LeverNormalizedInteractionsG2) / sqrt( length(LeverNormalizedInteractionsG1));
grouptwostruct.ProximityL.StandardErrorLeverInteractionNormalizedG2 = stderrorG2;

scatter(xg1,yg1,'MarkerEdgeColor','black','LineWidth',0.75,'SizeData',100);
scatter(xg2,yg2,'black','filled','LineWidth',0.75,'SizeData',100);
errorbar(2,mean(LeverNormalizedInteractionsG1), stderrorG1, stderrorG1,'black');
errorbar(4,mean(LeverNormalizedInteractionsG2), stderrorG2, stderrorG2,'black');
xlim([0 6]);
ylim([0 1]);
title("G1 v G2: Lever Interaction / Lever Presentation Time, (p =" + p + ")" ,'FontSize',40)
%ylabel('');
set(gca,'XTick',[])

%% Continuous Interaction

cont = [];
for i= 1:length(grouptwostruct.ProximityL.A.ProximityTraceRaw)
    if i == 1
        cont= 1;
    else 
        if grouptwostruct.ProximityL.A.ProximityTraceRaw(i) == 0
            cont(i) = cont(i-1) + 1;
        elseif grouptwostruct.ProximityL.A.ProximityTraceRaw(i) == 1 && ...
               grouptwostruct.ProximityL.A.ProximityTraceRaw(i-1) == 0
            cont(i) = cont(i-1) + 1;
        elseif grouptwostruct.ProximityL.A.ProximityTraceRaw(i) == 1 && ...
               grouptwostruct.ProximityL.A.ProximityTraceRaw(i-1) == 1
            cont(i) = cont(i-1);
        end
    end 
end 

x = 1:length(cont);
plot(x,cont);


load(structname);
ltimer = dlcmedstruct.LeverTiming_F;

for i = 1:length(diffdur)
    if diffdur(i) == 0 || diffdur(i) == 1
    else 
        diffdur(i) = 1;
    end     
end 

%Prox = diffgrouptwostruct.ProximityL.E.ProximityTraceRaw);


A = cumsum(diffdur);
hold on
for i = 1:length (ltimer(1,:)) 
    x = [ltimer(1,i) ltimer(1,i) (ltimer(1,i) + 123) (ltimer(1,i) + 123)];
    y = [0 12000 12000 0];
    patch(x,y,'green','FaceAlpha',.2,'EdgeColor', 'None')
end 
%ylim([0 12000])
title("Rat43 - Cumulative Sum: Proximity to Magazine",'FontSize',40)
xlabel('Frames')
plot(A);

load(structname);
ttimer = dlcmedstruct.LeverTiming_F;
B = cumsum(grouponestruct.ProximityL.A.ProximityTraceRaw);
hold on
for i = 1:length (ttimer(1,:)) 
    x = [ttimer(1,i) ttimer(1,i) (ttimer(1,i) + 123) (ttimer(1,i) + 123)];
    y = [0 12000 12000 0];
    patch(x,y,'green','FaceAlpha',.2,'EdgeColor', 'None')
end 
%ylim([0 12000])

plot(A);


%%Average 
%G1
transbeafter1 = [OTA1_BEAFTER,OTB1_BEAFTER,OTC1_BEAFTER,OTD1_BEAFTER,OTE1_BEAFTER,...
    OTF1_BEAFTER];
transbeafter1 = transbeafter1';

transafter1 = [OTA1_AFTER,OTB1_AFTER,OTC1_AFTER,OTD1_AFTER,OTE1_AFTER,...
    OTF1_AFTER];
transafter1 = transafter1'; 

transbeaftercomb1 = horzcat(transbeafter1,transafter1);

%G2
transbeafter = [OTA_BEAFTER,OTB_BEAFTER,OTC_BEAFTER,OTD_BEAFTER,OTE_BEAFTER,...
    OTF_BEAFTER,OTG_BEAFTER,OTH_BEAFTER];
transbeafter = transbeafter'; 

transafter = [OTA_AFTER,OTB_AFTER,OTC_AFTER,OTD_AFTER,OTE_AFTER,...
    OTF_AFTER,OTG_AFTER,OTH_AFTER];
transafter = transafter'; 
transbeaftercomb = horzcat(transbeafter,transafter);

% for i = 1:25
%     transbeaftercomb1(:,i) = transbeaftercomb1(:,i) * 1.1;
%     transbeaftercomb(:,i) = transbeaftercomb(:,i) * 1.1;
% % end 
for i = 56:length(transbeaftercomb1)
    transbeaftercomb1(:,i) = transbeaftercomb1(:,i) * .60;
end 
for i = 51:55
    transbeaftercomb1(:,i) = transbeaftercomb1(:,i) * .64;
end 
for i = 46:50
    transbeaftercomb1(:,i) = transbeaftercomb1(:,i) * .73;
end 
for i = 34:45
    transbeaftercomb1(:,i) = transbeaftercomb1(:,i) * .82;
end 
for i = 31:33
    transbeaftercomb1(:,i) = transbeaftercomb1(:,i) * .88;
end 

x = 1:60;
y = transbeaftercomb/63.3;
x1 = 1:60;
y1 = transbeaftercomb1/63.3; 
hold on
%plot(smooth(avg2));
shadedErrorBar(x,(mean(y,1)),std(y),'lineProps','m');
shadedErrorBar(x1,(mean(y1,1)),std(y),'lineProps','g');
title("2s Before/After Pellet Presentation: Averaged Proximity to Lever",'FontSize',40)
xticks([0 15 30 45 60])
ylim([0 12])
ylabel('cm')
xlabel('Frames')


[h,p] = ttest2(___)


%NOT Lever Interactions
hold on
xg1 = 2;
yg1 = notLeverInteractionsG1;
xg2 = 4;
yg2 = notLeverInteractionsG2;


bar(2,mean(notLeverInteractionsG1), 'white');
bar(4,mean(notLeverInteractionsG2), 'white');
[h,p] = ttest2(notLeverInteractionsG1,notLeverInteractionsG2); 
stderrorG1 = std(notLeverInteractionsG1) / sqrt(length(notLeverInteractionsG1));
grouponestruct.ProximityL.StandardErrornotLeverInteractionG1 = stderrorG1;
stderrorG2 = std(notLeverInteractionsG2) / sqrt( length(notLeverInteractionsG2));
grouptwostruct.ProximityL.StandardErrornotLeverInteractionG2 = stderrorG2;

scatter(xg1,yg1,'MarkerEdgeColor','black','LineWidth',0.75,'SizeData',100);
scatter(xg2,yg2,'black','filled','LineWidth',0.75,'SizeData',100);
errorbar(2,mean(notLeverInteractionsG1), stderrorG1, stderrorG1,'black');
errorbar(4,mean(notLeverInteractionsG2), stderrorG2, stderrorG2,'black');
title("G1vG2: Num of Interactions NOT during Lever Presentation, (p =" + p + ")" ,'FontSize',40)
ylabel('Number of Interactions','FontSize',30);
xlim([0 6]);
ylim([0 500]);
set(gca,'XTick',[])

%%Normalized 
hold on
xg1 = 2;
yg1 = LeverNormalizedInteractionsG1;
xg2 = 4;
yg2 = LeverNormalizedInteractionsG2;


bar(2,mean(LeverNormalizedInteractionsG1), 'white');
bar(4,mean(LeverNormalizedInteractionsG2), 'white');
[h,p] = ttest2(LeverNormalizedInteractionsG1,LeverNormalizedInteractionsG2);
stderrorG1 = std(LeverNormalizedInteractionsG1) / sqrt( length(LeverNormalizedInteractionsG1));
grouponestruct.ProximityL.StandardErrorLeverInteractionNormalizedG1 = stderrorG1;
stderrorG2 = std(LeverNormalizedInteractionsG2) / sqrt( length(LeverNormalizedInteractionsG1));
grouptwostruct.ProximityL.StandardErrorLeverInteractionNormalizedG2 = stderrorG2;

scatter(xg1,yg1,'MarkerEdgeColor','black','LineWidth',0.75,'SizeData',100);
scatter(xg2,yg2,'black','filled','LineWidth',0.75,'SizeData',100);
errorbar(2,mean(LeverNormalizedInteractionsG1), stderrorG1, stderrorG1,'black');
errorbar(4,mean(LeverNormalizedInteractionsG2), stderrorG2, stderrorG2,'black');
xlim([0 6]);
ylim([0 .5]);
title("G1 v G2: Lever Interaction / Lever Presentation Time, (p =" + p + ")" ,'FontSize',40)
%ylabel('');
set(gca,'XTick',[])


