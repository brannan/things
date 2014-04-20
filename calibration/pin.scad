clearance = .2;

union(){
	cylinder(r=6, h=2, $fn=32);
	cylinder(r=2.5, h=20, $fn=32);
}

translate([15,0,0])
difference(){
	cylinder(r=7.5, h=4, $fn=32);
	translate([0,0,-1])
	cylinder(r=2.5 + clearance, h=4 + 2, $fn=32);
}