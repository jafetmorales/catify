function [pos,satisfyPos]=getPosSatisfying(classes,rule,c)

satisfyPos=rule&(classes==c);
pos=sum(satisfyPos);

% satisfyNeg=(~rule)&(~(classes==c));