/* makes dxf rosette files
set i to number of rays
rcircle radius of circle at center
wray width of ray mm
lray length of ray mm

4,5,6,8,9,10,12,15 16 20,24
 are available for i

*/

rcircle =5;
lray = 35;
wray = 4;
xstart = 0;
ystart = 0;




  i=5;



projection(cut=true)


  if (i == 3)
     p3();
  else if (i == 4)
     p4();
  else if (i == 5)
     p5();
  else if (i == 6)
     p6();
  else if (i == 8)
     p8();
  else if (i == 9)
     p9();
  else if (i == 10)
     p10();
  else if (i == 12)
     p12();
  else if (i == 15)
     p15();
  else if (i == 16)
     p16();
  else if (i == 20)
     p20();
  else if (i == 24)
     p24();






module p20()
{
 linear_extrude(height=1)
 circle(r=rcircle,$fn=48);
for  ( i =[
         [0,0,18],[0,0,36],[0,0,54],
         [0,0,72],[0,0,90],[0,0,108],
         [0,0,126],[0,0,144],[0,0,162],
         [0,0,180],[0,0,198],[0,0,216],
         [0,0,234],[0,0,252],[0,0,270],
         [0,0,288],[0,0,306],[0,0,324],
         [0,0,342],[0,0,0,],
        ])
 {
          rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                    cube([wray,lray,1]);
   }
}



module p15()

{
    linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

          for  ( i =[
         [0,0,24],[0,0,48],[0,0,72],
         [0,0,96],[0,0,120],[0,0,144],
         [0,0,168],[0,0,192],[0,0,216],
         [0,0,240],[0,0,264],[0,0,288],
         [0,0,312],[0,0,336],[0,0,0],
        ])


 {
       rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                    cube([wray,lray,1]);
   }
}



module p9()

{
linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

          for  ( i =[
         [0,0,40],[0,0,80],[0,0,120],
         [0,0,160],[0,0,200],[0,0,240],
         [0,0,280],[0,0,320],[0,0,0],
        ])


 {

          rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                    cube([wray,lray,1]);

     }
}




module p10()

{
linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

          for  ( i =[
         [0,0,36],[0,0,72],[0,0,108],
         [0,0,144],[0,0,180],[0,0,216],
         [0,0,252],[0,0,288],[0,0,324],
         [0,0,0],
        ])


 {

          rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                    cube([wray,lray,1]);

     }
}


module p5()

{
  linear_extrude(height=1)
 circle(r=rcircle,$fn=48);


          for  ( i =[
         [0,0,72],[0,0,144],[0,0,216],
         [0,0,288],[0,0,0],
        ])


 {

          rotate(i)
        translate([xstart,ystart,0])
         translate([-wray/2,0,0])
                    cube([wray,lray,1]);
     }
}



p16();


module p16()

{
 linear_extrude(height=1)
 circle(r=rcircle,$fn=48);


for  ( i =[

         [0,0,22.5],[0,0,45],
         [0,0,67.5],[0,0,90],
         [0,0,112.5],[0,0,135],
         [0,0,157.5],[0,0,180],
         [0,0,202.5],[0,0,225],
         [0,0,247.5],[0,0,270],
         [0,0,292.5],[0,0,315],
         [0,0,337.5],[0,0,0],
        ])


 {

          rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                    cube([wray,lray,1]);
   }
}


module p6()

{
 linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

          for  ( i =[
         [0,0,60],[0,0,120],[0,0,180],
         [0,0,240],[0,0,300],[0,0,0],
        ])


 {
          rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                    cube([wray,lray,1]);
     }
}


module p24()

{
 linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

          for  ( i =[
         [0,0,15],[0,0,30],[0,0,45],[0,0,60],
         [0,0,75],[0,0,90],[0,0,105],[0,0,120],
         [0,0,135],[0,0,150],[0,0,165],[0,0,180],
         [0,0,195],[0,0,210],[0,0,225],[0,0,240],
         [0,0,255],[0,0,270],[0,0,285],[0,0,300],
         [0,0,315],[0,0,330],[0,0,345],[0,0,0],
        ])


 {

       rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                   cube([wray,lray,1]);
}
}



module p12()

{
 linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

          for  ( i =[
         [0,0,30],[0,0,60],
         [0,0,90],[0,0,120],
         [0,0,150],[0,0,180],
         [0,0,210],[0,0,240],
         [0,0,270],[0,0,300],
         [0,0,330],[0,0,0],
        ])


 {

       rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                   cube([wray,lray,1]);


     }
}



module p8()

{

 linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

for  ( i =[

         [0,0,45],[0,0,90],
         [0,0,135],[0,0,180],
         [0,0,225],[0,0,270],
         [0,0,315],[0,0,0],
        ])


 {
   rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                   cube([wray,lray,1]);
  }
}


module p4()

{

 linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

for  ( i =[

         [0,0,90],
         [0,0,180],
         [0,0,270],
         [0,0,0],
        ])


 {
   rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                   cube([wray,lray,1]);
  }
}



module p3()

{
 linear_extrude(height=1)
 circle(r=rcircle,$fn=48);

          for  ( i =[
        [0,0,120],
         [0,0,240],
          [0,0,0],
        ])


 {
          rotate(i)
        translate([xstart,ystart,0])
                    translate([-wray/2,0,0])
                    cube([wray,lray,1]);
     }
}



