% Read in the HSI image
hsi_img = imread('C:\lab-programs\image\hsi_image.png');

% Convert the HSI image to double precision
hsi_img = im2double(hsi_img);

% Extract the H, S, and I components
H = hsi_img(:,:,1) * 2 * pi;
S = hsi_img(:,:,2);
I = hsi_img(:,:,3);

% Compute the RGB components
R = zeros(size(H));
G = zeros(size(H));
B = zeros(size(H));

% Region 1,RG sector: 0 <= H < 2*pi/3
idx = (H >= 0) & (H < 2*pi/3);
B(idx) = I(idx) .* (1 - S(idx));
R(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ cos(pi/3 - H(idx)));
G(idx) = 3*I(idx) - (R(idx) + B(idx));

% Region 2,GB sector: 2*pi/3 <= H < 4*pi/3
idx = (H >= 2*pi/3) & (H < 4*pi/3);
H(idx) = H(idx) - 2*pi/3;
R(idx) = I(idx) .* (1 - S(idx));
G(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ cos(pi/3 - H(idx)));
B(idx) = 3*I(idx) - (R(idx) + G(idx));

% Region 3,BR sector: 4*pi/3 <= H < 2*pi
idx = (H >= 4*pi/3) & (H < 2*pi);
H(idx) = H(idx) - 4*pi/3;
G(idx) = I(idx) .* (1 - S(idx));
B(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./ cos(pi/3 - H(idx)));
R(idx) = 3*I(idx) - (G(idx) + B(idx));

% Combine the RGB components into an image
%rgb_img(:,:,1) = R;
%rgb_img(:,:,2) = G;
%rgb_img(:,:,3) = B;
rgb_img = cat(3, R, G, B);
%rgb_img = max(min(rgb_img, 1), 0);
% Display the original HSI and RGB images side-by-side
figure;
subplot(1,2,1); imshow(hsi_img); title('HSI Image');
subplot(1,2,2); imshow(rgb_img); title('RGB Image');
