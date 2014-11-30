width = 25;
depth = 25;
thickness = 3;
rim = 12;

spacer();

translate([-width - 5, 0, 0]) spacer();

translate([-width - 5, -depth - 5, 0]) spacer();

translate([0, -depth - 5, 0]) spacer();

module spacer(){

difference(){
	union(){
		cube([depth,width, thickness]);
		translate([depth,0,0]) cube([thickness, width , rim]);
	}

	translate([depth / 2 + 3, width / 2, -.1])
	cylinder(r=3.5, h=25);
}

}

