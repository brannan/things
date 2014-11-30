base_thickness = 1.5; 
m8_nut_dia = 14.5; // was 14.38
m6_nut_dia = 11.5;
m6_nut_height = 5.2;
gap = .15; // leave gap around all edges
m6_thread_bore = 5;

// size of m8 nut - gap
function m8_rad()  = m8_nut_dia / 2 - gap;

function nut_height() = m6_nut_height * 2;

four_nuts();

module four_nuts(){
	adapter(nut_height());
	translate([20,0,0]) adapter(nut_height());
	translate([20,20,0]) adapter(nut_height() / 2);
	translate([0,20,0]) adapter(nut_height() / 2);
}




module adapter(height){
	difference(){
		cylinder(r=m8_rad(), h = height, $fn=6);
		
		// subtract cutout for m6 bore
	
		translate([0, 0, -.1])
		cylinder(r=m6_thread_bore / 2 + 2 * gap, h = height + .2, $fn=32);
	}
}