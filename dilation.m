% Load the image
img = imread('C:\lab-programs\image\broken_text.tif');

% Define the structuring element
se = strel('disk', 1); % Create a disk-shaped structuring element of radius 3

% Perform dilation
dilatedImg = imdilate(img, se);


% Display the original and the dilated image
figure;
subplot(1, 2, 1); imshow(img); title('Original image');
subplot(1, 2, 2); imshow(dilatedImg); title('Dilated image');
