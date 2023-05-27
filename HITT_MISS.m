% Load the binary image
img = imread('C:\lab-programs\image\hitmiss.png');

% Define the structuring elements for the foreground and the background
fg_se = strel([0 0 0; 0 1 1; 0 1 0]); % foreground structuring element
bg_se = strel([1 1 1; 1 0 0; 1 0 0]); % background structuring element

% Perform hit-miss transformation
hitmissImg = bwhitmiss(img, fg_se, bg_se);

% Display the original and the hit-miss transformed image
figure;
subplot(1, 2, 1); imshow(img); title('Original binary image');
subplot(1, 2, 2); imshow(hitmissImg); title('Hit-miss transformed image');
