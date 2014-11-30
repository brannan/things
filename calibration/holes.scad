$fn = 128;


difference(){
	cube([50,50,4]);

	translate([10,10,-1]) cylinder(r=3, h=10);

	translate([10,40,-1]) cylinder(r=4, h=10);

	translate([40,40,-1]) cylinder(r=5, h=10);

	translate([40,10,-1]) cylinder(r=6, h=10);

	translate([25,25,-1]) cylinder(r=10, h=10);
}