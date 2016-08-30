clear all;
clc;
close all;

m=dlmread('seeds_dataset.txt');

[wholeSet,classes]=prepData(m);

uniClasses=unique(classes);

% THE MORE NEGATIVE THE GAIN, THE BETTER
ruleFeatsList=[];
ruleCatsList=[];
confList=[];
supportList=[];
classList=[];

for which=1:length(uniClasses);
    c=uniClasses(which);
    allCats=getAllCats(wholeSet);
    currClasses=classes;
    currSet=wholeSet;
    currPos=getPosAll(classes,c);
    while(currPos>0)
        % for rr=1:5
        [theFeats,theCats]=getNewRule(currSet,currClasses,c,allCats);
%         [passed]=applyRule(currSet,theFeats,theCats);
%         support=sum(currClasses(passed)==c);
        [passed]=applyRule(wholeSet,theFeats,theCats);
        support=sum(classes(passed)==c);
        conf=support/sum(passed);
        ruleFeatsList(size(ruleFeatsList,1)+1,:)=theFeats;
        ruleCatsList(size(ruleCatsList,1)+1,:)=theCats;
        supportList(length(supportList)+1)=support;
        confList(length(confList)+1)=conf;
        classList(length(classList)+1)=c;
% JUST ADDED THIS LINE!!!!
        [passed]=applyRule(currSet,theFeats,theCats);
        [currSet,currClasses]=cleanPSatisfied(currSet,passed,currClasses,c);
        currPos=getPosSatisfying(currClasses,ones(size(currClasses,1),1),c);
        %     currNeg=getNegAll(currClasses,ones(size(currClasses,1),1),c)
%         currPos
%         which
    end
end

% [classList',confList',supportList',ruleFeatsList,ruleCatsList]

theSet=wholeSet;
passed=[];
for ix=1:size(ruleFeatsList,1)
    passed(:,ix)=applyRule(theSet,ruleFeatsList(ix,:),ruleCatsList(ix,:));
end
% metrics=(confs.*sups).*(passed);
% THIS IS THE PART THAT NEEDS TO BE REDONE ACCORDING TO THE PAPERS
[gotten,meanConf]=classify(confList,classList,supportList,passed);
accuracy=sum(gotten==classes)/length(classes);

% GENETIC ALGORITHM USAGE STARTS HERE
getFitnessWrapper= @(x)getFitness(x,theSet,classes,ruleFeatsList,ruleCatsList,supportList,confList,classList);
% YOU CAN CHOOSE THIS NUMBER BY AVERAGING RESULTS OVER SEVERAL RUNS AND
% MAKING A REGRESSION WITH IT. FROM THE REGRESSION YOU SHOULD CHOOSE THE
% SMALLEST NUMBER THAT YOU CAN THAT STILL SATISFIES THE MINIMUM DESIRED
% ACCURACY. BUT YOU SHOULD ALSO PUT A LIMIT ON THE MAX NUMBER OF RULES TO
% BE USED, SINCE THIS WILL CAUSE OVERFITTING. KNOWING THIS, YOU MAY HAVE TO
% GIVE UP SOME ACCURACY TO GET A NUMBER OF RULES THAT IS NOT SO HIGH.
totRules=10;
[x,fval,exitflag,output,population,scores] = ga(getFitnessWrapper,totRules,[],[],[],[],1*ones(totRules,1),size(ruleFeatsList,1)*ones(totRules,1),[], ...
   1:totRules) % variables 2 and 3 are integers

fval=1/fval*100

