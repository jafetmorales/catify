function [neg,satisfyNeg]=getNegSatisfying(classes,rule,c)

satisfyNeg=(~rule)&(~(classes==c));
neg=sum(satisfyNeg);

