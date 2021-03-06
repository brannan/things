trap_height = 12;
nut_dia = 15;
clearance = .2;
z_rod_dia = 10;
screw_dia = 8;
thickness = 3;


difference(){
	union(){
		cylinder(h= trap_height, r=nut_dia/2 + 2.5, $fn=6);
		
		cylinder(h=2.5, r=nut_dia/2 + 5, $fn=12);
		translate([15, 0,0 ]){
			cylinder(h=trap_height, r=z_rod_dia/2 + 2);
		}
		translate([0, -(z_rod_dia + thickness * 2 )/2],0)
			cube([20+15 + thickness/2, z_rod_dia + thickness * 2, trap_height]);
		
			translate([20 + 15 + thickness/2, z_rod_dia/2 + thickness/2, 0]){
				cylinder(h=trap_height, r=thickness / 2, $fn=50);
			}
			
			translate([20 + 15 + thickness/2, -(z_rod_dia/2 + thickness/2), 0]){
				cylinder(h=trap_height, r=thickness / 2, $fn=50);
			}
	}
	
	// cutout for threaded rod w/ double clearance so rod doesn't contact at all
	translate([0,0,-.1]) 
		cylinder(h=trap_height + .2, r=screw_dia/2 + clearance * 2);
	
	// cutout for nut + clearance
	translate([0,0,2])  
		cylinder(h=trap_height + .2, r=nut_dia/2 + clearance, $fn=6);
	
	// cutout for z rod + clearance
	translate([15,0,-.1])
		cylinder(h=trap_height + .2, r=z_rod_dia/2 + clearance, $fn=32);
	
	// cutout for slide
	translate([20 - z_rod_dia/2 - .1, -(z_rod_dia + clearance * 2 + .1)/2,-.1])
		cube([15 + z_rod_dia, z_rod_dia + clearance * 2 , trap_height + .2 + 10]);
}



