function CODE = huffman(p)
%HUFFMAN Builds a variable-length huffman cade for symbol source.
% CODE = huffman(p) returns a huffman code as binary strings in cell array
% CODE for input symbol probability vector p .Each word in CODE corresponds
% to a symbol whose probability is at the corresponding index of P.
% 
% Based on huffman5 by Sean Danaher ,University of Northumbria,Newcasetle
% UK.Available at the MATLAB Central File Exchange :Category General DSP in
% Signal Processing and Communications.

% Check the input arguments for reasonableness.
narginchk(1,1);
if (ndims(p) ~= 2) || (min(size(p))>1) || ~isreal(p) || ~isnumeric(p)
    error('P must be a real numeric vector.');
end

% Global variable surviving all recursions of function 'makecode'
global CODE
CODE = cell(length(p),1); %Init the global cell array

if length(p) > 1          %When more than one symbol ...
    p = p/sum(p);         %Normalize the input probabilities
    s = reduce(p);        %Do huffman source symbol reductions
    makecode(s,[]);       %Recursively generate the code 
else
    CODE = {'1'}          %Else,trivial one symbol case!
end

% -------------------------------------------------------------------%
function s = reduce(p)
% Create a huffman source reduction three in a MATLAB cell structure by
% performing source symbol reductions until there are only two reduced
% symbols remaining
s = cell(length(p),1);

% Cenerate a starting three with symbol nodes 1,2,3,... to reference the
% symbol probabilities.
for i = 1:length(p)
    s{i} = i;
end

while numel(s) > 2
    [p,i] = sort(p);  %sort the symbol probabilities
    p(2) = p(1) +p(2);%Merge the 2 lowest probabilities 
    p(1) = [];        %and prune the lowest one
    s = s(i) ;         %Reorder three for new probabilities and merge & prune its nodes
    s{2} = {s{1},s{2}};
    s(1) = [];
end

%---------------------------------------------------------------------%
function makecode(sc,codeword)
% Scan the nodes of a huffman source reduction three recursively to
% generate the indicated variable lengrh code words.

% Global variable surcicing all recursive calls
global CODE
if isa(sc,'cell')     %For cell array nodes
    makecode(sc{1},[codeword 0]);
    makecode(sc{2},[codeword 1]);
else
    CODE{sc} = char('0' + codeword);
end

% p = [0.1875 0.5 0.125 0.1875];
% h = huffman(p)

% another
% f2 = uint8([2 3 4 2; 3 2 4 4;2 2 1 2; 1 1 2 2])
% whos('f2')
% C = huffman(hist(double(f2(:)), 4))