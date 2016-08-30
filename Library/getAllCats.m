function [allCats]=getAllCats(wholeSet)

for j=1:size(wholeSet,2)
    allCats(:,j)=unique(wholeSet(:,j));
end