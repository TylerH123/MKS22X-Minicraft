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
float x, y;
public void setup() {
  
  noStroke();
  
}

public void draw() {
  background(80);
  if (keyz[0]){
    x-= 5;
  }
  if (keyz[1]){
    y+= 5;
  }
  if (keyz[2]){
    x+= 5;
  }
  if (keyz[3]){
    y-= 5;
  }

  text("" + x + ", " + y, 10, 10);
  rect(x, y, 50, 50);
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
