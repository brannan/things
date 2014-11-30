/*

makes a sphere decorated with
patterns that are arranged to
display icosahedral symmetry

pcm

*/





/*

 patterns are called indirectly
through the decor_xx modules -

decor_xx(x,y,z,scale,hthick,hrot,radius)

where x,y,and z are the coordinates on the unit sphere
that determine the position and orientation of the decoration
scale is scale factor for decoration
hthick is thickness of decoration in mm
hrot is rotation about z axis before pattern is placed
radius is distance from center of sphere to place decoration

decor_14 calls cylinder(h=hthick,r=sc,center=true,$fn=96);
decor_555 calls rosette_03(sc,hthick,rsphere=25,hrot)
decor_555a calls rosette_03(sc,hthick,rsphere=35,hrot)
decor_666 calls rosette_05(sc,hthick,rsphere=25,hrot)
decor_666a calls rosette_05(sc,hthick,rsphere=35,hrot)
*/


 /*

 output is one of four spheres

 if i = 1   output is 25 mm sphere decorated with a 3 ray rosette
            sphere has outline of dodecahedron

 if i = 2   output is 35 mm truncated sphere decorated with a
            3 ray rosette - sphere has outline of dodecahedron

 if i = 3   output is 25 mm sphere decorated with a 5 ray rosette
            sphere has outline of icosahedron

 if i = 4   output is 35 mm truncated sphere decorated with a
            5 ray rosette - sphere has outline of icosahedron

*/


i = 1;
//i = 2;
//i = 3;
//i = 4;


gr =  (1 + sqrt(5))/2;
rgr = 1/gr;
norm = sqrt(1+gr*gr);

// 22.23876 = atan(sqrt(3)*(sqrt(5)-2))
//   thanks to d j moews for deriving  this angle

   ang2 = 22.23876;
   ang1 = 60 - ang2;





if (i == 1)



difference()
{
sphere(r=25,center=true,$fn=96);

     decor_555(   1.0/sqrt(3),  1.0/sqrt(3),   1.0/sqrt(3),  .45,18,-ang1,25.6);
     decor_555(   1.0/sqrt(3),   1.0/sqrt(3),  -1.0/sqrt(3),  .45,18,-ang2,25.6);
     decor_555(   1.0/sqrt(3),  -1.0/sqrt(3),   1.0/sqrt(3),  .45,18, ang1,25.6);
     decor_555(   1.0/sqrt(3),  -1.0/sqrt(3),  -1.0/sqrt(3),  .45,18, ang2,25.6);
     decor_555(  -1.0/sqrt(3),   1.0/sqrt(3),   1.0/sqrt(3),  .45,18, ang1,25.6);
     decor_555(  -1.0/sqrt(3),   1.0/sqrt(3),  -1.0/sqrt(3),  .45,18, ang2,25.6);
     decor_555(  -1.0/sqrt(3),  -1.0/sqrt(3),   1.0/sqrt(3),  .45,18,-ang1,25.6);
     decor_555(  -1.0/sqrt(3),  -1.0/sqrt(3),  -1.0/sqrt(3),  .45,18,-ang2,25.6);

     decor_555(   0.00000,   rgr/sqrt(3)    ,   gr/sqrt(3)     ,.45,18,60,25.6);
     decor_555(   0.00000,   rgr/sqrt(3)    ,  -gr/sqrt(3)     ,.45,18,0,25.6);
     decor_555(   0.00000,  -rgr/sqrt(3)    ,   gr/sqrt(3)     ,.45,18,60,25.6);
     decor_555(   0.00000,  -rgr/sqrt(3)    ,  -gr/sqrt(3)     ,.45,18,0,25.6);

     decor_555(   rgr/sqrt(3)    ,   gr/sqrt(3)     ,   0.00000,.45,18,30,25.6);
     decor_555(   rgr/sqrt(3)    ,  -gr/sqrt(3)     ,   0.00000,.45,18,-30,25.6);
     decor_555(  -rgr/sqrt(3)    ,   gr/sqrt(3)     ,   0.00000,.45,18,-30,25.6);
     decor_555(  -rgr/sqrt(3)    ,  -gr/sqrt(3)     ,   0.00000,.45,18,30,25.6);

     decor_555(   gr/sqrt(3)     ,   0.00000,   rgr/sqrt(3)    ,.45,18, 0,25.6);
     decor_555(   gr/sqrt(3)     ,   0.00000,  -rgr/sqrt(3)    ,.45,18,60,25.6);
     decor_555(  -gr/sqrt(3)     ,   0.00000,   rgr/sqrt(3)    ,.45,18, 0,25.6);
     decor_555(  -gr/sqrt(3)     ,   0.00000,  -rgr/sqrt(3)    ,.45,18,60,25.6);

sphere(r=23,center=true,$fn=96);

}




else

if (i == 2)


translate ([0,0,29])

 union()

{

// add base ring

 difference()
{
 decor_14(0,0,-1,22,2,0,28);

translate([0,0,1])
 decor_14(0,0,-1,19,4,0,28);
}

difference()
{
sphere(r=35,center=true,$fn=96);

// subtracts decorations

      decor_555a(   1.0/sqrt(3),  1.0/sqrt(3),   1.0/sqrt(3),  .6,25,-ang1,35.7);
     decor_555a(   1.0/sqrt(3),   1.0/sqrt(3),  -1.0/sqrt(3),  .6,25,-ang2,35.7);
     decor_555a(   1.0/sqrt(3),  -1.0/sqrt(3),   1.0/sqrt(3),  .6,25, ang1,35.7);
     decor_555a(   1.0/sqrt(3),  -1.0/sqrt(3),  -1.0/sqrt(3),  .6,25, ang2,35.7);
     decor_555a(  -1.0/sqrt(3),   1.0/sqrt(3),   1.0/sqrt(3),  .6,25, ang1,35.7);
     decor_555a(  -1.0/sqrt(3),   1.0/sqrt(3),  -1.0/sqrt(3),  .6,25, ang2,35.7);
     decor_555a(  -1.0/sqrt(3),  -1.0/sqrt(3),   1.0/sqrt(3),  .6,25,-ang1,35.7);
     decor_555a(  -1.0/sqrt(3),  -1.0/sqrt(3),  -1.0/sqrt(3),  .6,25,-ang2,35.7);

     decor_555a(   0.00000,   rgr/sqrt(3)    ,   gr/sqrt(3)     ,.6,25,60,35.7);
     decor_555a(   0.00000,   rgr/sqrt(3)    ,  -gr/sqrt(3)     ,.6,25,0,35.7);
     decor_555a(   0.00000,  -rgr/sqrt(3)    ,   gr/sqrt(3)     ,.6,25,60,35.7);
     decor_555a(   0.00000,  -rgr/sqrt(3)    ,  -gr/sqrt(3)     ,.6,25,0,35.7);

     decor_555a(   rgr/sqrt(3)    ,   gr/sqrt(3)     ,   0.00000,.6,25,30,35.7);
     decor_555a(   rgr/sqrt(3)    ,  -gr/sqrt(3)     ,   0.00000,.6,25,-30,35.7);
     decor_555a(  -rgr/sqrt(3)    ,   gr/sqrt(3)     ,   0.00000,.6,25,-30,35.7);
     decor_555a(  -rgr/sqrt(3)    ,  -gr/sqrt(3)     ,   0.00000,.6,25,30,35.7);

     decor_555a(   gr/sqrt(3)     ,   0.00000,   rgr/sqrt(3)    ,.6,25, 0,35.7);
     decor_555a(   gr/sqrt(3)     ,   0.00000,  -rgr/sqrt(3)    ,.6,25,60,35.7);
     decor_555a(  -gr/sqrt(3)     ,   0.00000,   rgr/sqrt(3)    ,.6,25, 0,35.7);
     decor_555a(  -gr/sqrt(3)     ,   0.00000,  -rgr/sqrt(3)    ,.6,25,60,35.7);

 decor_14(0,0,-1,20,16,0,28);

sphere(r=33,center=true,$fn=96);

 } }









else

if (i == 3)

difference()
{
sphere(r=25,center=true,$fn=96);

                 decor_666(  0, 1/norm, gr/norm,.47,20,36,25.6);
                 decor_666(0, -1/norm, gr/norm,.47,20,36,25.6);
                decor_666(  0, 1/norm, -gr/norm,.47,20,0,25.6);
                 decor_666(0, -1/norm, -gr/norm,.47,20,0,25.6);

                 decor_666(  1/norm, gr/norm, 0,.47,20,-18,25.6);
                 decor_666(-1/norm, gr/norm, 0,.47,20,18,25.6);
                 decor_666( 1/norm, -gr/norm, 0,.47,20,18,25.6);
                 decor_666(-1/norm,-gr/norm,0,.47,20,-18,25.6);

                 decor_666(gr/norm, 0, 1/norm,.47,20,0,25.6);
                 decor_666(gr/norm, 0, -1/norm,.47,20,36,25.6);
               decor_666(-gr/norm, 0, 1/norm,.47,20,0,25.6);
               decor_666(-gr/norm, 0, -1/norm,.47,20,36,25.6);

sphere(r=23,center=true,$fn=96);

}






else

if (i ==4)

translate ([0,0,29])

 union()

{

// add base ring

 difference()
{
 decor_14(0,0,-1,22,2,0,28);

translate([0,0,1])
 decor_14(0,0,-1,19,4,0,28);
}

difference()
{
sphere(r=35,center=true,$fn=96);

// subtracts decorations

             decor_666a(  0, 1/norm, gr/norm,.63,20,36,35.5);
                 decor_666a(0, -1/norm, gr/norm,.63,20,36,35.5);
                decor_666a(  0, 1/norm, -gr/norm,.63,20,0,35.5);
                 decor_666a(0, -1/norm, -gr/norm,.63,20,0,35.5);

                 decor_666a(  1/norm, gr/norm, 0,.63,20,-18,35.5);
                 decor_666a(-1/norm, gr/norm, 0,.63,20,18,35.5);
                 decor_666a( 1/norm, -gr/norm, 0,.63,20,18,35.5);
                 decor_666a(-1/norm,-gr/norm,0,.63,20,-18,35.5);


                 decor_666a(gr/norm, 0, 1/norm,.63,20,0,35.5);
                 decor_666a(gr/norm, 0, -1/norm,.63,20,36,35.5);
               decor_666a(-gr/norm, 0, 1/norm,.63,20,0,35.5);
               decor_666a(-gr/norm, 0, -1/norm,.63,20,36,35.5);

           decor_14(0,0,-1,20,16,0,28);

          sphere(r=33,center=true,$fn=96);

} }







module decor_14(x2,y2,z2,sc,hthick,htrans,r2)
{
translate(v=[r2*x2,r2*y2,r2*z2])
rotate(a = [-acos(z2/sqrt(x2*x2+y2*y2+z2*z2)), 0, -atan2(x2, y2)])
translate([0,0,htrans])
   cylinder(h=hthick,r=sc,center=true,$fn=96);
}


module decor_555(x2,y2,z2,sc,hthick,htrans,r2)
{
translate(v=[r2*x2,r2*y2,r2*z2])
rotate(a = [-acos(z2/sqrt(x2*x2+y2*y2+z2*z2)), 0, -atan2(x2, y2)])
rosette_03(sc,hthick,25,htrans);
}



module decor_555a(x2,y2,z2,sc,hthick,htrans,r2)
{
translate(v=[r2*x2,r2*y2,r2*z2])
rotate(a = [-acos(z2/sqrt(x2*x2+y2*y2+z2*z2)), 0, -atan2(x2, y2)])
rosette_03(sc,hthick,35,htrans);
}



module decor_666(x2,y2,z2,sc,hthick,htrans,r2)
{
translate(v=[r2*x2,r2*y2,r2*z2])
rotate(a = [-acos(z2/sqrt(x2*x2+y2*y2+z2*z2)), 0, -atan2(x2, y2)])
rosette_05(sc,hthick,25,htrans);
}



module decor_666a(x2,y2,z2,sc,hthick,htrans,r2)
{
translate(v=[r2*x2,r2*y2,r2*z2])
rotate(a = [-acos(z2/sqrt(x2*x2+y2*y2+z2*z2)), 0, -atan2(x2, y2)])
rosette_05(sc,hthick,35,htrans);
}




module rosette_03(scx,ht,rr,htrans)
{
rotate([0,180,0])
intersection()
{
translate ([0,0,rr])
difference()
{
sphere(r=rr,center=true,$fn=96);
sphere(r=rr-1.5,center=true,$fn=96);
}
scale(scx,scx,1)
rotate([0,0,htrans])
 linear_extrude(height=ht)
import ("rosette_03.dxf");

}

}


module rosette_05(scx,ht,rr,htrans)
{
rotate([0,180,0])
intersection()
{
translate ([0,0,rr])
difference()
{
sphere(r=rr,center=true,$fn=96);
sphere(r=rr-1.5,center=true,$fn=96);
}
scale(scx,scx,1)
rotate([0,0,htrans])
 linear_extrude(height=ht)
import ("rosette_05.dxf");

}

}


