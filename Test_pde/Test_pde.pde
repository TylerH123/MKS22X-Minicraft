boolean keyz[] = new boolean [4];
float dx, dy;
void setup() {
  size(1000, 1200);
  noStroke();
  smooth();
}

void draw() {
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
