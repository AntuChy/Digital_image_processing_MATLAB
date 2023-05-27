% Read in the color image
fc = imread('C:\lab-programs\image\flower.jpeg');
fR = fc(:, :, 1); fG = fc(:, :, 2); fB = fc(:, :, 3);
% show RGB image & red, green and blue component images,respectively.
figure
subplot(2,2,1); imshow(fc); title('RGB Image');
subplot(2,2,2); imshow(fR); title('RED');
subplot(2,2,3); imshow(fG); title('GREEN');
subplot(2,2,4); imshow(fB); title('BLUE');
%Smoothed RGB image by R, G, B image plane separately
w = fspecial('average',5);
fc_filtered = imfilter (fc, w, 'replicate');
h=rgb2hsv(fc);
H = h(:, :, 1); S = h(:, :, 2); I = h(:, :, 3);
%show hue, saturation, and intensity components,
figure
subplot(1,3,1); imshow(H); title('HUE');
subplot(1,3,2); imshow(S); title('SATURATION');
subplot(1,3,3); imshow(I); title('INTENSITY');
w = fspecial('average',5);
%Smoothing only the intensity component of the HSI equivalent image
I_filtered = imfilter (I, w, 'replicate');
%smoothing all three HSI components equally.
h = cat (3, H, S, I_filtered);
f = hsv2rgb(h); %back to RGB
figure;
subplot(1,3,1); imshow(fc_filtered); title('Smoothed RGB');
subplot(1,3,2); imshow(I_filtered); title('Smoothed only intensity');
subplot(1,3,3); imshow(f); title('Smoothed HSI');