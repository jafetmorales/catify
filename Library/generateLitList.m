function [litList,cats,featNums]=generateLitList(set,featureList,allCats)

% cats(:,litFeature)=unique(set(:,litFeature));
% for i=1:length(cats)
%     litList(:,i)=set(:,litFeature)==cats(i);
% end
% 

total=1;
for j=1:length(featureList)
    featNum=featureList(j);
    currCats=allCats(:,j);
    for i=1:length(currCats)
        litList(:,total)=set(:,featNum)==currCats(i);
        cats(total)=currCats(i);
        featNums(total)=featNum;
        total=total+1;
    end
end
