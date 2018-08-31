/**********************************************
  'Can you try to be a little more discrete?'
  
  Curves that get straightened the nearer the cursor is over them
  
  Maximilian Kiepe, 30 August 2018
**********************************************/

// import calendar library for timestamp to name the saved .png
import java.util.Calendar;

// variable declaration to turn on/off the light ;)
int white = 255;
int black = 0;
boolean onOff = true;


// setup function
void setup(){
  // declare size of the sketch
  size(600, 600);
}

// draw function
void draw() {
  
  // background color
  background(white);

  //declare stroke color and fill color of the objects
  stroke(black);
  fill(white);
  
  // iteartion on both heights and width
  for (int gridY=30; gridY<height-10; gridY+=20) {
    for (int gridX=30; gridX<width-30; gridX+=20) {

      // save the diameter between cursor and where the object will be placed 
      float diameter = dist(mouseX, mouseY, gridX, gridY);
      diameter = diameter/width * 10;
      
      // The pushMatrix() function saves the current coordinate system to the stack and popMatrix
      pushMatrix();
      
      // place (displace) the object 
      translate(gridX, gridY);
      
      // draw curve with anchorpoints connected to the diameter and therefore to the cursor movemenet 
      curve(diameter*30, diameter*30, 0, 0, 20, 0, diameter*20, diameter*30);    //// also nice: ellipse(...)
      
      popMatrix(); 
    }
  }
}

// toggle between black and white
void mousePressed() {
  if (onOff == true){  
    white = 0;
    black = 255;
    onOff = false;
  } else {
    white = 255;
    black = 0;
    onOff = true;
  }
}

// press 's' key to save the current fram as .png 
void keyReleased(){
  if (key == 's') saveFrame(timestamp()+"_##.png");
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}