$fn = 100;
width = 20;
depth = 10;
bevel = 2;

linear_extrude(height=10)
bevel_rect(width, depth, bevel);

module bevel_rect(w, d, b) {
	polygon(points = [[0 + b, 0], [w - b, 0], // bottom edge
				[w, 0+b], [w, d - b],       // right edge
				[w - b, d], [0 + b, d],     // top edge
				[0,d - b], [0, 0 + b]]);    // left edge

}