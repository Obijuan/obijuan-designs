//---------------------------------------------------------------------------------------------------------
//-- Prusa z-endstop height regulator.
//--  You can easily change the initial home z-height with a screw
//-- Fine tune you initial z-height easily!
//--------------------------------------------------------------
//-- (c) Juan Gonzalez-Gomez (Obijuan)  juan@iearobotics.com.  July-2012
//-- Released under the GPL license
//---------------------------------------------------------------------------------------------------------- 

//----------------------------
//-- Clip parameters
//-----------------------------
thickness = 3;
lz_clip = 7.4;
lx_clip = 16.8;
ly_clip = 16;

//--- Extra distance for the differences
extra=2;

//------------------------------
//-- Arm parameters
//-------------------------------

//-- Drill distance. Where the screw should be located
//-- chage it according to your needs
dy = 15.5;

nut_box_side = 10;
nut_box_hi = 5;
nut_dia = 6.3;
nut_hi = 2.5;
M3_drill=3.2;

//-- The arm
module arm(add_nut=true)
{
  la_ly = dy + nut_box_side/2;

  //-- Rotate
  rotate([-90,0,0])

  //-- The design is on the xy plane
  difference() {
    translate([0, -la_ly/2,0])
      cube([nut_box_side, la_ly, nut_box_hi],center=true);

    //-- M3 Drill
    translate([0, -dy, 0])
      cylinder(r=M3_drill/2, h=nut_box_hi+extra, center=true, $fn=10);

    if (add_nut) {
      //-- M3 hex nut
       translate([0, -dy, nut_box_hi+extra/2 - nut_hi])
        cylinder(r=nut_dia/2, h=nut_box_hi+extra, center=true, $fn=6);
    }
  }
}

//----------------------
//-- Clip
//----------------------
module clip() {
  translate([0,0,lz_clip/2])
  difference() {
    //-- Exterior cube
    cube([lx_clip+2*thickness, ly_clip+thickness, lz_clip ],center=true);

    //-- Interior cube
    color("blue")
      translate([0, -(extra+thickness)/2, 0])
      cube([lx_clip, ly_clip+extra, lz_clip+extra],center=true);
  }
}

//-------------
//-- Main
//-------------

union() {

  //-- Clip
  clip();

  //-- Top arm
  translate([-nut_box_side/2 - lx_clip/2
                  ,-nut_box_hi/2 + ly_clip/2+thickness/2 - thickness,0])
    arm();

  //-- Bottom arm
  translate([-nut_box_side/2 - lx_clip/2 
                 ,nut_box_hi/2 - ly_clip/2-thickness/2,
                 0])
    arm(add_nut=false);
}

