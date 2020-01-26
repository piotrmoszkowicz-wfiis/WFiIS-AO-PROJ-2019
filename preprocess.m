function [dataOut,info] = preprocess(im,info)
 imSize = [600 800];
 
 im = imresize(im, imSize);
 im = double(im)/255;
 
 im = imBrightness(im, -0.5);
 im = imContrast(im, 2);

 dataOut = {im,info.Label};
   
end