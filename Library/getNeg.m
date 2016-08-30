function [neg,satisfyNeg]=getNeg(classes,rule,c)

satisfyNeg=(~rule)&(~(classes==c));
neg=sum(satisfyNeg);

