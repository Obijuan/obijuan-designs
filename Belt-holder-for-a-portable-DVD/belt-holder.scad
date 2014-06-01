//----------------------------------------------------------------------------------------------
//-- Belt holder, By Obijuan (juan@iearobotics.com)
//-- August, 20th, 2012
//----------------------------------------------------------------------------------------------
//-- GPL license
//----------------------------------------------------------------------------------------------

//-- Part parameters
lx1 = 10;
ly1 = 25;
w1=3;
w2=5;
w3=20;
h1=2;
h2=2;
h3=2;
extra=2;

//-- Top part. The belt goes though here
difference() {
  cube([lx1, ly1+2*w1,h1+h2],center=true);
  translate([0,0,-h1])
    color("green") cube([lx1+extra, ly1, h1+extra],center=true);
}

//-- Base
translate([(lx1+w3)/2 - lx1/2, 0, -(h1+h2+h3)/2  ])
  cube([lx1+w3, ly1+2*w1+w2, h3],center=true);