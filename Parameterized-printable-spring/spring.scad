//---------------------------------------------------------------------------------------------
//-- Printable parameterized spring
//-- (c) Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//-- April-2012
//---------------------------------------------------------------------------------------------
//-- Proof of concept
//---------------------------------------------------------------------------------------------


//-- Spring folds. It is implemented by means of arcs
//-- It consist of two parts: the arc and the arms
//-- r = Inner arc radius
//-- th = thickness
//-- w = width
//-- arc_len = Length of the two arms
module spring_arc(arm_len, r, th, w)
{
  //-- outer radius
  or = r + th; 

  translate([arm_len,or,0])
  union() {

    //-- Arc
    difference() {
      cylinder(r=or, h=w, center=true, $fn=20);

      translate([-or,0,0])
          cube([2*or, 2*or+2, w+2],center=true);

      cylinder(r=r, h=w+10, center=true, $fn=20);

    }

    //-- Arms
    translate([-arm_len/2,th/2+r,0])
      cube([arm_len,th,w],center=true);

    translate([-arm_len/2,-th/2-r,0])
      cube([arm_len,th,w],center=true);
  }
}

//---------------------------------------------------------
//-- This module creates the spring, with a square section
//-- and no drills
//-- Spring parameters:
//--  -fid: Fold inner diameter
//--  -th: thickness 
//--  -folds: Number of folds: starting from 1
//--  -lx,lz: Spring length on x and z axes respectively
//--------------------------------------------------------
module parametric_spring_common(fid=3, th=2, folds=8, lx=20, lz=20)
{

  step = 2*(fid + th);
  arm_len = (lx - fid - 2*th)/2;
  ly = folds*step/2;

  translate([0,-ly/2,0])
  union() {

    //-- Right folds
    for (i=[1:ceil(folds/2)]) {
      translate([0, (i-1)*step,0])
        spring_arc(arm_len=arm_len, r=fid/2, th=th, w=lz);
    }

    //-- left folds
    if (folds>1) {
      for (i=[1:floor(folds/2)]) {
        translate([0, (i-1)*step+step/2,0])
          mirror([1,0,0])
          spring_arc(arm_len=arm_len, r=fid/2, th=th, w=lz);
      }
    }

    translate([-lx/4,th/2,0])
      cube([lx/2,th,lz], center=true);

    if ((folds%2)==0)
      translate([lx/4, th/2+(step/2)*folds,0])
        cube([lx/2,th,lz], center=true);
    else
      translate([-lx/4, th/2+(step/2)*folds,0])
        cube([lx/2,th,lz], center=true);
  }
}

module teardrop(r,h)
{
  $fa=15.0;
  $fs=0.1;

  diameter=2*r;

  translate([0,0,-h/2])
  linear_extrude(height=h, center=false, convexity=10)
  difference() {
    union() {
      circle(r=diameter/2);
      rotate(45) square(size=diameter/2,center=false);
    }
    translate([-diameter/2,diameter/2]) square(size=diameter);
  }
}

module pipe(hexa_diam=12, len=5, offs=0, sides=6)
{
  out_diam = 4*(hexa_diam/2 * cos(360/(2*sides)));


  difference() {
    rotate([90,0,0])
     cylinder(r=out_diam/2, h=len+10,center=true, $fn=sides);

    rotate([90,0,0])
     cylinder(r=hexa_diam/2+offs, h=len+15,center=true, $fn=sides);
  }
}

//---------------------------------------------
//-- Spring MAIN MODULES!
//-- Common parameters:
//--     -fid = folder inner diameter
//--     -th = thickness
//--     -folds = Number of folds in the spring
//--     -drill = Inner drill
//---------------------------------------------


//-------------------------------------
//-- Spring with a squeare section
//-- Specific parameters:
//--    lx, lz : square lenths
//-------------------------------------
module spring_square(fid=3, th=2, folds=8, lx=20, lz=20,drill=8)
{
  step = 2*(fid + th);
  arm_len = (lx - fid - 2*th)/2;
  ly = folds*(fid + th);
  echo(ly);

  difference() {
    parametric_spring_common(fid=fid,th=th, folds=folds, lx=lx, lz=lz);

    rotate([90,0,0])
      teardrop(r=drill/2,h=ly+10);
      //cylinder(r=drill/2, h=ly+10, center=true, $fn=20);
  }
}

//-----------------------------------------------------------------------
//-- Spring with an hexagonal section 
//-- Specific parameters:
//--    hexa_diam: external diameter
//--    offs: Additional distance added to the hexa_diam to 
//--      for changing the shape. When offs=0, it is a regular hexagon
//----------------------------------------------------------------------
module spring_hexagonal(fid=3, th=2, folds=8, hexa_diam=13 ,drill=8,offs=0)
{
   ly = folds*(fid + th);
  lx = hexa_diam;
  lz = 2*(hexa_diam/2 * cos(30));
  step = 2*(fid + th);
  arm_len = (lx - fid - 2*th)/2;
 

  difference() {
    parametric_spring_common(fid=fid,th=th, folds=folds, lx=lx, lz=lz);

    rotate([90,0,0])
      //cylinder(r=drill/2, h=ly+10, center=true, $fn=20);
      teardrop(r=drill/2,h=ly+10);

    pipe(hexa_diam=hexa_diam, len=ly,offs=offs,sides=6);
  }
}


//-----------------------------------------------------------------------
//-- Spring with an octogonal section 
//-- Specific parameters:
//--    hexa_diam: external diameter
//--    offs: Additional distance added to the hexa_diam to 
//--      for changing the shape. When offs=0, it is a regular hexagon
//----------------------------------------------------------------------
module spring_octogonal(fid=3, th=2, folds=8, hexa_diam=13 ,drill=8,offs=0)
{
   ly = folds*(fid + th);
  lx = hexa_diam;
  lz = 2*(hexa_diam/2 * cos(30));
  step = 2*(fid + th);
  arm_len = (lx - fid - 2*th)/2;
  echo(ly);

  difference() {
    parametric_spring_common(fid=fid,th=th, folds=folds, lx=lx, lz=lz);

    rotate([90,0,0])
      //cylinder(r=drill/2, h=ly+10, center=true, $fn=20);
      teardrop(r=drill/2,h=ly+10);

    rotate([0,45/2,0])
    pipe(hexa_diam=hexa_diam, len=ly,offs=offs, sides=8);
  }
}

//-- Example springs!

translate([-30,0,0])
spring_square(fid=3, th=2.8, folds=5, lx=22.2, lz=20, drill=14);

//-- This is the one used as a z axis spring on the Prusa Mendel
translate([0,0,0])
spring_hexagonal(fid=3, th=2, folds=4, hexa_diam=14.6, drill=8, offs=0);

translate([30,0,0])
spring_octogonal(fid=4, th=2, folds=6, hexa_diam=22, drill=14);





