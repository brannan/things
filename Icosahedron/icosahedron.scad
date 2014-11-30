$fn = 50;

translate([0,0,20])
minkowski(){
	regularIcosohedron(edgeLength = 30);
	sphere(20);
	
}

module regularIcosohedron(edgeLength = 2){
	
	phi = (1 + pow(5,.5))/2;
	factor = edgeLength / 2;
	scale([factor, factor, factor]){
		rotate([-atan(phi/(phi-1)), 0, 0])
		translate([0,-1,phi])
		polyhedron(
			points=[ 
				[0, 1, phi],   //0 -- top edge
				[0, -1, phi],  //1 -- top edge
				[0, 1, -phi],  //2 -- bottom edge
				[0, -1, -phi], //3 -- bottom edge
		
				[1, phi, 0], //4  -- y max
				[-1, phi, 0], //5 -- y max
				[1, -phi, 0], //6 
				[-1, -phi, 0],//7
		
				[phi, 0, 1], //8  -- top of right vertical
				[phi, 0, -1], //9 -- bottom of right vertical
				[-phi, 0, 1], //10 -- top of left vertical
				[-phi, 0, -1] //11 -- bottom of left vertical
			],
			faces = [
				[1, 0, 8],     // right top
				[1, 8, 6], 
				[1, 6, 7],
				[1, 7, 10],
				[0, 1, 10],    // left top
				[0, 10, 5], 
				[0, 5, 4],
				[0, 4, 8],
				[8, 4, 9],
				[ 8, 9, 6],
				[6, 9, 3],
				[6, 3, 7],
				[7, 3, 11], 
				[7,11,10],
				[10, 11, 5],
				[4, 5, 2],
				[4, 2, 9],
				[9, 2, 3],
				[3, 2, 11],
				[2, 5, 11]
			]
		);
	}
	
}

