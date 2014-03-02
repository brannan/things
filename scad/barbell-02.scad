//mirror([1,0,0])
union(){
	translate([-10,0,0])
		difference() {
			color("red") sphere(r=5);
			translate([0,-5,-5]) cube(10);
		}
		rotate([0,90,0]) cylinder(r=2, h=20, center=true);
		translate([10,0,0])
			difference() {
				color("green") sphere(r=5);
				translate([-10,-5,-5]) cube(10);
			}
}
