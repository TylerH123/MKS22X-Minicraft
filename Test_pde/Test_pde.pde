boolean keyz[] = new boolean [4];
boolean canmove[] = new boolean [4];
static float dx, dy;
float leanx, leany;
ArrayList<Tile> t = new ArrayList<Tile>();
void setup() {
  size(1000, 1200);
  noStroke();
  smooth();
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      t.add(new Grass(i*50, j*50));
    }
  }
}

void draw() {
  background(0,0,255);
  stroke(#000000, 50);

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
  stroke(#000000, 50);
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
