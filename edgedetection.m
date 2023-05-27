% Read the input image
I = imread('C:\lab-programs\image\saturn.png');

% Convert the input image to grayscale
I = rgb2gray(I);

sEdge=edge(I,'sobel');
prEdge=edge(I,'prewitt');
roEdge=edge(I,'roberts');
% Display the input and output images side by side
%figure;
subplot(2, 2, 1), imshow(I), title('Input Image');
subplot(2, 2, 2), imshow(sEdge), title('Sobel Edge Detection');
subplot(2, 2, 3), imshow(prEdge), title('Prewitt Edge Detection');
subplot(2, 2, 4), imshow(roEdge), title('Roberts Edge Detection');