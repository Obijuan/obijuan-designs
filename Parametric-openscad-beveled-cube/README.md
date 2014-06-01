Parametric openscad beveled cube
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

Parametric openscad beveled cube  by obijuan , published Sep 6, 2012

![Image](img/examples_display_large.jpg)

Description
--------
Parametric openscad module for doing beveled cubes. There are three different implementations for teaching openscad: using boolean operators, hull operator or minkowsky.<br />
<br />
 The default module uses the minkowsky approach, but the user can change it (good for testing the building speed using the three methods)<br />
<br />
More information (in Spanish):<br />
<a href="http://www.iearobotics.com/wiki/index.php?title=Objeto_3D:Cubo_Biselado" target="_blank" rel="nofollow">iearobotics.com/wiki/index.php?title=Objeto_3D:Cubo_Biselado</a>

Instructions
--------
Using the beveled cubes in your designes is very easy:<br />
<br />
#use &lt; bcube.scad &gt; <br />
<br />
bcube([20,20,10], cr=4, cres=0);<br />
<br />
where cr is the corner radius and cres the corner resolution (in points). 0 means the corners are just cutout using a straight line. If cres is 1, there will be a point in the midde (so the beveled corner will have 2 lines). The higher cres, the rounder the corner will be.<br />
<br />
The three implementations are in the files: bcube_boolean.scad, bcube_hull.scad and bcube_minkowsky.scad. Just rename the file name of the implementation you want to test to bcube.scad<br />
<br />
Good openscad learning!

Files
--------
[![Image](img/test_preview_tinycard.jpg)](test.stl)
 [ test.stl](test.stl)  

[![Image](img/Beveled_calibration_cube_preview_tinycard.jpg)](Beveled_calibration_cube.stl)
 [ Beveled_calibration_cube.stl](Beveled_calibration_cube.stl)  

[![Image](img/examples_preview_tinycard.jpg)](examples.stl)
 [ examples.stl](examples.stl)  

[![Image](img/Gears_preview_tinycard.jpg)](beveled_cube_openscad.zip)
 [ beveled_cube_openscad.zip](beveled_cube_openscad.zip)  



Pictures
--------
![Image](img/examples_display_large.jpg)
![Image](img/Beveled_calibration_cube_display_large.jpg)
![Image](img/test_display_large.jpg)
![Image](img/DSC05828_display_large.jpg)
![Image](img/DSC05829_display_large.jpg)
![Image](img/DSC05830_display_large.jpg)
![Image](img/DSC05831_display_large.jpg)
![Image](img/DSC05832_display_large.jpg)
![Image](img/DSC05833_display_large.jpg)
![Image](img/Beveled-cube_display_large.jpg)
![Image](img/beveled-cube-screenshot2_display_large.jpg)


Tags
--------
cube , library , obiscad , openscad , parametric , plastic_valley  

  

License
--------
Parametric openscad beveled cube by obijuan is licensed under the Creative Commons - Attribution - Share Alike license.  



By: Juan Gonzalez-Gomez (Obijuan)
--------
<http://www.iearobotics.com/wiki/index.php?title=Juan_Gonzalez:Main>