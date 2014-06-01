//---------------------------------------------------------------------------------------------
//-- Mini-dome.  Derived from the Domekit-2V from effallo
//---------------------------------------------------------------------------------------------
//-- PENTA-CONNECTORS
//-- The connectors are parameterized. The short sticks are connected
//-- in all the holes. There is a circle on the top, indicating the outer face
//---------------------------------------------------------------------------------------------
//-- (c) Jul-2012 Juan Gonzalez-Gomez (Obijuan) juan@iearobotics.com
//-- Released under the GPL license
//--------------------------------------------------------------------------------------------
/* Derived from:
   DOMEKIT-2V • PENTAGON
   http://effalo.com
*/

//-- Two Domes as examples:
//-- All the calculations have been done using this link:
//--  http://simplydifferently.org/Geodesic_Dome_Notes?page=3#2V/L2

/*  EXAMPLE 1 (default): Micro-dome

   Diameter: 150 mm
   Height: 75mm
   20 x Hexa-connectors
   6  x  Penta-connectors
   35 x Long sticks: 46.3mm (Green)
   30 x shot sticks: 41mm (Red)
*/

/*  EXAMPLE 2: Mini-dome

   Diameter: 50cm
   Height: 25cm
   20 x Hexa-connectors
   6  x  Penta-connectors
   35 x Long sticks: 154.5 mm (Green)
   30 x shot sticks: 136.6 mm (Red)
*/


//----------------------------------------------------------------------------------------------------
//--  Module for creating the main body of the pentagonal connectors
//--  Parameters:
//--      r :  Pentagon radius
//--      h:  Hub height
//--      s:  Stick diameter
//-------------------------------------------------------------------------------------------------------
module penta_hub_main(r,h,s)
{
  hull() {
    cylinder(r=r, h=h,center=true,$fn=5);

     for (i=[0:4]) {
       rotate([0,0,i*72])
         translate([r-s/2,0,0])
           cube([s,s, h],center=true);
    }
  }
}

//----------------------------------------------------------------------------------
//-- Pentagon connector
//-- Input parameters
//--     sd: stick diameter
//--     holedepth
//--
//--    The total part height and diameter are calculated 
//--   accorting to these two USER parameters
//----------------------------------------------------------------------------------
module penta_hub(sd=2.5, holedepth=6)
{
  
  //-- Temp variable. Length of the cilinders used for 
  //-- making the drills on the main hub. 

  length = holedepth + sd*sin(18)+2;

  //-- Calculate the main hub parameters: radius and height
  //-- They are calculated from the stick diameter and holedepth
  hub_r = sd + holedepth*cos(18);
  hub_h = holedepth*sin(18)+sd*cos(18) + 1+1;

  //-- Debugin: Output the calculated parameters
  echo("Diameter: ",2*hub_r);
  echo("Height: ",hub_h);

  //-- The part consist of sub-parts:
  //--  1) The main hub: a pentagon 
  //--  2) The drills 
 //--   3) A top circle

  union() {
    difference() {
      //-- Main hub
      penta_hub_main(r=hub_r, h=hub_h,s=sd);

      //-- Holes for inserting the sticks
      for (i=[0:5]) {
         rotate([0,0,i*72])
          translate([length/2+sd*sqrt(3)/2,0,0])
            rotate([0,90+16,0])
              cylinder(r=sd/2, h=length, center=true, $fn=6);
      }
    }
    //-- A cicle for indicationg the outer face of the connector
    translate([0,0,hub_h/2])
      cylinder(r=hub_r/3, h=1,center=true);

  }

} //-- End module


//-----------------------------------------------------------------------------------------
//-- DEFINED BY THE USER:
//-- uncomment the connects to use, or set the parameters
//----------------------------------------------------------------------------------------

//-- Default: Micro-dome
penta_hub();

//-- Mini Dome:
//penta_hub(sd=3.4, holedepth=10);




