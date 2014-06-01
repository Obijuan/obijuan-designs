//----------------------------------------------------------------------------
//  Ikea hook clone, by Juan Gonzalez Gomez (Obijuan)
//  (c) Jan 2012.
//  GPL license
//----------------------------------------------------------------------------


//-----------------------------------------------------------------
//-- Simple part for making the hook. 
//-- It is a half ring
//-- diam: ring's diameter
//-- width: ring's width
//-- heigth: ring's heigth
//----------------------------------------------------------
module half_ring(diam, width, height)
{
  difference() {
     //-- outer cylinder
     cylinder (r=(diam + 2*width)/2, h=heigth, center=true);

    //-- Inner cylinder
    cylinder (r=diam/2, h=heigth+10, center=true);

   //-- Cut the cylinder in half (one half is removed)
   translate([0,-(diam+2)/2,0])
      cube([diam+2*width+10, diam+2, heigth+10],center=true);
  }
}


//------------------------------------------------------
//-- A simple hook
//-- diam = hook internal diamenter
//-- length = total length (in the y axis)
//-- width = thickness in the x axis
//-- heigth = thickness in the z axis
//-------------------------------------------------------
module hook(diam, length, width, heigth)
{

  //-- The hook is composed by the union of a half-circle,
  //-- and two legs (one longer). The leg's length are  dist and dist/2

  //-- Calculate the hook's long leg length
  dist = length - diam/2 -width;
 
  union() {

    //-- Half ring
    translate([(-diam-width)/2, dist,0])
     half_ring(diam=diam, width=width, heigth=heigth);

    //-- Longer leg
    translate([0, dist/2,0])
      cube([width, dist, heigth],center=true);

    //-- shorter leg
     translate([-diam-width, dist/2 + dist/4,0])
        cube([width, dist/2, heigth], center=true);
    }
}


//-----------------------------------------------------
//  Ikea hook. Main module         
//  diam: Hook interna diameter
//  length: Total distance in the y axis 
//  width: thickness in the x axis
// height: thickness in the z axis  
//----------------------------------------------------
module ikea_hook(diam = 20, length=70, width=3, heigth=5)
{
  
//-- The ikea hook is composed of two equal hooks. One hook is obtained from the
//-- other aplying a rotation around the y and x axis (180 degrees)

  //-- Put the hook on the ground
  translate([0,0,heigth/2])

    //-- Union of the two hooks
    union() {
      //-- First hook
      hook(diam=diam, length=length/2, width=width, heigth=heigth);

     //-- Second hook
      translate([0,0.1,0]) //-- Just to make sure the two hooks form one part
      rotate([180,0,0])
        rotate([0,180,0])
         hook(diam=diam, length=length/2, width=width, heigth=heigth);
   }
}


//-- The standar Ikea hook!!!!
ikea_hook();

