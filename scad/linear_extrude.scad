$fn=64;

linear_extrude(height=20) 
difference(){
	square([12,5], center=true);
	circle(2);
}


translate([20,0,0])
linear_extrude(height=20, twist=45, scale=0, slices=100)
square(12, center=true);


translate([0,-10,0])
rotate_extrude() 
	translate([2,0,0]) 
	circle(1, $fn=100);

translate([-20,0,0])
rotate_extrude()
polygon( points =[[0,0],[2,1], [1,8], [1,9], [3,11], [5,15]]);

/*
translate([-20,-20,0])
linear_extrude(height=10)
polygon( points =[[0,0],[2,1], [1,8], [1,9], [3,11], [5,15]]);
*/