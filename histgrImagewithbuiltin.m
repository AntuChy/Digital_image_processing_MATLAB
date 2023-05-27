%% Histogram of an image with built in

I=imread('C:\lab-programs\image\onion.png');
I_gray=rgb2gray(I);
figure
imhist(I_gray),title('graylevel histogra,');
%imhist(I_gray,128);
%imhist(I_gray,32);

R=I(:,:,1);
%imhist(R);
G=I(:,:,2);
B=I(:,:,3);
figure
subplot(1,3,1),imhist(R),title('R');
subplot(1,3,2),imhist(G),title('G');
subplot(1,3,3),imhist(B),title('B');

