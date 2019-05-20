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


float y;

// The statements in the setup() function
// execute once when the program begins
public void setup() {
   // Size should be the first statement
 stroke(255);     // Set line drawing color to white
 noLoop();
 y = height * 0.5f;
}

// The statements in draw() are executed until the
// program is stopped. Each statement is executed in
// sequence and after the last line is read, the first
// line is executed again.
public void draw() {
 background(0);   // Set the background to black
 y = y - 4;
 if (y < 0) { y = height; }
 line(0, y, width, y);
}

public void mousePressed() {
 redraw();
}
  public void settings() {  size(640, 360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Test_pde" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
