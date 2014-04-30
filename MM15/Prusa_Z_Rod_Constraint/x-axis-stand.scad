use <MCAD/boxes.scad>;

rod_dia = 8.2;
rod_spacing = 50;
stand_height = 70;
stand_depth = 10;

stand_width = rod_spacing + 20;

// center of the stand - 1/2 rod spacing
left_cylinder_x =  -rod_spacing / 2;

right_cylinder_x = rod_spacing / 2;

union(){
translate([0, stand_depth / 2, 5/2])
roundedBox([stand_width, 20, 5], radius=1.5, sidesonly=true);
	difference(){
		// stand body
		union(){
			translate([-stand_width/2 + 10, stand_depth / 2, stand_height / 2])
			roundedBox([20, 10, stand_height], radius=1.5, sidesonly=true);
			
			translate([stand_width/2 - 10, stand_depth / 2, stand_height / 2])
			roundedBox([20, 10, stand_height], radius=1.5, sidesonly=true);
		}

		//cylinder cutouts
		translate([left_cylinder_x, stand_depth * 1.5 , stand_height  + 1]) rotate([90,0,0])
			cylinder(h=stand_depth * 2, r=rod_dia/2);

		translate([right_cylinder_x, stand_depth * 1.5 , stand_height  + 1]) rotate([90,0,0])
			cylinder(h=stand_depth * 2, r=rod_dia/2);
	}
}