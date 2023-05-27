function y = im2jpeg(x, quality)
% y = jpegCompress(x, quality) compresses an image X based on 8 x 8 DCT
% transforms, coefficient quantization and Huffman symbol coding. Input 
% quality determines the amount of information that is lost and compression achieved. y is the encoding structure containing fields:
% y.size          size of x
% y.numblocks     number of 8 x 8 encoded blocks
% y.quality       quality factor as percent
% y.huffman       Huffman coding structure 
narginchk(1, 2);                   % check number of input arguments
if ~ismatrix(x) || ~isreal(x) || ~ isnumeric(x) || ~ isa(x, 'uint8')
    error('The input must be a uint8 image.');
end
if nargin < 2
    quality = 1;                    % default value for quality
end 
if quality <= 0
    error('Input parameter QUALITY must be greater than zero.');
end
m = [16 11 10 16 24 40 51 61        % default JPEG normalizing array
     12 12 14 19 26 58 60 55        % and zig-zag reordering pattern
     14 13 16 24 40 57 69 56 
     14 17 22 29 51 87 80 62
     18 22 37 56 68 109 103 77
     24 35 55 64 81 104 113 92 
     49 64 78 87 103 121 120 101 
     72 92 95 98 112 100 103 99] * quality;
order = [1 9 2 3 10 17 25 18 11 4 5 12 19 26 33  ...
         41 34 27 20 13 6 7 14 21 28 35 42 49 57 50 ...
         43 36 29 22 15 8 16 23 30 37 44 51 58 59 52 ...
         45 38 31 24 32 39 46 53 60 61 54 47 40 48 55 ...
         62 63 56 64];
[xm, xn] = size(x);                 % retrieve size of input image
x = double(x) - 128;                % level shift input                        
t = dctmtx(8);                      % compute 8 x 8 DCT matrix
% Compute DCTs pf 8 x 8 blocks and quantize coefficients 
y = blkproc(x, [8 8], 'P1 * x * P2', t, t');
y = blkproc(y, [8 8], 'round(x ./ P1)', m);  % <== nearly all elements from y are zero after this step
y = im2col(y, [8 8], 'distinct');   % break 8 x 8 blocks into columns
xb = size(y, 2);                    % get number of blocks
y = y(order, :);                    % reorder column elements
eob = max(x(:)) + 1;                % create end-of-block symbol
r = zeros(numel(y) + size(y, 2), 1);   
count = 0;
for j = 1:xb                        % process one block(one column) at a time
    i = find(y(:, j), 1, 'last');   % find last non-zero element
    if isempty(i)                   % check if there are no non-zero values
        i = 0; 
    end 
    p = count + 1;
    q = p + i;
    r(p:q)  = [y(1:i, j); eob];     % truncate trailing zeros, add eob
    count = count + i + 1;          % and add to output vector
end
r((count + 1):end) = [];            % delete unused portion of r
y           = struct;
y.size      = uint16([xm xn]);
y.numblocks = uint16(xb);
y.quality   = uint16(quality * 100);
y.huffman   = mat2huff(r);
%f = imread('cell.tif');
%c1= im2jpeg(f);