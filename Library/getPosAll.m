function [pos]=getPosAll(classes,c)

% satisfyPos=rule&(classes==c);
% pos=sum(satisfyPos);

pos=sum(classes==c);

% satisfyNeg=(~rule)&(~(classes==c));