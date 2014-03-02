union(){
%translate([-10, 0, 0]) sphere(r=5);
rotate([0,90,0]) cylinder(r=2, h=20, center=true);
%translate([10, 0, 0]) sphere(r=5);
}