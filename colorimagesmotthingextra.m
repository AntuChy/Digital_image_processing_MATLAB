% Read in the color image
img = imread('C:\lab-programs\image\flower.jpeg');

% Convert the color image to double precision
img = im2double(img);

% Set the standard deviation of the Gaussian filter
sigma = 2;

% Create the Gaussian filter
sz = 2*ceil(3*sigma)+1;  % size of the filter
h = fspecial('gaussian', [sz sz], sigma);  % the filter

% Apply the filter to each color channel separately
smoothed_img = zeros(size(img));
for c=1:size(img,3)
    smoothed_img(:,:,c) = conv2(img(:,:,c), h, 'same');
end

% Display the original and smoothed images side-by-side
figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(smoothed_img); title('Smoothed Image');
