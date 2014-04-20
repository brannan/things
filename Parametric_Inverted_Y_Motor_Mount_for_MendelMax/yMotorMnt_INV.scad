//This is a replacement Y motor mount for Mendel Max printers, 
//although it could be modified to work with other aluminum 
//extrusion frame printers.

//Advantages over stock part:
//1. Full 4 hole mounting for strength
//2. Motor can be mounted with thermal tape or thermal grease 
//	contacting aluminum extrusion to act as heat sink.
//3. Inverted nature puts compressive stress on support elements 
//	rather than stress which acts on delaminating layers.
//4. Fully parametric with OpenSCAD source provided
//5. I like curved supports

//Release under CC-BY-NC-SA-3.0
//by Thomas Fulenwider a.k.a. cobra18t

include <configuration.scad>


//**start defs**

beam_sep = 50;
extrusion_w=20;
beltPass_w = 30;
beltPass_h = 31;
screwLand_l=30;
screw_sep=14;
thick=6;
sThick=4.5;	//thickness where m5 screws bolt in
m5_diameter=5.3;
s1x=thick+screwLand_l/5;
s2x=thick+4*screwLand_l/5;
supportTop_a=15;		//starting angle off motor face for supports
motorMnt_play=3;
mnt_h=42+motorMnt_play;

m5_rad=4.5;
m5_h = thick-sThick+0.01;

//uncomment the following to use washers on m5 screws
m5_rad=6.01;
m5_h = thick-sThick+1.25;

//arc support calcs
L1=(pow(mnt_h-thick,2) - pow(screwLand_l,2) + (2*(mnt_h-thick)*screwLand_l*tan(supportTop_a)))
	 / (2*(screwLand_l - (mnt_h-thick)*tan(supportTop_a)));
L=thick+L1+screwLand_l;
h= (L1+screwLand_l)*tan(supportTop_a);
H=h+mnt_h;
R=sqrt(pow(h,2)+pow(L1+screwLand_l,2));
a_sector=abs(asin(L1/R)-asin((L-thick)/R));
num_sides = ceil(15*360/a_sector);	//keeps sides of arc at ~15 regardless of sector angle
echo(a_sector);
echo(num_sides);

//**end defs**


rotate([90,-90,0])
yMotorMnt();


module yMotorMnt(){
	difference(){
		union(){
			cube([thick,mnt_h,beam_sep+extrusion_w]);
			cube([thick+screwLand_l,thick,beam_sep+extrusion_w]);
			cube([thick+screwLand_l,mnt_h,thick-.5]);
			translate([0,0,beam_sep+extrusion_w-thick+0.5]) cube([thick+screwLand_l,mnt_h,thick-.5]);
		}

		//motor mounting holes
		translate([31,42/2,(beam_sep+extrusion_w)/2]) rotate([0, 0, 180])  rotate([0, 90, 0]) nema17(places=[1,1,1,1], holes=true, shadow=28, head_clearance=35, $fn=15, h=30,motor_play=motorMnt_play);
		//flange hole
		translate([-0.1,42/2,(beam_sep+extrusion_w)/2]) rotate([0, 90, 0]) 
		hull(){
			cylinder(r=12,h=thick+0.2);
			translate([0,motorMnt_play,0]) cylinder(r=12,h=thick+0.2);
		}

		//belt pass hole
		translate([thick+beltPass_w/2,thick/2,(beam_sep+extrusion_w)/2]) cube([beltPass_w,thick,beltPass_h],center=true);

		//mount holes
		translate([s1x,-0.1,extrusion_w/2]) rotate([-90, 0, 0]) cylinder(r=m5_diameter/2,h=thick+0.2);
		translate([s2x,-0.1,extrusion_w/2]) rotate([-90, 0, 0]) cylinder(r=m5_diameter/2,h=thick+0.2);
		translate([s1x,-0.1,beam_sep+extrusion_w/2]) rotate([-90, 0, 0]) cylinder(r=m5_diameter/2,h=thick+0.2);
		translate([s2x,-0.1,beam_sep+extrusion_w/2]) rotate([-90, 0, 0]) cylinder(r=m5_diameter/2,h=thick+0.2);

		//m5 washer/screw cutouts
		translate([s1x,sThick,extrusion_w/2]) rotate([-90, 0, 0]) cylinder(r=m5_rad,h=m5_h);
		translate([s2x,sThick,extrusion_w/2]) rotate([-90, 0, 0]) cylinder(r=m5_rad,h=m5_h);
		translate([s1x,sThick,beam_sep+extrusion_w/2]) rotate([-90, 0, 0]) cylinder(r=m5_rad,h=m5_h);
		translate([s2x,sThick,beam_sep+extrusion_w/2]) rotate([-90, 0, 0]) cylinder(r=m5_rad,h=m5_h);
		

		//side suport cutout
		translate([L,H,-0.1])  cylinder(r=R,h=beam_sep+extrusion_w+0.2,$fn=num_sides);
	}
	


}