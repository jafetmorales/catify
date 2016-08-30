function [bestLit,topGain]=findBestGainLiteral(rule,lit,classes,c)

% [satisfyPos,satisfyNeg]=getSatisfaction(primeSet,classes,rule,c);
oldPos=getPosSatisfying(classes,rule,c);
oldNeg=getNegSatisfying(classes,rule,c);
for litNum=1:size(lit,2)
    ruleDummy=rule&lit(:,litNum);%previous rule must be appended to this
%     [satisfyPos,satisfyNeg]=getSatisfaction(primeSet,classes,rule,c);
%     pos=sum(satisfyPos);
%     neg=sum(satisfyNeg);
    pos=getPosSatisfying(classes,ruleDummy,c);
    neg=getNegSatisfying(classes,ruleDummy,c);
    gain(litNum)=pos*(log(pos/(pos+neg))-log(oldPos/(oldPos+oldNeg)));
end
% gain
[topGain,bestLit]=min(gain);
% rule=lit(:,bestLit);%previous rule must be appended to this
% [satisfyPos,satisfyNeg]=getSatisfaction(primeSet,classes,rule,c);
% primeSet=primeSet((~satisfyNeg)&(~satisfyPos),:);
