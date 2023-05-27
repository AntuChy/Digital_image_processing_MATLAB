%% 4. Draw histogram of an image without using built-in function

% Read the image
img = imread('onion.png');

% Convert the image to grayscale
h = rgb2gray(img);
[M,N]=size(h);
% Initialize frequency array
freq = zeros(1, 256);

% Calculate frequency of each intensity value
for i = 1:M
    for j = 1:N
        for r = 1:256 %counter of intensity in gray scale range
            if h(i,j) == r-1 %checking which pixel have same intensity
            freq(r) = freq(r) + 1; %if this pixel have same intensity of r then count+1
            end
        end
    end
end


% Create histogram
bar(0:255, freq); %charting the histogram using barchat
grid on; %activiting the grid
xlabel('Intensity Value');
ylabel('Frequency');
title('Image Histogram');
