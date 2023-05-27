se1 = strel('diamond', 5);
diamond = se1.Neighborhood

se2 = strel('disk', 5);
disk = se2.Neighborhood

se3 = strel('sphere', 15);
figure; isosurface(se3.Neighborhood); title('Sphere');