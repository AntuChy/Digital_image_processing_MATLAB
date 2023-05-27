%% Add two images or add a constant to an image
I=imread('C:\lab-programs\image\rice.png');
J=imread('C:\lab-programs\image\cameraman.tif');

K=imadd(I,J,'uint16');
subplot(1,3,1),imshow(I),title('Rice');
subplot(1,3,2),imshow(J),title('Cameraman');
subplot(1,3,3),imshow(K,[]),title('Added Image');