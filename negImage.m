%% Intensity transformation operations on Images
%% Image Negative
I=imread('C:\lab-programs\image\onion.png');
subplot(1,2,1);
imshow(I);
title('Original Image');
% Levels of the 8-bit image
% using (whos I) we can get information about an image including name, size, type etc.
L=2^8;
neg=(L-1)-I;
subplot(1,2,2);
% displaying the negarive image
imshow(neg);
title('Negative Image')
% Save the output image as a BMP file
imwrite(neg, 'neg_image.bmp');
