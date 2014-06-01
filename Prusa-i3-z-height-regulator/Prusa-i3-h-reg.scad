//------------------------------------------------------------------------
//-- Prusa i3 height regulator
//-  by Obijuan (Juan Gonzalez-Gomez). April - 2013
//-------------------------------------------------------------------------
//-- Released under the GPL license
//------------------------------------------------------------------------

//-- Part parameters

//-- Main body
arm_lx = 10;
arm_ly = 30;
arm_lz = 9.5;

//-- Rear part
cutout_ly = 17;
cutout_lz = 4.5;

//-- Nut and drill parameters
nut_box_side = 10;
nut_box_hi = 5;
nut_dia = 6.3;
nut_hi = 2.5;
M3_drill=3.2;

drill_distance = 3;

extra = 10;

//-- The part is very simple: just a main body with a shorter rear part 
difference() {

  //-- Main body
  cube([ arm_lx, arm_ly, arm_lz], center = true);

  //-- Remove from the rear part
  translate([0,
           -cutout_ly/2 + arm_ly/2 + 0.1, 
           -cutout_lz/2 + arm_lz/2 + 0.1])
    cube([arm_lx + extra, cutout_ly, cutout_lz], center=true);


  //-- M3 Drill
  translate([0, -arm_ly/2 + M3_drill/2 + drill_distance, 0])
    cylinder(r=M3_drill/2, h=nut_box_hi+extra, center=true, $fn=10);
  
  //-- M3 nut space
  translate([0,
             -arm_ly/2 + M3_drill/2 + drill_distance,
             -nut_hi/2 + arm_lz/2 + 0.1])   
  cylinder(r=nut_dia/2, h=nut_hi, center=true, $fn=6);
}


