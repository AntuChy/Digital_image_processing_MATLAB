% Load an indexed image
load clown

% Display the original indexed image
subplot(1, 2, 1);
imshow(X, map);
title('Original Image');

% Convert the indexed image to a truecolor image using the colormap
RGB = ind2rgb(X, map);

% Display the truecolor image
subplot(1, 2, 2);
imshow(RGB);
title('Colormap Applied');
