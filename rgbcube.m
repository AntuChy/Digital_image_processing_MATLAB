%?RGBCUBE Displays an RGB cube on the MATLAB desktop.
function rgbcube (vx, vy, vz)
% RGBCUBE (VX, VY, VZ) displays an RGB color cube, viewed from point (VX, VY, VZ).
% With no input arguments, RGBCUBE uses (10, 10, 4) as the default viewing coordinates.

% Set up parameters for function patch.

vertices_matrix = [0 0 0;0 0 1;0 1 0;0 1 1;1 0 0;1 0 1;1 1 0;1 1 1]; 

% The order of the cube vertices was selected to be the same as the order of the (R,G,B) colors (e.g., (0,0,0)
% corresponds to  black, (1,1,1) corresponds to white, and so on.)

faces_matrix = [1 5 6 2;1 3 7 5;1 2 4 3;2 4 8 6;3 7 8 4;5 6 8 7]; 
colors = vertices_matrix;
%generate rgb cube using patch function
patch('Vertices',vertices_matrix,'Faces',faces_matrix,'FaceVertexCData',colors,'FaceColor','interp','EdgeAlpha',0);
if nargin == 0
    vx = 10; vy = 10; vz=4;
elseif nargin ~=3
    error('Wrong number of inputs.')
end
axis off
view([vx, vy, vz])
axis square
print -f1 -dtiff -r300 rgb_cube.tif