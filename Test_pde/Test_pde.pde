boolean keyz[] = new boolean [4];
float x, y;
void setup() {
  size(1000, 1200);
  noStroke();
  smooth();
}

void draw() {
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

void keyPressed() {
  if (key == 'a')  keyz[0] = true;
  if (key == 's')  keyz[1] = true;
  if (key == 'd')  keyz[2] = true;
  if (key == 'w')  keyz[3] = true;
}

void keyReleased() {
  if (key == 'a')  keyz[0] = false;
  if (key == 's')  keyz[1] = false;
  if (key == 'd')  keyz[2] = false;
  if (key == 'w')  keyz[3] = false;
}
