// PRUSA Mendel
// LM8UU-Bearing X-Carriage
// Used for sliding on X axis
// GNU GPL v2
// Simon Kühling <mail@simonkuehling.de>
// Derived from
//	- "Lm8uu X Carriage with Fan Mount for Prusa Mendel" by Greg Frost
//	  http://www.thingiverse.com/thing:9869
//	- "Slim LM8UU Holder Parametric" by Jonas Kühling
//	  http://www.thingiverse.com/thing:16158

// Gregs configuration file
include <configuration.scad>

// jonaskuehling's slim LM8UU Holder
include <lm8uu-holder-slim.scad>


belt_clamp_thickness=2; 
belt_clamp_width=m3_diameter+3*belt_clamp_thickness+2;

for (i=[-1,1])
translate([0,i*(belt_clamp_width+1),0])
belt_clamp();

belt_clamp_channel();

simonkuehling_x_carriage(with_fanmount=true);


module simonkuehling_x_carriage(with_fanmount=false) 
{
	render()
	difference()
	{
		union ()
		{	
			// base plate
			translate([0,0,lm8uu_support_thickness/2])
			cube([(25+body_width/2)*2,(28+body_length/2)*2,lm8uu_support_thickness],center=true);

			// Center Hole Support
			cylinder(r=25+m4_diameter,h=6);

			// fan mount (optional)
			if (with_fanmount) 
			difference()
			{
				translate([0,-(28+body_length/2)-fan_support_block/2+3,0])
				fan_mount();
	
				// LM8UU Bearing Clearance - x-min
				translate([-25,-30,7.6+lm8uu_support_thickness])
				rotate([90,0,0])
				%cylinder(h=30,r=LM8UU_dia/2,$fs=1);

				translate([25,-30,7.6+lm8uu_support_thickness])
				rotate([90,0,0])
				%cylinder(h=30,r=LM8UU_dia/2,$fs=1);
			}
		}

		// Clearance for LM8UU Holders
		for (i=[1,-1])
		translate([i*25,0,5+lm8uu_support_thickness])
		cube([body_width,(28+body_length/2)*2,10],center=true);

		
		// Extruder Mounting Holes
		for (i=[0:1])
		rotate(180*i)
		for (hole=[-1:1])
		rotate(hole*22)
		translate([0,25,-1])
		cylinder(r=m4_diameter/2,h=lm8uu_support_thickness*2+2,$fs=1);

		// Hotend Hole	
		translate([0,0,-1])
		cylinder(r=21,h=lm8uu_support_thickness*2+2);

		// Substract Belt Clamp Holes from base plate
		for (i=[-1,1])
		translate([-25-13.5-1,i*((28-body_length/2)-belt_clamp_width/2),0])
		rotate(90*(i+1)+180) 
		belt_clamp_holes();
		
	}

	// LM8UU Holders
	for(i=[-1,1])
	{
		translate([25,i*(28),lm8uu_support_thickness-2])
		render()
		rotate([0,0,180])
		lm8uu_holder();

		translate([-25,i*28,lm8uu_support_thickness-2])
		render()
		lm8uu_holder();				
	}

	// Belt Clamp Sockets
	difference()
	{
		for (i=[-1,1])
		translate([-25-13.5-1,i*((28-body_length/2)-belt_clamp_width/2),0])
		rotate(90*(i+1)+180) 
		belt_clamp_socket ();

		// BeltClamp Socket Rod Clearance
		translate([-25,0,7.6+lm8uu_support_thickness])
		rotate([90,0,0])
		cylinder(h=90,r=5,$fs=1,center=true);
	}

}


clearance=0.7;
lm8uu_diameter=15+clearance;
lm8uu_length=24+clearance;
lm8uu_support_thickness=3.2; 
lm8uu_end_diameter=m8_diameter+1.5;

lm8uu_holder_width=lm8uu_diameter+2*lm8uu_support_thickness;
lm8uu_holder_length=lm8uu_length+2*lm8uu_support_thickness;
lm8uu_holder_height=lm8uu_diameter*0.75+lm8uu_support_thickness;

lm8uu_holder_gap=(lm8uu_holder_length-6*lm8uu_support_thickness)/2;

screw_hole_r=4/2;

belt_clamp_hole_separation=10;

belt_clamp_height=m3_diameter+2*belt_clamp_thickness;
belt_clamp_length=belt_clamp_hole_separation+m3_diameter+2*belt_clamp_thickness;

module belt_clamp_socket()
{
	difference()
	{
		translate([0,0,belt_clamp_height/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,belt_clamp_height],center=true);
			for(i=[-1,1])
			translate([i*belt_clamp_hole_separation/2,0,0])
			cylinder(r=belt_clamp_width/2,h=belt_clamp_height,center=true);
		}
		belt_clamp_holes();
	}
}

belt_width=6;
belt_thickness=1.5; 
tooth_height=1.5;
tooth_spacing=5;

belt_clamp_channel_height=belt_thickness+tooth_height+belt_clamp_thickness*2;

module belt_clamp_channel()
{
	difference()
	{
		translate([0,0,belt_clamp_channel_height/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,belt_clamp_channel_height],center=true);
			for(i=[-1,1])
			translate([i*belt_clamp_hole_separation/2,0,0])
			cylinder(r=belt_clamp_width/2,h=belt_clamp_channel_height,center=true);
		}

		for(i=[-1,1])
		translate([i*belt_clamp_hole_separation/2,0,-1])
		rotate(360/16)
		cylinder(r=m3_diameter/2,h=belt_clamp_channel_height+2,$fn=8);

		translate([-belt_width/2,-belt_clamp_width/2-1,belt_clamp_channel_height-belt_thickness-tooth_height])
		cube([belt_width,belt_clamp_width+2,belt_thickness+tooth_height+1]);
	}
}

module belt_clamp_holes()
{
	translate([0,0,belt_clamp_height/2])
	{
		for(i=[-1,1])
		translate([i*belt_clamp_hole_separation/2,0,0])
		cylinder(r=m3_diameter/2,h=belt_clamp_height+2,center=true,$fn=8);
	
		rotate([90,0,0])
		rotate(360/16)
		cylinder(r=m3_diameter/2-0.3 /*tight*/ ,h=belt_clamp_width+2,center=true,$fn=8);

		rotate([90,0,0]) 
		translate([0,0,belt_clamp_width/2])
		cylinder(r=m3_nut_diameter/2-0.3 /*tight*/ ,h=3.4,center=true,$fn=6);
	}
}

belt_clamp_clamp_height=tooth_height+belt_clamp_thickness*2;


module belt_clamp()
{
	difference()
	{
		translate([0,0,belt_clamp_clamp_height/2])
		union()
		{
			cube([belt_clamp_hole_separation,belt_clamp_width,belt_clamp_clamp_height],center=true);
			for(i=[-1,1])
			translate([i*belt_clamp_hole_separation/2,0,0])
			cylinder(r=belt_clamp_width/2,h=belt_clamp_clamp_height,center=true);
		}

		for(i=[-1,1])
		translate([i*belt_clamp_hole_separation/2,0,-1])
		rotate(360/16)
		cylinder(r=m3_diameter/2,h=belt_clamp_clamp_height+2,$fn=8);

		for(i=[-1:1])
		translate([-belt_width/2,-tooth_spacing/4+i*tooth_spacing,belt_clamp_clamp_height-tooth_height])
		cube([belt_width,tooth_spacing/2,tooth_height+1]);
	}
}



fan_hole_separation=32; // check
fan_support_block=10;
fan_trap_width=3;
fan_support_thickness=10;
fan_diameter=36;
fan_hole_height=5.5;

module fan_mount() 
{
	difference()
	{
		union ()
		{
			translate([0,0,fan_support_block/4])
			cube([fan_hole_separation+fan_support_block,fan_support_thickness,fan_support_block/2],center=true);
			
			for (i=[-1,1])
			translate([i*fan_hole_separation/2,0,fan_support_block/2])
			rotate([90,0,0])
			cylinder(r=fan_support_block/2,h=fan_support_block,center=true,$fn=20);
			
			translate([0,0,fan_support_block/2])
			cube([fan_hole_separation,fan_support_thickness,fan_support_block],center=true);
		}
		for(i=[-1,1])
		{
			translate([i*fan_hole_separation/2,0,fan_hole_height])
			{
				rotate([90,0,0])
				rotate(180/8)
				cylinder(r=m3_diameter/2,h=fan_support_thickness+2,center=true,$fn=8);
				translate([0,0,0])
				rotate([90,0,0])
				rotate([0,0,180/6])
				cylinder(r=(m3_nut_diameter-0.5)/2,h=fan_trap_width,center=true,$fn=6);
				color([1,0,0])
				translate([0,0,-(fan_hole_height+1)/2])
				cube([(m3_nut_diameter-0.5)*cos(30),fan_trap_width,fan_hole_height+1],center=true);
			}
		}
		translate([0,0,fan_hole_separation/2+fan_hole_height])
		rotate([-90,0,0])
		cylinder(r=fan_diameter/2,h=fan_support_thickness+2,center=true);
	}
}

function triangulate (point1, point2, length1, length2) = 
point1 + 
length1*rotated(
atan2(point2[1]-point1[1],point2[0]-point1[0])+
angle(distance(point1,point2),length1,length2));

function distance(point1,point2)=
sqrt((point1[0]-point2[0])*(point1[0]-point2[0])+
(point1[1]-point2[1])*(point1[1]-point2[1]));

function angle(a,b,c) = acos((a*a+b*b-c*c)/(2*a*b)); 

function rotated(a)=[cos(a),sin(a),0];
