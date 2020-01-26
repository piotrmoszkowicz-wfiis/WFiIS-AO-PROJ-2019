function im = imContrast(im,c)
 
im = im * c;
im(im > 1) = 1;
   
end