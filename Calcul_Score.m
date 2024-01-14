%---------For Training Image -----------------
imds = imageDatastore('App_Mask', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames'); 
inputSize = net.Layers(1).InputSize;
imds = augmentedImageDatastore(inputSize(1:2),imds );
[YPred,scores] = classify(net,imds);
S_App_Res50=scores;
save App_Face_dark_Salt_05;

% %---------For Test Image-----------------
% imds = imageDatastore('Test_Face', ...
%     'IncludeSubfolders',true, ...
%     'LabelSource','foldernames'); 
% inputSize = net.Layers(1).InputSize;
% imds = augmentedImageDatastore(inputSize(1:2),imds );
% [YPred,scores] = classify(net,imds);
% %imds= imnoise(imds,'salt & pepper',0.01);
% S_Test_Left_res18=scores;
% save S_Test_Left_res18;
% 
% 
% 
% 
% 
%  
