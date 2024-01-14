%------Preparation de la matrice de Fusion
% load('featuresTrainP1.mat')
% load('featuresTrainF.mat')
% load('label.mat')

A=featuresTrainP1;
B=featuresTrainF;
C=label;
App=[A,B];
T = array2table(App); 
Data=[T,array2table(C)];

%------For Test
% load('featuresTestP1.mat')
% load('featuresTestF.mat')

AA= featuresTestP1;
BB= featuresTestF;
App=[AA,BB];
T = array2table(App); 
Test=[T];

%-----For Test----
%load('cat.mat');
[m,n]=size(Test);
cpt=0;
tic;
for i=1:m
%disp(i);
   I=Test(i,:);
  yfit =model.predictFcn(I)
   Res=isequal(yfit,cat(i,1));
   if (Res==1)
     cpt=cpt+1;
   end
   %pause();
end
toc;
Taux=(cpt/180)*100
