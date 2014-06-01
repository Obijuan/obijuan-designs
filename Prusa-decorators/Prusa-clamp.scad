//-----------------------------------------------------------------
//-  Prusa decorators clamp
//--  (c) Juan Gonzalez Gomez (Obijuan) juan@iearobotics.com, 
//--  March 2012
//-----------------------------------------------------------------
//-- Glue this clamp to other objects so that you can put them
//-- in your Prusa threaded rods, for decorating your 3D printer!
//-- You can glue it easily using acetone
//-------------------------------------------------------------------

//-- Clamp parameters
rod_diam = 8;
clamp_diam = rod_diam + 5;
open_angle = 80;
width = 8;
base_lx = clamp_diam;
base_ly = 2;
base_lz = width;

//-- Internal parameters
open_x = 2*(rod_diam/2)*sin(open_angle/2);

module Prusa_clamp() 
{
  union() {

    //-- Clamp
    difference() {
      //-- outer cylinder
      cylinder(r=clamp_diam/2, h=width);

      //-- Inner cylinder
      cylinder(r=rod_diam/2, h=width+10,center=true);

      //-- Break the ring substracting a cube
      translate([-open_x/2,0,-1])
      cube([open_x, clamp_diam+10, width+2]);
    }

    //-- clamp Base
    translate([0,-clamp_diam/2,base_lz/2])
    cube([base_lx, base_ly, base_lz], center=true);
  }
}

Prusa_clamp();



