% Read in the RGB image
rgb_img = imread('C:\lab-programs\image\peppers.png');

% Convert the RGB image to double precision
rgb_img = im2double(rgb_img);

% Extract the R, G, and B components
R = rgb_img(:,:,1);
G = rgb_img(:,:,2);
B = rgb_img(:,:,3);

% Compute the intensity component (I)
I = (R + G + B) / 3;

% Compute the saturation component (S)
S = 1 - (3 ./ (R + G + B)) .* min(R, min(G, B));

% Compute the hue component (H)
H = acos((0.5 * ((R - G) + (R - B))) ./ sqrt((R - G).^2 + (R - B).*(G - B)));
H(B > G) = 2*pi - H(B > G);
H = H / (2*pi);

% Combine the HSI components into an image
%hsi_img(:,:,1) = H;
%hsi_img(:,:,2) = S;
%hsi_img(:,:,3) = I;
hsi_img = cat(3, H, S, I);

% Display the original and HSI images side-by-side
figure;
subplot(1,2,1); imshow(rgb_img); title('RGB Image');
subplot(1,2,2); imshow(hsi_img); title('HSI Image');
