// PRUSA Mendel  
// GNU GPL v2
// Z threaded rod constraint

//include <configuration.scad>
m8_diameter = 8.2;
m10_diameter = 10.2;
outer_diameter = m8_diameter/2+3.3;
shaft_separation = 30;
bearing_od = 22.6;
bearing_id = m8_diameter;
bearing_rodhole_d = bearing_id + 3;

module origclamp(){
  difference(){
    union(){ // body
      translate([outer_diameter, outer_diameter, 0])
			cylinder(h =15, r = outer_diameter, $fn = 20);
      translate([outer_diameter, 0, 0])
			cube([17.5,15,15]);
    }


    translate([9, outer_diameter/2+1, -.1])cube([18,05,20]); // cut for clamp
    translate([outer_diameter, outer_diameter, -0.1]) 
		cylinder(h =20, r = m10_diameter/2, $fn = 18);
    translate([17, 17, 7.5]) rotate([90, 0, 0]) 
		cylinder(h =20, r = m3_diameter/2, $fn = 10);
  }
}


difference()
{

  union()
  {
    translate([-outer_diameter,-outer_diameter,0]) origclamp();
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

