Vector library for OpenScad
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

Vector library for OpenScad  by obijuan , published Sep 8, 2012

![Image](img/vector_screenshot-1-robot_display_large.jpg)

Description
--------
This is a Vector library for drawing vectors in Openscad. It is extremely useful for designing robots and viewing their kinematics. In addition, it gives a lot of help when designing parts by means of displaying auxiliary vectors and frames of reference.<br />
<br />
  Another very useful operator is  "orientate()" which make the child to point in the direction given by a vector. <br />
<br />
The vector library is part of the tools I am developing for making it easier the use of Openscad. These tools are called obiscad. They are located in this repo:<br />
<br />
<a href="https://github.com/Obijuan/obiscad/" target="_blank" rel="nofollow">github.com/Obijuan/obiscad/</a><br />
<br />
More information (in spanish) in this page:<br />
<br />
<a href="http://www.iearobotics.com/wiki/index.php?title=Obiscad" target="_blank" rel="nofollow">iearobotics.com/wiki/index.php?title=Obiscad</a><br />

Instructions
--------
* Uncompress the .zip file<br />
* Open the examples given in openscad<br />
<br />
Drawing a vector is as easy as writting:<br />
<br />
use &lt; obiscad/vector.scad &gt;<br />
vector([10,10,10]);<br />
<br />
If you want to make a part to have the orientation given by a vector, just use the orientate() operator:<br />
<br />
orientate(v=[1,1,1], roll=0)<br />
  cube ([20,20,20]),center=true)  // Change it by the oject you want to change orientation<br />
<br />
There are more instructions in the library comments and examples.

Files
--------
[![Image](img/Gears_preview_tinycard.jpg)](obiscad-vector.zip)
 [ obiscad-vector.zip](obiscad-vector.zip)  



Pictures
--------
![Image](img/vector_screenshot-2-robot-kin_display_large.jpg)
![Image](img/vector_screenshot-3-array_display_large.jpg)
![Image](img/vector_screenshot-4-test_display_large.jpg)


Tags
--------
library , obiscad , openscad , plastic_valley , printbot , robot , vector  

  

License
--------
Vector library for OpenScad by obijuan is licensed under the Creative Commons - Attribution - Share Alike license.  



By: Juan Gonzalez-Gomez (Obijuan)
--------
<http://www.iearobotics.com/wiki/index.php?title=Juan_Gonzalez:Main>