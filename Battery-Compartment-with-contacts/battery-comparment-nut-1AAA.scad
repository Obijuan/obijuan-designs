/***************************************************************
 Battery compartment with electrical connections
  (c) 2010 Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
   This design is derived from the Battery comparment generator
   (c) Nikolaus Gradwohl (guru (at) local-guru.net)
    http://www.thingiverse.com/thing:5051
 -----------------------------------------------------------
 In this preliminary version, only 1 AAA battery is used for
 testing pourposes.
  Two nuts are embedded into the batettery compartment. Two 
screws are inserted from the outside and touch the battery
-----------------------------------------------------------
GPL LICENCE
****************************************************************/

//-- Battery sizes. In this design only AAA bateries are used

AA = [ 14.5, 50.5 ];
AAA = [ 10.5,44.5 ];
C = [ 26.2, 50 ];
D = [ 34.2, 61.5 ]; 

// CHOOSE BATTERY TYPE AND COUNT 
typ = AAA;
num =1;

//-- Nut parameters
nut_h = 2.5;
nut_radius = 6.4/2;
nut_drill = 3.1;

//-- Battery dimensions: width, height and length

w=typ[0];
h=w;
l=typ[1];

//-- Battery compartment thickness

bottom_thick=2;
fr_thick=3.5;    //-- Front and rear parts
side_thick=2;    //-- Side part


//-- Build the thing!
difference() {

 //-- The mother cube
 translate([0,0,-bottom_thick/2])
  cube(size=[l+2*fr_thick,w+2*side_thick,h+bottom_thick],center=true);

  //-- Remove half-top-interior part
   translate([0,0,h/2])
     cube(size=[l,w,h],center=true);

  //-- Create the room for the battery
   rotate([0,90,0])
    cylinder(r=w/2, h=l-0.01, center=true, $fn=50); 

   //-- Create the nut drills
   rotate([0,90,0])
   cylinder(center=true,h=l+20, r=nut_drill/2, $fn=50, center=true);

   //-- Create the room for embbeding the nuts
   rotate([0,90,0]) 
    cylinder(h=l+2*nut_h, r=nut_radius, $fn=6, center=true);

}

//-- Just for testing pourposes
* rotate([0,90,0])
    cylinder(r=w/2, h=l-0.01, center=true, $fn=50); 


