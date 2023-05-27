%%Add two images or add a constant to an image without using built in function

% Load the image
img1=imread('rice.png');
img2=imread('cameraman.tif');
img_sum = zeros(size(img1));
% Initialize the summed image 
for i = 1:256
    for j = 1:256
        img_sum(i,j) = (img1(i,j)/2+img2(i,j)/2);
        if img_sum(i,j) > 255
           img_sum(i,j) = 255;
        end   
    end
end
% Display the original images side by side
figure;
subplot(1,3,1),imshow(img1),title('Rice');
subplot(1,3,2),imshow(img2),title('Cameraman');
subplot(1,3,3),imshow(img_sum,[]),title('Added Image')