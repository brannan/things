spacing = .2;
radius = 3;
thickness = .5;

union(){
	cylinder(r=radius+3, h=2, $fn=64);
	difference(){
		cylinder(r=radius, h=22, $fn=64);
		translate([0,0,-1]) cylinder(r=radius - thickness, h=24, $fn=64);
	}
}

// Make a fit test cylinder with some padding
translate([2* radius + 3 + 5 + 3,0,0]) {
difference(){
	cylinder(r=radius+5, h=2, $fn=64);
	translate([0,0,-1]) cylinder(r=3 + spacing, h=22, $fn=64);
}
%cylinder(r=radius, h=2, $fn=64);
}