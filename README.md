# BallRevamped4
<b>5/16/19</b> </br> </br>
Repository is made </br></br>
<b>5/17/19</b></br>
<h4> Caleb's Work </h4>
  <dt>Ball Class</dt>
  <ul>
    <li>Added variables, the constructor, and the abstract methods. </li>
  </ui>
  <dt>Move</dt>
  <ul>
    <li>Expanded on move to allow user interactivity: the arrow keys accelerate the boy in the specified direction.</li>
    <li>Made move part of the Ball class and called the super version in the NormalBall class.  </li>
  </ul>
<h4> Chris's Work </h4>
  <dt>NormalBall Class</dt>
  <ul>
    <li>wrote display() using the correct RGB values as the ball in the game, and arc() for the quadrants</li>
    <li>wrote move() to increment x and y, and ySpeed to emulate gravity</li>
  </ul>
  <dt>Wrote setup() with dimensions of the display and ball that matched the game.</dt>
  <dt>Wrote draw() with restrictions that respawn the ball if it goes out of boundary. </dt>
</d1></br>
<b>5/18/19</b></br>
<h4>Caleb's Work </h4>
<ul>
  <li>Created the Wall Class, defined display() and isTouching(Ball b) for it</li>
  <li>Created the EnvironmentElement Class, added constructor + abstract methods</li>
  <li>Created the Concept of Radius</li>
  <li>Created the Portal Class, defined display() and isTouching(Ball b) for it</li>
</ul>
<h4> Chris's Work </h4>
  <dt>Overall Stuff</dt>
  <ul>
    <li>changed back all instances of the variable diameter back to radius</li>
  </ul>
  <dt>Ball Class</dt>
  <ul>
    <li>-added respawn() method to allow ball to respawn at any location</li>
    <li>-refined the increments of the arrow movements and gravity to more closely match the game</li>
    <li>-removed unecessary code</li>
  </ul>
</d1></br>
<b>5/19/19</b></br>
<h4> Chris's Work </h4>
  <dt>PowerUp Class</dt>
  <ul>
    <li>wrote display method by using a star shape</li>
    <li>wrote the display method for Small and Big PowerUps by drawing arrows underneath</li>
    <li>wrote the isTouching method by pretending its a small circle</li>
    <li>wrote use() for Small and Big PowerUps by changing the size of the ball</li>
  </ul>
</d1>
<h4> Caleb's Work </h4>
  <ul>
    <li>Whenever a shape hit a powerup, it became a new type of ball</li>
    <li>Added an instance variable to balls: colors, and switched up color based on the class of ball</li>
    <li>Added an instance variable to balls: grvaity: differs depending on ball</li>
    <li>Created WeightlessBall Class and extended Ball</li>
    <li>Created WeightlessBall PowerUp and extended PowerUp</li>
  </ul>
</d1></br>
<b>5/20/19</b></br>
<h4> Chris's Work </h4>
  <ul>
    <li>wrote HeavyBall and HeavyPowerUp classes</li>
    <li>fixed the issue of the ball's momentum not being preserved</li>
    <li>overrode respawn in the HeavyBall and WeightLessBall so they spawn as a NormalBall</li>
    <li>fixed the shades and colours of the HeavyBall, HeavyPowerUp, and WeightLessPowerUp classes</li>
    <li>fixed the issue of the small and big balls not reverting to original size when activating the weightless or heavy powerup</li>
  </ul>
<h4> Caleb's Work </h4>
  <ul>
    <li>Only worked in class</li>
    <li>Fixed Colors of WeightlessBall</li>
  </ul>
  </br>
<b>5/21/19</b></br>
<h4> Chris's Work </h4>
  <ul>
    <li>Worked in class only</li>
    <li>Fixed ball size when switching between ball states</li>
  </ul>
<h4> Caleb's Work </h4>
  <ul>
    <li>Only worked in class</li>
    <li>Contained all the stars in weightless ball within the circle </li>
  </ul>
  </br>
<b>5/22/19</b></br>
<h4> Caleb's Work </h4>
  <ul>
    <li>In experiments, managed to make a marker that draws a continous stream of circles</li>
    <li>Every single "coordinate" of the marker was written to a file</li>
    <li>Created the Wood class which implemented the Wall class</li>
    <li>Created a color gradient in the display the wood class</li>
  </ul>
  </br>
<b>5/23/19</b></br>
  <h4> Chris's Work </h4>
  <ul>
    <li>Added level class with 3 variables storing the ball, walls, and powerups</li>
    <li>Started writing a display method that calls each item to display itself</li>
  </ul>
  <h4>Caleb's Work </h4>
  <ul>
    <li>Moved Ball Class to a new Tab </li>
    <li>Thought successfully of an innovative solution to creating levels in the game.</li>
  </ul>
</d1></br>
<b>5/24/19</b></br>
  <h4> Chris's Work </h4>
  <ul>
    <li>Transferred the method calls from setup() into the level1() method in LevelCreator class</li>
    <li>Transferred the method calls from draw() into the run() method in the Level class</li>
    <li>Reduced the amount of radius parameters for all the Ball subclasses</li>
    <li>Removed respawn method in Ball class and wrote a new one in Level class to allow its methods to access the Ball's variables</li>
    <li>Got the Level and LevelCreator class to successfully run in draw()</li>
  </ul>
  <h4>Caleb's Work </h4>
  <ul>
    <li>Fixed the problem that balls were not affected by powerups</li>
  </ul></br>
<b>5/25/19</b></br>
  <h4> Chris's Work </h4>
  <ul>
    <li>Created RazorBall and RazorPowerUp classes</li>
    <li>Wrote their display() methods with arcs as spikes</li>
    <li>Made the Wood class to get destroyed when RazorBall touches it</li>
    <li>Made working Bomb mechanics by getting a bomb to destroy wood if it is near it and its timer reaches 0</li>
    <li>Made BombPowerUp class to allow ball to turn into a BombBall</li>
  </ul>
  <h4> Caleb's Work </h4>
  <ul>
    <li>Created the laser class; this controls the laser the laserBall shoots</li>
    <li>Created the laserBall class: this is a new type of ball</li>
    <li>Created the laserPowerUp class: this turns the ball into a laser ball</li>
  </ul></br>
<b>5/26/19</b></br>
  <h4> Chris's Work </h4>
  <ul>
    <li>Reorganized the tabs; put all the subclasses into a single tab</li>
    <li>Added Fuse and FusePowerUp and got them working correctly</li>
  </ul>
  <h4> Caleb's Work </h4>
  <ul>
    <li>Started Lense Class </li>
    <li>Wasted a lot of time figuring out how to draw an ellipse, but gave up because it's very hard to detect circle-ellipse collision </li>
    <li>Started to draw out what a two arcs would look like instead, and starting arc-circle detecion </li>
  </ul></br>
<b>5/27/19</b></br>
  <h4>Chris's Work</h4>
  <ul>
    <li>Wrote a function that draws an arrow pointed in a certain direction</li> 
    <li>Added forcefield that has blue sine waves as electricity</li>
    <li>Added a stick that deactivates forcefield if ball passes up and down 5 times</li>
  </ul>
  <h4>Caleb's Work</h4>
  <ul>
    <li>Added a color gradient to the lense's class</li>
    <li>Pefected the display and the isTouching of Lense</li>
    <li>Started to work on the laser destroying lense code</li>
  </ul>
  </br>
 <b>5/28/19</b></br>
  <h4>Chris's Work</h4>
    <li>Created the FlipPowerUp that rotates the display for 180 degrees</li>
    <li>Created a dark version of level where only allows a radius from the ball to be visible</li>
  <h4>Caleb's Work</h4>
  <ul>
    <li>Made two static functions: rectangleInsidecircle + intersectsRectangle</li>
    <li>Used thosed functions for isTouching. isTouching now smei-works</li>
    <li>Edited the Levels Class so the lasers have the ability to access the lens</li>
  </ul>
 <b>5/29/19</b></br>
   <h4>Chris's Work</h4>
   <ul>
    <li>Created LightBall and that mitigates the dark level's effects</li>
    <li>Created levels 1 to 10 by using the actual game as reference</li>
   </ul>
   <h4>Caleb's Work</h4>
   <ul>
    <li> Optimized rate of fire for laserBall </li>
    <li> Fixed isTouching for Laser affecting Lense, laser now correctly destroys lense </li>
   </ul>
<b>5/30/19</b></br>
   <h4>Chris's Work</h4>
   <ul>
    <li>Created levels 10 to 14 by using the actual game as reference</li>
   </ul>
   <h4>Caleb's Work</h4>
   <ul>
    <li> Started burningBall Class, did a couple of methods </li> 
   </ul>
 <b>5/31/19</b></br>
    <h4>Caleb's Work</h4>
    <ul>
      <li>Tried to fix black coloring process for burning ball in clas. Failed </li>
     </ul>


