// *******************************************************
// *   Parametric thumb wheel                            *
// *   by Chris Garrett                                  *
// *   20-nov-2011                                       *
// *   Small changes by Juan Gonzalez-Gomez (Obijuan)    *
// *   31-Aug-2012                                       *
// *******************************************************


// *** Configuration variables ***
wheel_d = 25;    // Outer Diameter of the thumb wheel
wheel_h = 4;     // Height of the thumb wheel
hole_d = 3.2;    // Diameter of center hole
hex_sz = 6.4;      // Size of the hex (nut trap)
                 // An M4 nut fits perfectly in a 7mm hex opening made on my Prusa
hex_d = 3;       // Depth of the hex (set this < or = to wheel_h)
knurl_cnt = 12;  // Number of cutouts around the wheel
knurl_d = 4;     // Diameter of the cutouts

//-- drills
drill_M3 = 3.2;

//-- captive Nuts
nut_h = 2.6;
nut_radius = 6.4/2;


// *** Code area ***

// The thumb wheel 

difference() {
  //-- Base cylinder
  cylinder(h=wheel_h, r=wheel_d/2, $fn=50);

  //-- Cutouts
  for(i = [0:knurl_cnt-1]) {
   rotate(v=[0,0,1], a=i*360/knurl_cnt) 
     translate([0,wheel_d/2+knurl_d/4,-1]) 
       cylinder(h=wheel_h+2, r=knurl_d/2, $fn=50);
  }

  //-- Hex nut body
  translate([0,0,wheel_h-nut_h])
    cylinder(r=nut_radius, h=nut_h+1,$fn=6);

  //-- Hex nut drill
  translate([0,0,-1]) cylinder(h=wheel_h+2, r=hole_d/2, $fn=50);

}


