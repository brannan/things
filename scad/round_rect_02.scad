$fn = 16;
r = 1.5;
width = 20;
depth = 10; 
height = 15;

round_cube(width, depth, height, r);
//%cube([width, depth, height]);

module round_cube(w, d, h, r) {
hull(){
	// bottom
	translate([r,r,r]) sphere(r);
	translate([r, d - r, r]) sphere(r);
	translate([w -r,r,r]) sphere(r);
	translate([w - r, d - r, r]) sphere(r);

	// top
	translate([r,r, h - r]) sphere(r);
	translate([r, d - r, h - r]) sphere(r);
	translate([w -r,r, h - r]) sphere(r);
	translate([w - r, d - r, h - r]) sphere(r);
}
}

