$fn = 25;
width = 25;
height = 15;
thick = 3;
nholes = 5;
holer = 2;

difference(){
	cube([width, height, thick]);
	for (i = [1:nholes]){
		echo(i);
		translate([width/(nholes+1) * i,
				height / 2, thick / 2])
		cylinder(r = holr, h = thick + 3, center = true);
	}
}