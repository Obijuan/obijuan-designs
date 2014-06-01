Attach library for Openscad
===============
**Please note: This thing is part of a list that was [automatically generated](https://github.com/carlosgs/export-things) and may have been updated since then. Make sure to check for the current license and authorship.**  

Attach library for Openscad  by obijuan , published Sep 10, 2012

![Image](img/attach-04_display_large.jpg)

Description
--------
Openscad library for easily attaching parts. This is an experimental work on enhancing the openscad tool. Usually the code written by users is difficult to read and understand. If we want to share the code and to reuse parts made by others, it is very important to write clean code.<br />
<br />
  The attach operator is a experimental way of joining together parts. It just hides all the translate/rotate operators to the user, making the code easier to read, maitain and reuse.<br />
<br />
I have written about it (and given an example of use) in this post:<br />
<br />
<a href="http://www.iearobotics.com/blog/2012/09/10/enhancing-openscad-with-the-attach-library/" target="_blank" rel="nofollow">iearobotics.com/blog/2012/09/10/enhancing-openscad-with-the-attach-library/</a><br />
<br />
The attach operator is part of the obiscad tools I am developing:<br />
<br />
<a href="https://github.com/Obijuan/obiscad" target="_blank" rel="nofollow">github.com/Obijuan/obiscad</a><br />
<br />
More information in this wiki (in Spanish):<br />
<br />
<a href="http://www.iearobotics.com/wiki/index.php?title=Obiscad" target="_blank" rel="nofollow">iearobotics.com/wiki/index.php?title=Obiscad</a>

Instructions
--------
Example of use:<br />
<br />
1) Define the connectors in a part (the points were you want to attach other parts). You should provide the attachment point, the axis and the roll angle:<br />
<br />
//--     att. point     att. axis    roll<br />
c1 = [ [0,0,10],  [0,0,1],     20 ]; <br />
<br />
Add your main part.<br />
You can easily see the connector you have defined invoking the connector module:<br />
<br />
connector(c1);<br />
<br />
Then define the connector for the second part:<br />
<br />
//--  att. point  att. axis  roll<br />
a = [ [0, 2,2],   [0,0,1],   0  ];<br />
<br />
Again, put your part and then view the connector with:<br />
connector(a);<br />
<br />
Now you are ready to attach the second part to the first one invoking the attach operator:<br />
<br />
attach(c1,a) your_part();<br />
<br />
Were your_part() is a module or a tree of operators (union, translates and so on).<br />
<br />
<br />

Files
--------
[![Image](img/Gears_preview_tinycard.jpg)](obiscad-attach-openscad.zip)
 [ obiscad-attach-openscad.zip](obiscad-attach-openscad.zip)  



Pictures
--------
![Image](img/attach-01_display_large.jpg)
![Image](img/attach-02_display_large.jpg)
![Image](img/attach-03_display_large.jpg)
![Image](img/attach-05_display_large.jpg)
![Image](img/attach-06_display_large.jpg)


Tags
--------
library , obiscad , openscad , plastic_valley , printbot , robot  

  

License
--------
Attach library for Openscad by obijuan is licensed under the Creative Commons - Attribution - Share Alike license.  



By: Juan Gonzalez-Gomez (Obijuan)
--------
<http://www.iearobotics.com/wiki/index.php?title=Juan_Gonzalez:Main>