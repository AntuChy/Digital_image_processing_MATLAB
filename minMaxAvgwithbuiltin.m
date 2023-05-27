%% Min, Max and Average value of an image

I=imread('C:\lab-programs\image\onion.png');
I=rgb2gray(I);
minVal=min(I);
minVal=min(I(:));
maxVal=max(I);
maxVal=max(I(:));
avgVal=mean(I);
avgVal=mean(I(:));

%% Calculate the min, max and average intensity value of an image without 
%% using built in function