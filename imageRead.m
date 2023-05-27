%% Image read, display, size,resize and write functions

I=imread('C:\lab-programs\image\onion.png');
[r,c]=size(I);
%j=imresize(I,0.5);
j=imresize(I,[50,50]);
imwrite(j,'test.jpg');
figure
subplot(1,2,1);
imshow(I);
title('Original Image')
subplot(1,2,2);
imshow(j);
title('Resized Image')

