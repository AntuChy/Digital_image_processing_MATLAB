%% Power law transformation: S=cr^gamma

 I=imread('C:\lab-programs\image\onion.png');
 
% Convert datatype to Double
% (for allowing fractional values)
 r = double(I);
% The below value represents gamma
 G = input('Enter the gamma value: ');
 C = 1;
% Applying the Power Law Transformation
 S = C * (r .^G);
 T = 255/(C * (255 .^G));
 
% Converting the datatype back
% to integer for displaying
 O = uint8(T * S);
 figure
 subplot(1,2,1);
 imshow(I); 
 title('Original Image');
 subplot(1,2,2);
 imshow(O);
 title('Power Law Transformation');
 