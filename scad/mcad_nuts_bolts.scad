use <MCAD/nuts_and_bolts.scad>;

difference(){
	cube([20,20,10]);
	translate([10,10,-1]) boltHole(size=6, length=12);
}

difference(){
	translate([40,0,0]) cube([20,20,10]);
	translate([50,10,-2]) nutHole(size=6);
}