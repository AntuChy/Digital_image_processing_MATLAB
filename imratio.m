function cr = imratio(f1,f2)
%IMRATIO Computes the ratio of the bytes in two images/variables.
%   CR = IMRATIO(F1, F2) returns the ratio of the number of bytes in
%   variables/files F1 and F2. If F1 and F2 are an original and
%   compressed image, respectively, CR is the compression ratio. 


narginchk(2, 2);         % Check input arguments
cr = bytes(f1) / bytes(f2);           % Compute the ratio

function b = bytes(f)  
% Return the number of bytes in input f. If f is a string, assume
% that it is an image filename; if not, it is an image variable.

if ischar(f)
   info = dir(f);        b = info.bytes;
elseif isstruct(f)
   % MATLAB's whos function reports an extra 124 bytes of memory
   % per structure field because of the way MATLAB stores
   % structures in memory.  Don't count this extra memory; instead,
   % add up the memory associated with each field.
   b = 0;
   fields = fieldnames(f);
   for k = 1:length(fields)
      b = b + bytes(f.(fields{k}));
   end
else
   info = whos('f');     b = info.bytes;
end
%r = imratio (imread ('test.jpg'),'test.jpg')