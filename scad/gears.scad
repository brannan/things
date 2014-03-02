include <MCAD/involute_gears.scad>;
$fn = 20;
// Simple Test

gear (circular_pitch=500,
	number_of_teeth = 13,
	gear_thickness = 6,
	rim_thickness = 10,
	hub_thickness = 10, 
	bore_diameter=8);
cylinder(r=7.5/2, h=10); // shaft

%cube([31, 15, 15]);

translate([31,0,0]) {
gear (circular_pitch=500,
	number_of_teeth = 9,
	gear_thickness = 6,
	rim_thickness = 10,
	hub_thickness = 10,
	bore_diameter=8);
	cylinder(r=7.5/2, h=10); // shaft
}

translate([62,0,0]) {
	gear (circular_pitch=500,
	number_of_teeth = 13,
	gear_thickness = 6,
	rim_thickness = 10,
	hub_thickness = 10,
	bore_diameter=8);
	cylinder(r=7.5/2, h=10); // shaft
}

//%color("red") cylinder(h=17, r=25);

//test_bevel_gear_pair ();