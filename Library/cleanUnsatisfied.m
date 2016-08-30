function [pPrime,nPrime,primeSet,primeClasses,rule]=cleanUnsatisfied(primeSet,rule,classes,c)

    [pPrime,satisfyPos]=getPosSatisfying(classes,rule,c);
    [nPrime,satisfyNeg]=getNegSatisfying(classes,rule,c);
    
    select=~((~satisfyNeg)&(~satisfyPos));
    primeSet=primeSet(select,:);
    primeClasses=classes(select);
    rule=rule(select);