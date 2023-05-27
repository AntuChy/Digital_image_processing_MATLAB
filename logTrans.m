%% Log transformation: S=c*log(1+r)

  I=imread('C:\lab-programs\image\onion.png');
 
% Convert datatype to Double
% (for allowing fractional values)
  r = double(I);
 
% Constant determining the
% nature of the log curve
  C = 1;
 
% Performing log transformation
  S = C * log(1 + r);
  T = 255/(C * log(256));
 
% Converting the datatype back
% to integer for displaying
  B = uint8(T * S);
  figure
  subplot(1,2,1);
  imshow(I); 
  title('Original Image');
  subplot(1,2,2);
  imshow(B);
  title('Log Transformation');
  