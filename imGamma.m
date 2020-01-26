function im = imGamma(im,g)

im = im .^ g;
im(im > 1) = 1;
   
end