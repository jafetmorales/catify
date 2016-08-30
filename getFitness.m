function fitness=getFitness(x,theSet,classes,ruleFeatsList,ruleCatsList,supportList,confList,classList)

vruleFeatsList=ruleFeatsList(x,:);
vruleCatsList=ruleCatsList(x,:);
vsupportList=supportList(:,x);
vconfList=confList(:,x);
vclassList=classList(:,x);



passed=[];
for ix=1:size(vruleFeatsList,1)
    
%     ix=1;
    passed(:,ix)=applyRule(theSet,vruleFeatsList(ix,:),vruleCatsList(ix,:));
end
% size(passed)
% metrics=(confs.*sups).*(passed);
% THIS IS THE PART THAT NEEDS TO BE REDONE ACCORDING TO THE PAPERS
[gotten]=classify(vconfList,vclassList,vsupportList,passed);
accuracy=sum(gotten==classes)/length(classes);

fitness=1/accuracy;