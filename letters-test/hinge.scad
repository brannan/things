$fn = 64;
include<truncated_cone.scad>;
//pin(3,12);
//receiver(6, 3, 12);
hinge(3, 12, 6, 3);
slop = .2;

%cube(12);
module pin(radius, length) {
	translate([0,0,0]) {
	union(){
	translate([0,0,radius]) cylinder(r=radius, h=length - 2 * radius);
	translate([0,0,radius]) pin_end(radius);
	translate([0,0,length - radius])
		pin_end(radius);
	}
	}
}

module pin_end(radius) {
	//sphere(r=radius);
	truncated_45_cone_two_ends(3);
}

module receiver(radius, thickness, pin_radius, pin_length) {

	union(){
	cylinder(r=radius, h=thickness);
	translate([0,0, pin_length - 3])
		cylinder(r=radius, h=thickness);
	}
	
}

module hinge(pin_radius, pin_length, hinge_radius, hinge_thickness){
	xy_scale = (pin_radius*2 + 2*slop) / (pin_radius * 2);
	z_scale = (pin_length + 2*slop) / pin_length;
	union(){
	difference(){
		receiver(hinge_radius, hinge_thickness, pin_radius, pin_length);
		
		translate([0,0,-slop]) {
			scale([xy_scale, xy_scale, z_scale]) {
				pin(pin_radius, pin_length);
			}
		}
	}
	pin(pin_radius, pin_length);
	}

}