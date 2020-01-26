function im = imBrightness(im,b)
 
im = im + b;
im(im > 1) = 1;
im(im < 0) = 0;
   
end