%% Image Subtraction
%The colors in the image will be subtracted and produce a different Image
I=imread('C:\lab-programs\image\rice.png');
% background=imopen(I,strel('disk',15));
% imgSub=imsubtract(I,background);
% %imshow(imgSub,[]);
% figure
% subplot(1,2,1);
% imshow(I); title('Original Image');
% subplot(1,2,2);
% imshow(imgSub); title('Subtracted Image');

%% Subtract a constant value from an image

imgSub=imsubtract(I,50);
figure
subplot(1,2,1);
imshow(I); title('Original Image');
subplot(1,2,2);
imshow(imgSub); title('Subtracted Image');

