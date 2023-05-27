%% Contrast stretching
I=imread('C:\lab-programs\image\bitplane.bmp');

G=I;
[rows, cols]=size(I);
T1=input('Enter value of t1(Threshold 1): ');
T2=input('Enter value of t2(Threshold 2): ');
s1=input('Enter value of slope 1: ');
s2=input('Enter value of slope 2: ');
s3=input('Enter value of slope 3: ');
coeffT1=s1.*T1;
coeffT2=s2.*(T2-T1)+coeffT1;
 for i=1:rows
    for j=1:cols
        if(I(i,j)< T1)
            G(i,j)=floor(s1.*I(i,j));
        elseif(I(i,j)>= T1 && I(i,j)< T2)
            G(i,j)=floor(s2.*(I(i,j)-T1)+coeffT1);
            elseif(I(i,j)>= T2)
            G(i,j)=floor(s3.*(I(i,j)-T2)+coeffT2);
        end
    end
 end
figure(1);
subplot(2,1,1);
imshow(I);
title('Original image');
subplot(2,1,2);
imshow(G);
text=sprintf('Result of Contrast Stretching with T1=%d, T2=%d, s1=%1.1f, s2=%1.1f, s3=%1.1f',T1,T2,s1,s2,s3);
title(text);
figure(2);
subplot(2,1,1);
imhist(I);
title('Histogram for original Image');
subplot(2,1,2);
imhist(G);
text1=sprintf('Histogram for Contrast Stretching with T1=%d, T2=%d, s1=%1.1f, s2=%1.1f, s3=%1.1f',T1,T2,s1,s2,s3);
title(text1);
