% Read an images
I=imread('C:\lab-programs\image\circles.png');
s=strel('disk', 2.0 );
f=imerode(I,s);
% r=I-f;

%display original Image 
subplot(2,1,1);
imshow(I);
title('Original RGB Image');

%display original Image 
subplot(2,1,2);
imshow(I-f);
title('Boundary Extracted Image');
