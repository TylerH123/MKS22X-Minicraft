boolean keyz[] = new boolean [4];
float dx, dy;
float leanx, leany;
void setup() {
  size(1000, 1200);
  noStroke();
  smooth();
}

void draw() {
  background(80);
  leanx = 0;
  leany = 0;
  if (keyz[0]){
    dx+= 5;
    leanx = -5;
  }
  if (keyz[1]){
    dy-= 5;
    leany = 5;
  }
  if (keyz[2]){
    dx-= 5;
    leanx = 5;
  }
  if (keyz[3]){
    dy+= 5;
    leany = -5;
  }
  fill(5);

  text("" + dx + ", " + dy, 10, 10);

  fill(204, 153, 21);
  rect(dx+100, dy+100, 30, 50);

  fill(88, 185, 118);
  text("PLAYER BOI", 400, 500);
  rect(400 + leanx, 500 + leany, 50, 50);
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
