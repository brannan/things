$fn = 64;

chop_end = .5; // How much to chop off the end of the cones

//truncated_45_cone_two_ends(3);

module truncated_45_cone(radius) {
	// add a cylinder to compensate for chopped end to keep length equal to radius
	union() {
	cylinder(r=radius, h=chop_end); 
	translate([0,0,chop_end]) {
		intersection(){
			translate([-radius,-radius,0]) cube(size=[radius * 2,radius * 2 ,radius - .5]);
			cylinder(h=radius, r1=radius, r2=0);
		}
	}
	}
}

module truncated_45_cone_two_ends(radius) {
	union() {
		truncated_45_cone(radius);
		rotate([180,0,0]) truncated_45_cone(radius);
	}
}