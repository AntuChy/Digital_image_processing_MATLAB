% Read the image
I = imread('onion.png');

% Convert to grayscale
if size(I, 3) == 3
    I = rgb2gray(I);
end

% Calculate minimum, maximum and average pixel intensities
minVal = double(I(1,1));
maxVal = double(I(1,1));
sumVal = 0;
numPixels = size(I, 1) * size(I, 2);

for i = 1:size(I, 1)
    for j = 1:size(I, 2)
        % Minimum pixel intensity
        if double(I(i,j)) < minVal
            minVal = double(I(i,j));
        end
        
        % Maximum pixel intensity
        if double(I(i,j)) > maxVal
            maxVal = double(I(i,j));
        end
        
        % Sum of pixel intensities for average calculation
        sumVal = sumVal + double(I(i,j));
    end
end

avgVal = sumVal / numPixels;
