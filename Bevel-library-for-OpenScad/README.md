Bevel library for OpenScad
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

Bevel library for OpenScad  by obijuan , published Sep 13, 2012

![Image](img/bevel_01_concave_corner_display_large.jpg)

Description
--------
There is one very common operation that has to be done in nearly all the designs: beveling edges. It can be done on the convex side, for avoiding sharp edges, or on the concave side, for reinforce the part (avoiding the 90 degrees connection between parts).<br />
<br />
With the bevel library I am developing doing these two operations is a piece of cake.<br />
<br />
I have given some examples in this post:<br />
<br />
<a href="http://www.iearobotics.com/blog/2012/09/13/enhancing-openscad-ii-bevel-library/" target="_blank" rel="nofollow">iearobotics.com/blog/2012/09/13/enhancing-openscad-ii-bevel-library/</a><br />
<br />
The bevel library is part of the obiscad tools I am developing:<br />
<br />
<a href="https://github.com/Obijuan/obiscad" target="_blank" rel="nofollow">github.com/Obijuan/obiscad</a><br />
<br />
More information in this wiki (in Spanish):<br />
<br />
<a href="http://www.iearobotics.com/wiki/index.php?title=Obiscad" target="_blank" rel="nofollow">iearobotics.com/wiki/index.php?title=Obiscad</a><br />
<br />
Many thanks to Miguel Angel de Frutos (MAF, <a href="http://www.thingiverse.com/MAF" target="_blank" rel="nofollow">thingiverse.com/MAF</a> ) for his technical advices<br />

Instructions
--------
How to bevel an edge:<br />
<br />
1) Define 2 connectors with the same attachment point in the edge. One vector should be poiting in the edge direction and the other is orthogonal, pointing to the exterior bisec.<br />
<br />
2) Invoke the Bevel() module (passing the connectors as parameters, as shown in the examples)<br />
<br />
3) Use the difference operator<br />
<br />
Three examples are provided (along with their STLs)<br />
<br />
The code of your part with beveled edges looks like:<br />
<br />
difference()<br />
{<br />
  My_part();<br />
  bevel(a1, a2, cr = 8, l=10);  //-- First beveled edge<br />
  bevel(b1, b2, ....);          //-- Second beveled edge<br />
  ...<br />
}<br />
<br />
The procedure for attaching buttress to you parts is similar, but in this case one of the connector should point to the inside bisector.

Files
--------
[![Image](img/Gears_preview_tinycard.jpg)](Obiscad-bevel-library-openscad.zip)
 [ Obiscad-bevel-library-openscad.zip](Obiscad-bevel-library-openscad.zip)  

[![Image](img/bevel_01_concave_corner_preview_tinycard.jpg)](bevel_01_concave_corner.stl)
 [ bevel_01_concave_corner.stl](bevel_01_concave_corner.stl)  

[![Image](img/bevel_02_cube_preview_tinycard.jpg)](bevel_02_cube.stl)
 [ bevel_02_cube.stl](bevel_02_cube.stl)  

[![Image](img/bevel_03_buttress_preview_tinycard.jpg)](bevel_03_buttress.stl)
 [ bevel_03_buttress.stl](bevel_03_buttress.stl)  



Pictures
--------
![Image](img/bevel_02_cube_display_large.jpg)
![Image](img/bevel_03_buttress_display_large.jpg)
![Image](img/DSC01467_display_large.jpg)
![Image](img/DSC01481_display_large.jpg)
![Image](img/DSC01470_display_large.jpg)
![Image](img/DSC01471_display_large.jpg)
![Image](img/concave_corner_display_large.jpg)
![Image](img/bevel_02_cube_display_large.jpg)
![Image](img/bevel_03_buttress_display_large.jpg)
![Image](img/acuerdo_display_large.jpg)
![Image](img/doble_refuerzo_display_large.jpg)


Tags
--------
library , obiscad , openscad , plastic_valley  

  

License
--------
Bevel library for OpenScad by obijuan is licensed under the Creative Commons - Attribution - Share Alike license.  



By: Juan Gonzalez-Gomez (Obijuan)
--------
<http://www.iearobotics.com/wiki/index.php?title=Juan_Gonzalez:Main>