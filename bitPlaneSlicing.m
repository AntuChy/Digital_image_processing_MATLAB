%% Bitplane slicing
I=imread('C:\lab-programs\image\bitplane.bmp');

G1=bitget(I,1); % get bitplane 1
G2=bitget(I,2); % get bitplane 2
G3=bitget(I,3); % get bitplane 3
G4=bitget(I,4); % get bitplane 4
G5=bitget(I,5); % get bitplane 5
G6=bitget(I,6); % get bitplane 6
G7=bitget(I,7); % get bitplane 7
G8=bitget(I,8); % get bitplane 8
figure(1);
subplot(4,4,[1 8]);imshow(I);title('Original 8 bit image');  %subplot original Image
subplot(4,4,9);imshow(logical(G1));title('Bitplane 1');      %Show Bitplane 1 
subplot(4,4,10);imshow(logical(G2));title('Bitplane 2');     %Show Bitplane 2
subplot(4,4,11);imshow(logical(G3));title('Bitplane 3');     %Show Bitplane 3
subplot(4,4,12);imshow(logical(G4));title('Bitplane 4');     %Show Bitplane 4
subplot(4,4,13);imshow(logical(G5));title('Bitplane 5');     %Show Bitplane 5
subplot(4,4,14);imshow(logical(G6));title('Bitplane 6');     %Show Bitplane 6
subplot(4,4,15);imshow(logical(G7));title('Bitplane 7');     %Show Bitplane 7
subplot(4,4,16);imshow(logical(G8));title('Bitplane 8');     %Show Bitplane 8

