function [passed]=applyRule(wholeSet,theFeats,theCats)


passed=ones(size(wholeSet,1),1);
i=1;
while((~isnan(theFeats(i)))&(i<=length(theFeats)))
    p2=(wholeSet(:,theFeats(i))==theCats(i))
    passed=passed&p2;
    i=i+1
end
% passed

% theFeats(1)
% theCats(1)
