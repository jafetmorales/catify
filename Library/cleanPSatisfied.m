function [primeSet,primeClasses]=cleanPSatisfied(primeSet,rule,classes,c)

    [dummy,satisfyPos]=getPosSatisfying(classes,rule,c);
%     [nPrime,satisfyNeg]=getNeg(classes,rule,c);
    
    select=~satisfyPos;
    primeSet=primeSet(select,:);
    primeClasses=classes(select);
%     rule=rule(select);