f=imread('C:\lab-programs\image\circles.png');

subplot(1, 3, 1);
imshow(f); title('Original Image');

w = [2 -1 -1 ; -1 2 -1; -1 -1 2]; 
g = imfilter(double(f), w); 

gtop = g(1:120, 1:120); 
gtop = pixeldup(gtop, 10); 

gbot = g(end-119:end, end-119:end); 
gbot = pixeldup(gbot, 4); 

g = abs(g); 

subplot(1, 3, 2);
imshow(g, []); title('Line Detection');

T = max(g(:)); 
g = g >= T; 

subplot(1, 3, 3);
imshow(g); title('Point Detection');