function [gotten,meanConf]=classify(confList,classList,supportList,passed)

confs=repmat(confList,size(passed,1),1);
sups=repmat(supportList,size(passed,1),1);
creps=repmat(classList,size(passed,1),1);

% POSSIBLY CHANGE THIS TO VOTING INSTEAD OF 
% gotten=round(sum((confs).*(creps).*(passed),2)./sum((confs).*passed,2));

uniClasses=unique(classList);
for which=1:length(uniClasses)
    meanConf(:,which)=mean(confs.*passed.*(creps==which),2);
    meanSups(:,which)=mean(sups.*passed.*(creps==which),2);
end

[dummy,gotten]=max(meanConf,[],2);

% meanConf