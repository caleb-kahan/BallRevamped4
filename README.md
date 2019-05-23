# BallRevamped4
<b>5/16/19</b> </br> </br>
Repository is made </br></br>
<b>5/17/19</b></br>
<h4> Caleb's Work </h4>
  <dt>Ball Class</dt>
  <ui>
    <li>Added variables, the constructor, and the abstract methods. </li>
  </ui>
  <dt>Move</dt>
  <ui>
    <li>Expanded on move to allow user interactivity: the arrow keys accelerate the boy in the specified direction.</li>
    <li>Made move part of the Ball class and called the super version in the NormalBall class.  </li>
  </ui>
<h4> Chris's Work </h4>
  <dt>NormalBall Class</dt>
  <ui>
    <li>wrote display() using the correct RGB values as the ball in the game, and arc() for the quadrants</li>
    <li>wrote move() to increment x and y, and ySpeed to emulate gravity</li>
  </ui>
  <dt>Wrote setup() with dimensions of the display and ball that matched the game.</dt>
  <dt>Wrote draw() with restrictions that respawn the ball if it goes out of boundary. </dt>
</d1></br>
<b>5/18/19</br>
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
  <dt>Wall Class</dt>
  <ul>
    <li>Discerned mistake for isTouching()</li>
  </ul>
</d1></br>
<b>5/19/19</br>
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
</d1>
<b>5/20/19</br>
<h4> Chris's Work </h4>
  <ul>
    <li>wrote HeavyBall and HeavyPowerUp classes</li>
    <li>fixed the issue of the ball's momentum being preserved</li>
    <li>overrode respawn in the HeavyBall and WeightLessBall so they spawn as a NormalBall</li>
    <li>fixed the shades and colours of the HeavyBall, HeavyPowerUp, and WeightLessPowerUp classes</li>
    <li>fixed the issue of the small and big balls not reverting to original size when activating the weightless or heavy powerup</li>
  </ul>
  <h4> Caleb's Work </h4>
    <ul>
      <li>Only worked in class</li>
      <li>Fixed Colors of WeightlessBall</li>
    </ul>
    <b>5/21/19</br>
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
  <b>5/23/19</br>
  <h4> Caleb's Work </h4>
    <ul>
      <li>In experiments, managed to make a marker that draws a continous stream of circles</li>
      <li>Every single "coordinate" of the marker was written to a file</li>
      <li>Created the Wood class which implemented the Wall class</li>
      <li>Created a color gradient in the display the wood class</li>
  </ul>
</d1>
