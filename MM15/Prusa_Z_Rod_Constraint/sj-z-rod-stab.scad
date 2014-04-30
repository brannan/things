// PRUSA Mendel  
// GNU GPL v2
// Z threaded rod constraint

//include <configuration.scad>
m3_diameter = 3.25;
m3_nut_diameter = m3_diameter * 1.8;
m8_diameter = 8.2;
m10_diameter = 10.5;
outer_radius = m10_diameter/2+3.3; // default m8_diameter
shaft_separation = 30;
bearing_od = 22.6;
bearing_id = m8_diameter;
bearing_rodhole_d = bearing_id + 3;

module origclamp(){
  difference(){
    union(){ // body
      translate([outer_radius, outer_radius, 0])
			cylinder(h =15, r = outer_radius, $fn = 20);
      translate([outer_radius, 0, 0])
			cube([17.5,outer_radius * 2,15]); // default [17.5,15,15]
    }

    translate([9, outer_radius/2, -.1]) 
		cube([18, outer_radius, 20]); // cut for clamp
    translate([outer_radius, outer_radius, -0.1]) 
		cylinder(h =20, r = m10_diameter/2, $fn = 18);
    translate([17, 22, 7.5]) rotate([90, 0, 0]) 
		cylinder(h =30, r = m3_diameter/2, $fn = 10);
		
	translate([17, m10_diameter + 7, 7.5]) rotate([90, 0, 0])  
		cylinder(h =m3_diameter * .8, r = m3_nut_diameter/2, $fn = 6);
  }
}

difference() {

  union() {
    translate([-outer_radius,-outer_radius,0]) origclamp();
    translate([-shaft_separation,0,0]) {
      cylinder(r=(bearing_od/2) + 3, h=15); // outer bearing
     translate([-m8_diameter/2,-2.5,0]) // connect bearing to clamp
		cube([28,5,15]); // was [39,5,15]
    }
  }

  translate([-shaft_separation, 0,0]) {
    translate([0,0,5]) cylinder(r=bearing_od/2, h=15);
    translate([0,0,-1]) cylinder(r=bearing_rodhole_d/2, h=20);
  }
}

//translate([5,-5,0]) #cube(10); // test clamp width
