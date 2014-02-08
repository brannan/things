union() {

	linear_extrude(height=3){
		import("joe-underlined.dxf");
	}

	linear_extrude(height=6){
		import("joe.dxf");
	}

}