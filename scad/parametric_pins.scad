use <Parametric_Snap_Pins/pin2.scad>;
$fn=100;
//%cube(13);
pinpeg();


translate([10,0,0]) {
	difference(){
		cube([13, 13, 15]);
		translate([6.5, 6.5, 0]) pinhole();
	}
	
}

translate([-20,0,0]) {
	difference(){
		cube([13, 15, 13]);
		translate([6.5, 0, 6.5]) 
		rotate([90,0,180])
		pinhole();
	}
	
}