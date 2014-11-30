include <configuration.scad>

m3_diameter = 3.2;
m3_nut_diameter = m3_diameter * 1.8 + .5;
m3_nut_diameter_bigger = m3_nut_diameter;
xend_height=18;
xend_length=40;
z_stop_mount_hole_depth=xend_height;
z_stop_mount_hole_height=xend_height;
z_stop_mount_thick=5.5;
z_stop_mount_space=.5;
z_stop_mount_width=10;
z_stop_wing_length=15;

zcompanion();

//translate([45,-33,0])
//rotate ([0,0,180]) 
//zcompanion();

module zcompanion()
{
	rotate ([90,0,0]) 
	translate([0,0,0])
	zmount();
	//translate([8,-8,0]) zboot();
}

module zmount()
{
	difference()
	{
		translate([-5,0,-z_stop_mount_thick]) 
		cube(size = [	z_stop_mount_hole_depth+z_stop_mount_thick+5,
			 			z_stop_mount_width,
						xend_height+2*z_stop_mount_thick]);
		translate([-1,-1,0]) 
		cube(size = [	z_stop_mount_hole_depth+2,
				 		z_stop_mount_width+2,
						xend_height+z_stop_mount_space]);

		translate([-xend_height,-1,-xend_height]) 
		cube(size = [	xend_height,
				 		z_stop_mount_width+2,
						2*xend_height+z_stop_mount_space-2]);

		translate([z_stop_mount_hole_depth/2,z_stop_mount_width/2,-2.5])
		mount_screw_hole();
		translate([xend_height+z_stop_mount_space-1,z_stop_mount_width+1,0])
		rotate([90,0,0])
		cylinder(h=z_stop_mount_width+2, 
				r=2, 
				$fn=40);
		
	}


	translate([	z_stop_mount_hole_depth+z_stop_mount_thick,
				0,
				1]) { //-z_stop_mount_thick]) {
		difference()
		{
			union() 
			{
				cube(size = [	z_stop_wing_length-z_stop_mount_width/2,
			 					z_stop_mount_width,
								z_stop_mount_thick+2]);
				translate([		z_stop_wing_length-z_stop_mount_width/2,
								z_stop_mount_width/2,
								0])
				cylinder(	h=z_stop_mount_thick+2, 
							r=z_stop_mount_width/2, 
							$fn=40);
			
			}
			translate([	z_stop_wing_length-z_stop_mount_width/2,
						z_stop_mount_width/2,
						-z_stop_mount_thick+0.5])
			z_stop_screw_hole();

		}

	}	
}

module zboot()
{
	difference()
	{
		union()
		{
			translate([0,0,2]) 
			cylinder(h=7, r1=5, r2=m3_diameter/2+1, $fn=40);
			cylinder(h=2, r=5, $fn=40);
		}
		translate([0,0,6]) 
		cylinder(h=7, r=m3_diameter/2-0.1, $fn=40);
	}
}

module mount_screw_hole()
{
	translate(v=[0, 0, -5])
	cylinder(r=m3_diameter/2, h=12,$fn=20);
	translate(v=[0, 0, 0]) 
	rotate([0,0,30])
	cylinder(h=7, r=m3_nut_diameter_bigger/2, $fn=6);
}

module z_stop_screw_hole()
{
	translate(v=[0, 0, 5])
	cylinder(r=m3_diameter/2, h=12,$fn=20);
	translate(v=[0, 0, 0]) 
	rotate([0,0,30])
	cylinder(h=7, r=m3_nut_diameter_bigger/2, $fn=6);
}