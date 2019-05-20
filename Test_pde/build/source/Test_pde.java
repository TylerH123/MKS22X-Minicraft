import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Test_pde extends PApplet {

boolean keyz[] = new boolean [4];
float dx, dy;
public void setup() {
  
  noStroke();
  
}

public void draw() {
  background(80);
  if (keyz[0]){
    dx+= 5;
  }
  if (keyz[1]){
    dy-= 5;
  }
  if (keyz[2]){
    dx-= 5;
  }
  if (keyz[3]){
    dy+= 5;
  }

  text("" + dx + ", " + dy, 10, 10);

  rect(dx+100, dy+100, 30, 50);

  rect(400, 500, 50, 50);
}

public void keyPressed() {
  if (key == 'a')  keyz[0] = true;
  if (key == 's')  keyz[1] = true;
  if (key == 'd')  keyz[2] = true;
  if (key == 'w')  keyz[3] = true;
}

public void keyReleased() {
  if (key == 'a')  keyz[0] = false;
  if (key == 's')  keyz[1] = false;
  if (key == 'd')  keyz[2] = false;
  if (key == 'w')  keyz[3] = false;
}
  public void settings() {  size(1000, 1200);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Test_pde" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
