// ellipsoid puzzle

//pieceR();// pieceR() and pieceL() are identical to piece() if s=1 (sphere)
//pieceL();
assembly();// animate for exploded view

R=30; // radius of sphere
tol=0.25;// tolerance to allow looser fit
s=0.7;// hieght scale
f=1.15;// factor to adjust internal dimensions to external
$fa=6;// sphere resolution
v1=10*[-1.15,-1,-2];
v2=10*[1.15,-1,-2];

d=R*f;
x=d*cos(45);
theta=asin(sqrt(2)/sqrt(3));

module assembly(){
rotate([-90,0,0])translate($t*v1)pieceR();
rotate([-90,0,120])translate($t*v1)pieceR();
rotate([-90,0,-120])translate($t*v1)pieceR();
rotate([90,0,0])translate($t*v2)pieceL();
rotate([90,0,120])translate($t*v2)pieceL();
rotate([90,0,-120])translate($t*v2)pieceL();
}

module pieceR(){
rotate([90,0,0])scale([1,1,s])rotate([0,theta,0])rotate([0,0,45])rotate([45,90,90])piece();
}

module pieceL(){
rotate([-90,0,0])scale([1,1,s])rotate([0,theta,0])rotate([0,0,45])rotate([45,90,-90])piece();
}

module piece(){
rotate([-90,0,0])
difference(){
	sphere(r=R);
	//cube(size=2*d-1,center=true);
	translate([0,0,-d])
		cube(size=[d,2*d,2*d+tol],center=true);
	translate([0,-d,0])
		cube(size=[d,2*d+tol,2*d],center=true);
	rotate([-45,0,0])
		translate([0,0,-2*d])
			cube(size=4*d,center=true);
	translate([0,0,d+x])
		cube(size=2*d+tol,center=true);
	translate([0,d+x,0])
		cube(size=2*d+tol,center=true);
	translate([d/2,0,0])
		rotate([-45,0,0])rotate([0,45,0])
			cube(size=[x+tol,2*d,x+tol],center=true);
	translate([-d/2,0,0])
		rotate([-45,0,0])rotate([0,45,0])
			cube(size=[x+tol,2*d,x+tol],center=true);
	translate([0,-x+2*tol,0])
		rotate([45,0,0])translate([0,0,d/2])
			cube(size=[d,2*d,d],center=true);
	translate([0,0,-x+2*tol])
		rotate([45,0,0])translate([0,0,-d/2])
			cube(size=[d,2*d,d],center=true);
}}