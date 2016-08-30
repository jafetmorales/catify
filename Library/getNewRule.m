function [theFeats,theCats]=getNewRule(wholeSet,classes,c,allCats)

theCats=[];
theFeats=[];
% pPrime=pos;
nPrime=getNegAll(classes,c);

rule=ones(size(wholeSet,1),1);
primeClasses=classes;
featList=1:size(wholeSet,2);
gain=-Inf;
primeSet=wholeSet;
theCats=nan(1,size(wholeSet,2));
theFeats=nan(1,size(wholeSet,2));
% theCats=[];
% theFeats=[];
index=1;
while ((nPrime>0)&(gain<0))
%   CHECK RULE!!!
    [litList,cats,featNums]=generateLitList(primeSet,featList,allCats);
    [bestLit,gain]=findBestGainLiteral(rule,litList,primeClasses,c);
    rule=rule&litList(:,bestLit);
    theCats(index)=cats(bestLit);
    theFeats(index)=featNums(bestLit);
%     theCats=[theCats,cats(bestLit)];
%     theFeats=[theFeats,featNums(bestLit)];
    featList=featList(featList~=featNums(bestLit));
    [pPrime,nPrime,primeSet,primeClasses,rule]=cleanUnsatisfied(primeSet,rule,primeClasses,c);
    index=index+1;
%     gain
end
theCats(index-1)=NaN;
theFeats(index-1)=NaN;
% theCats=theCats(1:(length(theCats)-1));
% theFeats=theFeats(1:(length(theFeats)-1));



