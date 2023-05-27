% Load the image
img = imread('C:\lab-programs\image\opncls.jpeg');

% Define the structuring element
se = strel('square', 20); % Create a disk-shaped structuring element of radius 3

% Perform opening
openedImg = imopen(img, se);

% Perform closing
closedImg = imclose(img, se);

%Closing the result of the earlier opening
fo = imclose(openedImg, se);
% Display the original, opened, and closed images
figure;
subplot(2, 2, 1); imshow(img); title('Original image');
subplot(2, 2, 2); imshow(openedImg); title('Opened image');
subplot(2, 2, 3); imshow(closedImg); title('Closed image');
subplot(2, 2, 4); imshow(fo); title('Closed image by opening');
