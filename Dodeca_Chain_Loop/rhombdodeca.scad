// rhombic dodecahedra chain

L=40;// height of module
w=0.5;// fraction of face to hollow
d=16.5;// extruder offset
f=1.03;// fudge fit
n=28;// number in circle (minimum with w=0.5)

s=w/2+0.5;

//rotate([0,0,90]) scale(0.4)loop(6); // this is the default
//scale(0.4)ring(n);
///halfchain(3);
//scale(0.4) translate([-d,0,0])chain(6);
scale(0.5) translate([-d,0,0]) chain(4);
//color([0,1,0])translate([-2*d,0,0.1])halfchain(3);
%cube([206,260,1],center=true);

module loop(p){
translate([-p*d,0,0])ring(n/2);
translate([0,2*d*f/sin(360/n),0])chain(p);
rotate([0,0,180]){translate([-p*d,0,0])ring(n/2);
	translate([0,2*d*f/sin(360/n),0])chain(p);}
}

module ring(m){
for(i=[0:(m-1)]){
	rotate([0,0,i*360/n])translate([0,2*d*f/sin(360/n),0])openRhomb();
}}

module chain(n){
translate([-(n-1)*1*d+d,0,0])for(i=[1:n]){
	translate([(i-1)*2*d,0,0])openRhomb();
}}

module halfchain(n){
translate([-(n-1)*2*d+d,0,0])for(i=[1:n]){
	translate([(i-1)*4*d,0,0])openRhomb();
}}

module openRhomb(){
render()
rotate([0,0,acos(1/3)/2])translate([0,0,L/2])rotate([-45,0,90])
difference(){
	rhombDodeca(1);
	rhombDodeca(s);
	rotate([90,0,0])rhombDodeca(s);
	rotate([0,90,0])rhombDodeca(s);
}}

module rhombDodeca(s){
intersection(){
	rotate([0,0,45])cube(L*[1/s,1/s,2],center=true);
	rotate([0,45,0])cube(L*[s,2,s],center=true);
	rotate([45,0,0])cube(L*[2,s,s],center=true);
}}