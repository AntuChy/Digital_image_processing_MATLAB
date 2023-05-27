%% 3. Subtract two images without using built in function.
% Read in the images
img1 = imread('rice.png'); 
img2 = imread('cameraman.tif');
% Initialize the output image with zeros
img_sub = zeros(size(img1)); 

% Loop through each pixel and subtract the corresponding pixel values from each other
for i = 1:size(img1, 1)
    for j = 1:size(img1, 2) 
        for k = 1:size(img1, 3) 
            img_sub(i,j,k) =(img1(i,j,k)) - (img2(i,j,k));
            if img_sub(i,j,k) < 0
                img_sub(i,j,k) = 0;
            end
            
        end
    end
end

% Display the original images side by side with the subtracted image
figure; 
subplot(1,3,1),imshow(img1),title('Image 1'); 
subplot(1,3,2),imshow(img2),title('Image 2'); 
subplot(1,3,3),imshow(img_sub, []),title('Subtracted Image'); 