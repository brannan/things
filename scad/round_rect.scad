$fn = 100;
width = 20;
depth = 10;
height = 15;
bevel = 2;

//linear_extrude(height=10)
round_cube_xy(width, depth, height, bevel);
translate([0,-30,0])
round_cube_yz(width, depth, height, bevel);


module round_cube_xy(w, d, h, b) {
	linear_extrude(h)
	hull(){
	translate([0 + b, b, 0]) circle(b);
	translate([w - b, b, 0]) circle(b);
	translate([w - b, d - b, 0]) circle(b);
	translate([0 + b, d- b, 0]) circle(b);
	}
}

module round_cube_yz(w, d, h, b) {
	translate([0,0,h])
	rotate([0,90,0])
	linear_extrude(w)
	hull(){
	translate([0 + b, b, 0]) circle(b);
	translate([h - b, b, 0]) circle(b);
	translate([h - b, d - b, 0]) circle(b);
	translate([0 + b, d- b, 0]) circle(b);
	}
}