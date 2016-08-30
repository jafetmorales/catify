function [wholeSet,classes]=prepData(m)

qs=quantile(m,[.25 .50 .75]);
md=m;
low=repmat(qs(1,:),[size(m,1),1]);
low=(m<low);
md(low)=Inf;

mlow=repmat(qs(2,:),[size(m,1),1]);
mlow=(md<mlow);
md(mlow)=Inf;

mhigh=repmat(qs(3,:),[size(m,1),1]);
mhigh=(md<mhigh);
md(mhigh)=Inf;

high=(~isinf(md));

nm=1*low+2*mlow+3*mhigh+4*high;

nm=nm(:,1:7);

classes=m(:,8);
wholeSet=nm;
