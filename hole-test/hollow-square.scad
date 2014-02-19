

//linear_extrude(height=50, twist=360, slices=200, scale=.5) 
//import("hollow-square.dxf");

difference(convexity=10){
rotate_extrude() {
translate([10,0,0])
import("hollow-square.dxf");
}
translate([0,0,-1])
cube(50);
}
