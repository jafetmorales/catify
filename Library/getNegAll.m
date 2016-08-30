function [neg]=getNegAll(classes,c)

% satisfyPos=rule&(classes==c);
% pos=sum(satisfyPos);

neg=sum(classes~=c);

% satisfyNeg=(~rule)&(~(classes==c));