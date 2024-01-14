tic
% define the folder path containing the images
folder_path = 'C:\Users\admin\Desktop\Application M2\test_finger';
S=0;
% get the list of image files in the folder
imagefiles = dir(fullfile(folder_path, '*.jpg'));

% get the number of image files in the folder
nfiles = length(imagefiles);  

% initialize a cell array to store the images and predicted classes
images = cell(1, nfiles);
predictedClasses = cell(1, nfiles);

% loop through each image file and read it
for ii = 1:nfiles
    disp(ii)
    currentfilename = imagefiles(ii).name;
    currentimage = imread(fullfile(folder_path, currentfilename));
    images{ii} = currentimage;
    inputSize = [224 224];
    resizedImage = imresize(images{ii}, inputSize);
    
    % classify the image using the pre-trained network
    [YPred,score] = classify(net, resizedImage);
    Res=isequal(string(YPred),classse(ii,1));
         if(Res==1)
           S=S+1;
         end
end   
accuracy = (S/length(imagefiles));
Taux=accuracy*100;
fprintf('Classification accuracy: %.2f%%\n', Taux);
toc