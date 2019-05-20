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

float keyz[] = new float [4];
float x, y;

public void setup() {
  
  noStroke();
  
}

public void draw() {
  float dx = 0.0f;
  float dy = 0.0f;
  for (int n = 0; n < keyz.length; n++){
    if (n == 0 || n == 2){
      dx += keyz[n];
    }

    if (n == 1 || n == 3){
      dy += keyz[n];
    }
  }

  rect(dx, dy, 50, 50);
}

public void keyPressed() {
  if (key == 'a')  keyz[0] = -10;
  if (key == 's')  keyz[1] = 10;
  if (key == 'd')  keyz[2] = 10;
  if (key == 'w')  keyz[3] = -10;
}

//void keyReleased() {
//  if (key == 'a')  keyz[0] = 0;
//  if (key == 's')  keyz[1] = 0;
//  if (key == 'd')  keyz[2] = 0;
//  if (key == 'w')  keyz[3] = 0;
//}
  public void settings() {  size(400, 400);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Test_pde" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
