%paum 
%train
imds1 = imageDatastore('train_noise', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames'); 
inputSize = net.Layers(1).InputSize;
augimdsTrainP = augmentedImageDatastore(inputSize(1:2),imds1);
layer = 'avg1';
ExtractfeaturesD = activations(net,augimdsTrainP,layer,'OutputAs','rows');
%test
imds2 = imageDatastore('test_noise', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames'); 
inputSize = net.Layers(1).InputSize;
augimdsTestP= augmentedImageDatastore(inputSize(1:2),imds2);
layer = 'avg1';
ExtractnoisetestD = activations(net,augimdsTestP,layer,'OutputAs','rows');

%fingerprint 

imds3 = imageDatastore('T_fingr', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames'); 
inputSize = net.Layers(1).InputSize;
augimdsTrainF = augmentedImageDatastore(inputSize(1:2),imds3);
layer = 'pool5';
ExtractfeaturesFD = activations(net,augimdsTrainF,layer,'OutputAs','rows');

imds4 = imageDatastore('test_finger', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames'); 
inputSize = net.Layers(1).InputSize;
augimdsTestF= augmentedImageDatastore(inputSize(1:2),imds4);
layer = 'pool5';
ExtractnoisetestFD = activations(net,augimdsTestF,layer,'OutputAs','rows');