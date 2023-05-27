% Read an images
I=imread('C:\lab-programs\image\peppers.png');

[height,width,planes]=size(I);
rgb=reshape(I,height,width*planes);

imagesc(rgb);
% colorbar;
% r=I(:,:,1);
% g=I(:,:,2);
% b=I(:,:,3);