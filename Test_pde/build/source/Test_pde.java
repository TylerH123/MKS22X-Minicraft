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
static float dx, dy;
float leanx, leany;
ArrayList<Tile> t = new ArrayList<Tile>();
public void setup() {
  
  noStroke();
  
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      t.add(new Grass(i*50, j*50));
    }
  }
}

public void draw() {
  background(0,0,255);
  stroke(0xff000000, 50);

  strokeWeight(4);
  for (Tile g : t) {
    g.display();
  }
  leanx = 0;
  leany = 0;
  if (keyz[0]) {
    dx+= 5;
    leanx = -5;
  }
  if (keyz[1]) {
    dy-= 5;
    leany = 5;
  }
  if (keyz[2]) {
    dx-= 5;
    leanx = 5;
  }
  if (keyz[3]) {
    dy+= 5;
    leany = -5;
  }
  fill(5);

  text("" + dx + ", " + dy, 10, 10);

  fill(204, 153, 21);
  rect(dx+100, dy+100, 30, 50);

  fill(100, 50, 118);
  text("PLAYER BOI", 400, 500);
  stroke(0xff000000, 50);
  rect(400 + leanx, 500 + leany, 50, 50);
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
public interface Collideable{
  
  public boolean isTouching(Object o); 
}
public class Grass extends Tile {
  
  public Grass(int x, int y){
    super();
    this.x = x;
    this.y = y; 
    c = color(0,255,0);
  }
  
}
class Oop{
  int x, y;
  public Oop(){
    x = 5;
    y = 7;
  }
  
  public void draw(int xc, int yc){
    rect(x, y, xc, yc);
  }
}
public class Stone extends Tile implements Collideable {
  
    public boolean isTouching(Object o){
     return true;  
    }
} 
public abstract class Tile { 
  
  float x,y; 
  int c; 
  
  public void display(){
    fill(c);
    rect(x+Test_pde.dx,y+Test_pde.dy,50,50); 
  }; 
  
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
