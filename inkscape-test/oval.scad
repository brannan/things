difference() {
linear_extrude(height = 10) import("oval.dxf");
translate([0,0,18])
scale([1.1,1,1])
rotate([0,90,0])
linear_extrude(height = 16) import("oval.dxf");
}