difference(){
union(){
	cube([150,10,1]);

	for(i = [1:14]){
		translate([i*10 - .35, 0, 0]) 
			cube([.7, 10, 1.5]);
	}
}

for(i = [1:14]){
	translate([i*10 - .35, -.5, -.1]) 
			cube([.7, 1.5, 2]);
}

translate([5,5,-1]) cylinder(r=2,h=5, $fn=32);
}