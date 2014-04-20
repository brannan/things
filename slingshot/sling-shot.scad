$fn = 100;
radius = 12;
handleLength = 75;
flatRatio = .95;
bandRingRadius = 4;

translate([0, 0, .9 * radius - radius / 4])
rotate([-90,0,0])
slingshot();

//cube(12 * flatRatio);

module slingshot(){
	// Rounded handle. Take a cylinder and shave off two sides so 
	// that it will print
	flattendRod(r = radius, h = handleLength, ratio = flatRatio);

	// left Y arm
	translate([0, 0, handleLength - radius])
	rotate([0,35,0])
	arm(length = 60);

	// right Y arm
	translate([0, 0, handleLength - radius])
	rotate([0,-35,0])
	arm(length = 60);
}


// create a tapered arm
module arm(r = 12, length = 75, ratio = flatRatio){
	difference(){
		// rotate the arm back so that there is flat spot to print
		rotate([-4.5,0,0]) 
		union(){
			linear_extrude(height=length, scale=.4) // extrude scaled arm
			circle(r = r);
			translate([0,0,length + 10]) // move the torroid up the arm
			rotate([0,90,90]) // rotate torroid into vertical plane
			rotate_extrude(convexity=10) // create a torroid
						translate([10,0,0])
						circle(r = bandRingRadius);
		}
		
		// flatten one side of sling shot
		translate([0, r * ratio, length -1 ])
		cube([radius * 2, r / 2, length * 2], center = true);

		// flatten other side of sling shot
		translate([0, -r * ratio, length -1])
		cube([radius * 2, r / 2, length * 2], center = true);
	}
	
}

// Create a flattend rod
module flattendRod(r = 12, length = 75, ratio = flatRatio) {
	difference(){
		cylinder(r=r, h=length);

		translate([0, r * ratio, length / 2])
		cube([radius * 2, r / 2, length + .2], center = true);

		echo("y translate: ", r * ratio);
		translate([0, -r * ratio, length / 2 + .05])
		cube([radius * 2, r / 2, length + .2], center = true);
	}
}


