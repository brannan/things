base_thickness = 1.5; 
m8_nut_dia = 14.5; // was 14.38
m8_nut_height = 7;
m6_nut_dia = 11.5;
m6_nut_height = 5.2;
gap = .15; // leave gap around all edges
m6_rod_dia = 6 + gap;

four_adapters();

module four_adapters(){
	adapter();
	translate([20,0,0]) adapter();
	translate([20,20,0]) adapter();
	translate([0,20,0]) adapter();
}


// size of m8 nut - gap
function m8_rad()  = m8_nut_dia / 2 - gap;

// size of m6 nut trap + gap
function m6_rad()  = m6_nut_dia / 2 + gap; 

function adapter_height() = m8_nut_height + base_thickness;

module adapter(){
	difference(){
		cylinder(r=m8_rad(), h = adapter_height() , $fn=6);
		
		// subtract cutout for m6 nut
		translate([0, 0, adapter_height() - m6_nut_height])
			cylinder(r=m6_rad(), h = m6_nut_height + .1, $fn=6);
		translate([0, 0, -.1])
		cylinder(r=m6_rod_dia / 2 + 2 * gap, h = adapter_height() + .2);
	}
}