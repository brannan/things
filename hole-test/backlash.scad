include <write.scad>;
$fn = 100;

difference(){
	
	translate([0,0,5])
	union(){
		scale([.5,1,1])
		rotate([0,0,45])
		cube([20,20,10], center = true);

		scale([1,.5,1])
		rotate([0,0,45])
		cube([20,20,10], center = true);
	}
	
	scale([.2, .2, 1])
	translate([2,-25,10]) {
		write("y0", h=20, t=1.1, center=true);
	}
	
	scale([.2, .2, 1])
	translate([-25,2,10]) {
		write("x0", h=20, t=1.1, center=true);
	}
}


