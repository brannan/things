$fn = 50;
width = 25;
height = 15;
thick = 3;
nholes = 7;
holr = 1;

/*
difference(){
	cube([width, height, thick]);
	for (i = [1:nholes]){
		echo(i);
		translate([width/(nholes+1) * i,
				height / 2, thick / 2])
		cylinder(r = holr, h = thick + 3, center = true);
	}
}
*/

for (i = [1: nholes]) {
	rotate([0, 0, (360 / nholes) * i])
	translate([10,0,0])
	rotate([0,90,0])
	cylinder(r1=5, r2=11, h=12);
}
//%cube(15);