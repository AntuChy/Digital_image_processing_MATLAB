%% Histogram Equalization
I=imread('C:\lab-programs\image\pollen.tif');

subplot(2,2,1);
imshow(I);
title('Original Image');

subplot(2,2,3);
imhist(I);
title('Histogram of Original Image');

j=histeq(I);
subplot(2,2,2);
imshow(j);

title('Image after histogram equalization');

subplot(2,2,4);

imhist(j);

title('Histogram of Image after equalization');