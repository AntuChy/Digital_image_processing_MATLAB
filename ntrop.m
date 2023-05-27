function h = ntrop(x, n)
%NT ROP computes a first-order estimate of the entropy of a matrix.
% H = NTROP(X, N) returns the entropy of matrix X with N
% symbols. N = 256 if omitted but it must be larger than the
% number of unique values in X for accurate results. The estimate
% assumes a statistically independent source characterized by the
% relative frequency of occurrence of the elements in X.
% The estimate is a lower bound on the average number of bits per
% unique value (or symbol) when coding without coding redundancy.
narginchk(1, 2); % Check input arguments
if nargin < 2
n = 256; % Default for n.
end
x = double(x);
xh = hist(x(:), n);
xh = xh / sum(xh(:));
% Make input double
% Compute N-bin histogram
% Compute probabilities
% Make mask to eliminate O' s since 10g2(0) = -info
i = find(xh);
h = -sum(xh(i) .* log2(xh(i))); % Compute entropy 

% f= [119 123 168 119; 123 119 168 168];
% f =[ f; 119 119 107 119; 107 107 119 119]
% P = hist(f(:), 8) ;
% P = P / sum(P)
% h = ntrop(f)