$fn=100;

cross_width = 28.5;
cross_thickness = 2.5;
cross_height = 40;
top_ring_diameter = 23.5;
angled_cross_height = 3.5;
gasket_dia = 19;
gasket_thickness = 5;
stopper_dia = 34.5;
stopper_thickness = 5;
angled_bottom_cross_h = 31; 
bottom_ring_dia = 15.5;
first_bottom_section_h = 16.5;
bottom_hole_width = 8;
fit_clearance = .2; // clearance 
nub_radius = .4;

cross = [ [ -cross_thickness / 2, -cross_width / 2], // bottom left
	 	  [  cross_thickness / 2, -cross_width / 2], // bottom right
				 
		  [cross_thickness / 2  , - cross_thickness / 2], // center right bottom
		  [cross_width  / 2     , - cross_thickness / 2], // right bottom
		  [cross_width  / 2     , cross_thickness / 2], // right top
		  
		  [cross_thickness / 2,   cross_thickness / 2], // center right top
		  [cross_thickness / 2, cross_width / 2      ], // right top
		  [-cross_thickness / 2, cross_width / 2    ], // left_top
		  
		  [- cross_thickness / 2, cross_thickness / 2], // center left top
		  [-cross_width/2        , cross_thickness / 2], // left top
		  [-cross_width/2        , -cross_thickness / 2], // left bottom
		  
		  [ - cross_thickness / 2,  -cross_thickness / 2], // center left bottom
];

cuts = 6; // number of cuts to make in cap for snaps
// stopper top clip
translate([0, 0, stopper_top_z() + 10]) {
	difference(){
		color("red") 
		union(){
			difference(){
				cylinder(r=stopper_dia / 2 + 3, h=stopper_thickness + 3);
				translate([0,0, -stopper_thickness / 2 + .1])
					cylinder(r=stopper_dia / 2 + fit_clearance, h=stopper_thickness / 2);
				resize([stopper_dia + fit_clearance, stopper_dia + fit_clearance, stopper_thickness + fit_clearance]) 
					stopper_top();
			}
			translate([0,0,nub_radius])
			rotate_extrude(){
				translate([stopper_dia / 2 + fit_clearance, 0, 0]) circle(r=nub_radius);
			}
		}
		
		
		translate([0,0,stopper_thickness / 2 - 1])
		for (i = [0 : cuts]) {
			rotate([0, 0, i * (360 / cuts) ])
			cube([stopper_dia + 7, stopper_dia / 4, 2 + stopper_thickness / 2], center = true);
		}
	}
	
}

// z for start of stopper top
function stopper_top_z() = cross_height + angled_cross_height + cross_thickness + gasket_thickness;

// stopper top
translate([0, 0, stopper_top_z()]) {
	stopper_top();
}

module stopper_top(){
	union(){
		translate([0,0, stopper_thickness / 2]) {
			resize([stopper_dia, stopper_dia, stopper_thickness]) sphere(d = stopper_dia);
		}
		cylinder(r=stopper_dia / 2, h=stopper_thickness / 2);
	}
}

// gasket disc
translate([0, 0, cross_height + angled_cross_height + cross_thickness]) {
	cylinder(r = gasket_dia / 2, h = gasket_thickness);
}

// disc on top of cross
translate([0, 0, cross_height + angled_cross_height]) {
	cylinder(r = top_ring_diameter / 2, h = cross_thickness);
}


// angled top part of cross
translate([0, 0, cross_height]) {
	linear_extrude(height = angled_cross_height, scale = top_ring_diameter / cross_width) {
		polygon(cross);
	}
}

// fat part of cross
linear_extrude(height=cross_height) {
	polygon(cross);
}

// angled bottom part of cross
translate([0,0,-angled_bottom_cross_h])
linear_extrude(height=angled_bottom_cross_h, scale=cross_width / bottom_ring_dia){
	resize([bottom_ring_dia, bottom_ring_dia])
	polygon(cross);
}

function bottom_disc_rect_z() = -angled_bottom_cross_h - cross_thickness;

// round disc / rect on bottom of cross
translate([0,0, bottom_disc_rect_z()])
disc_rect();

module disc_rect() {
	union(){
		cylinder(r = bottom_ring_dia / 2, h = cross_thickness);
		translate([0, -bottom_ring_dia /2, 0])
		cube([bottom_ring_dia / 2, bottom_ring_dia, cross_thickness]);
	}
}


function bottom_first_section_z() = bottom_disc_rect_z() - first_bottom_section_h;

// first vertical section beneath bottom disc / rect
translate([bottom_ring_dia / 2 - cross_thickness,  -bottom_ring_dia /2, bottom_first_section_z() ])

difference(){
	union(){
		translate([0,0, bottom_ring_dia / 2])
		cube([cross_thickness, bottom_ring_dia, first_bottom_section_h - bottom_ring_dia / 2]);
		translate([0, bottom_ring_dia / 2, bottom_ring_dia / 2])
		rotate([0,90,0]) cylinder(r=bottom_ring_dia / 2, h = cross_thickness);
	}
	union(){
		translate([-.1, bottom_hole_width / 2, bottom_ring_dia / 2])
		cube([cross_thickness + .2, bottom_hole_width, bottom_hole_width * 1.5]);
		translate([-.1, bottom_ring_dia / 2, bottom_ring_dia / 2])
		rotate([0,90,0]) cylinder(r=bottom_hole_width / 2, h = cross_thickness + .2);
	}
}

