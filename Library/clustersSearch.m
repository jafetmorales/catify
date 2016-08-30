clear all;
clc;
close all;

m=dlmread('seeds_dataset.txt');

nmall=m(:,1:7);

% COEFFS ARE THE ORTHOGONAL PCA VECTORS
% SCORES ARE THE TRANSFORMED VALUES
% VARIANCES ARE THE VARIANCES OF EACH COLUMN IN THE SCORES MATRIX
[coeffs,scores,variances,latent]=princomp(zscore(nmall));
nm=scores;

classes=m(:,8);
wholeSet=nm;

c1=mean(wholeSet(classes==1,:),1);
c2=mean(wholeSet(classes==2,:),1);
c3=mean(wholeSet(classes==3,:),1);

center1=repmat(c1,size(wholeSet,1),1);
center2=repmat(c2,size(wholeSet,1),1);
center3=repmat(c3,size(wholeSet,1),1);

dist1=sqrt(sum((center1-wholeSet).^2,2))
dist2=sqrt(sum((center2-wholeSet).^2,2))
dist3=sqrt(sum((center3-wholeSet).^2,2))

[dum,ixs]=min([dist1,dist2,dist3],[],2)

accuracy=sum(ixs==classes)/length(classes)