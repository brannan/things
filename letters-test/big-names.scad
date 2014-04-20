thickness = 9;

scale([1.5,1.5,1.5])
translate([0,0,thickness])
rotate([0,180,0]) {

linear_extrude(height=thickness){
	import("cece-underlined.dxf");
}

translate([0,40,0])
linear_extrude(height=thickness){
	import("joe-underlined.dxf");
}

}

