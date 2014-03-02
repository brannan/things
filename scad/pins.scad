use <Pin_Connectors_V3/pins.scad>;

tolerance = 0.3;
  
translate([-10, 0, 0]) pinpeg(h=20);
translate([20, 20, 0]) pintack(h=20);

translate ([-20, -20, 0]) cube(20);