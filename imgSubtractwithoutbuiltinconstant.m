%% Subtract a constant value from an image without builtin function
% Load the image
I = imread('C:\lab-programs\image\rice.png');

% Define the constant value to subtract
constVal = 50;

% Get the size of the image
[rows, cols, channels] = size(I);

% Initialize a new image with the same size as the original image
imgSub = uint8(zeros(rows, cols, channels));

% Loop over each pixel in the image and subtract the constant value
for r = 1:rows
    for c = 1:cols
        for ch = 1:channels
            imgSub(r,c,ch) = (I(r,c,ch) - constVal);
            if imgSub(r,c,ch) < 0
                imgSub(r,c,ch) = 0;
            end
        end
    end
end

% Display the original and subtracted images
figure
subplot(1,2,1);
imshow(I); title('Original Image');
subplot(1,2,2);
imshow(imgSub); title('Subtracted Image');
