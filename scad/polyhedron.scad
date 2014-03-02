pyr_points = [[25,25,0], [25,0,0], [0,0,0], [0,25,0], 
[12.5,12.5,25]];
pyr_triangles = [[0,1,4],[1,2,4],[2,3,4],[3,0,4],[1,0,3],[2,1,3]];
polyhedron(pyr_points, pyr_triangles);