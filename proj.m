clear; clc;

imSize = [600 800 3];
imds = imageDatastore('images', 'LabelSource', 'foldernames', 'IncludeSubfolders',true);

numTrainFiles = 15;

[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

imdsTrain = transform(imdsTrain,@preprocess,'IncludeInfo',true);
imdsValidation = transform(imdsValidation,@preprocess,'IncludeInfo',true);

t = read(imdsTrain);
imshow(t{1});

layers = [
    imageInputLayer(imSize)
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer
];

options = trainingOptions('sgdm', ...
    'ExecutionEnvironment','gpu', ... # suggestion to change to gpu or paralell, if you have suitable system
    'InitialLearnRate',0.01, ...
    'MaxEpochs',10, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.UnderlyingDatastore.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation);

