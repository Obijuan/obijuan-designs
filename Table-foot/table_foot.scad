//--------------------------------------------------------------
//-- Parametric table foot
//-- The foot consist of two three parts: a cylindrical body, a hole on the top,
//--   and the O-ring on the bottom
//--------------------------------------------------------------
//-- (c) Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//--  Nov-2012
//---------------------------------------------------------------
//-- GPL license
//---------------------------------------------------------------

//------- User parameters

//-- Foot body
foot_diam = 40;       //-- Foot diameter
foot_hi   = 10;       //-- Foot height


//-- Top hole (optional)
top_hole_diam = 18;   //-- Diameter of the top hole (0 if not needed)
top_hole_depth = 5;

//-- Bottom O-ring
oring_idiam = 21;       //-- O-ring internal diameter
oring_diam = 3;         //-- O-ring section diameter

//-- Lenght of the top hole
temp_hi = top_hole_depth + 20;


difference() {

  //-- Foot body
  cylinder(r = foot_diam/2, h = foot_hi, center=true);

  //-- Top hole
  translate([0, 0, -temp_hi/2 - foot_hi/2 + top_hole_depth])
    cylinder(r = top_hole_diam/2, h = top_hole_depth+20, center = true);

  //-- Bottom O-ring 
  translate([0,0, foot_hi/2-oring_diam/4])
    rotate_extrude($fn=30)
     translate([oring_idiam/2 + oring_diam/2,0,0])
     circle(r = oring_diam/2, center=true, $fn=8);
}


