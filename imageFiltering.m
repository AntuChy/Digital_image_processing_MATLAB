%% Image Filtering (spatial)
I=imread('C:\lab-programs\image\pattern_blur.tif');
h=ones(3,3)/9; 
I2=imfilter(I,h); 
figure 
subplot(1,2,1);
imshow(I); 
title('original image'); 

subplot(1,2,2);
imshow(I2); 
title('filtered image');