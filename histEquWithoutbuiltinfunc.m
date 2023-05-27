% Read the input image
I = imread('C:\lab-programs\image\pollen.tif');

% Create an empty image for the output
HIm = uint8(zeros(size(I, 1), size(I, 2)));

% Initialize arrays for storing histogram data
freq = zeros(256, 1);   % array to store frequency of each pixel value
probf = zeros(256, 1);  % array to store probability of each pixel value
probc = zeros(256, 1);  % array to store cumulative probability of each pixel value
cum = zeros(256, 1);    % array to store cumulative sum of pixel frequencies
output = zeros(256, 1); % array to store equalized pixel values

% Calculate the histogram data
numofpixels = size(I, 1) * size(I, 2);
for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        % Get the pixel value at (i, j)
        value = I(i, j);
        
        % Increment the frequency of this pixel value in the freq array
        freq(value + 1) = freq(value + 1) + 1;
        
        % Calculate the probability of this pixel value
        probf(value + 1) = freq(value + 1) / numofpixels;
    end
end

% Calculate the cumulative distribution function and equalized pixel values
sum = 0;
no_bins = 255;
for i = 1:size(probf)
    % Calculate the cumulative sum of pixel frequencies
    sum = sum + freq(i);
    cum(i) = sum;
    
    % Calculate the cumulative probability of each pixel value
    probc(i) = cum(i) / numofpixels;
    
    % Calculate the equalized pixel value for this pixel value
    output(i) = round(probc(i) * no_bins);
end

% Replace each pixel value in the input image with its corresponding equalized value
for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        % Get the pixel value at (i, j)
        pixel_value = I(i, j);
        
        % Get the equalized pixel value for this pixel value from the output array
        equalized_value = output(pixel_value + 1);
        
        % Set the pixel value at (i, j) in the output image to its equalized value
        HIm(i, j) = equalized_value;
    end
end

% Display the equalized image
figure
subplot(2,2,1);
imshow(I);
title('Original Image');

subplot(2,2,3);
imhist(I);
title('Histogram of Original Image');

subplot(2,2,2);
imshow(HIm);
title('Image after histogram equalization');

subplot(2,2,4);
imhist(HIm);
title('Histogram of Image after equalization');
