union() {

linear_extrude(height=3){
	import("cece-underlined.dxf");
}

linear_extrude(height=9){
	import("cece.dxf");
}

}

translate([0,40,0])
union() {

linear_extrude(height=3){
	import("joe-underlined.dxf");
}

linear_extrude(height=9){
	import("joe.dxf");
}

}