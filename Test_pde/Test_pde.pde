boolean keyz[] = new boolean [5];
boolean isPaused = false;
boolean canwalk[] = new boolean[4];
static float dx, dy;
float leanx, leany;
Tile[][] t = new Tile[100][100];
Inventory inv = new Inventory();
void setup() {
  size(1000, 750);
  noStroke();
  smooth();
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      t[i][j] = new Grass(i*50, j*50);
    }
  }

  t[0][0] = new Stone(0, 0);
}

void draw() {
  // clear();
  background(0, 0, 255);
  stroke(#000000, 50);

  strokeWeight(2);
  for (Tile[] garray : t) {
    for (Tile g: garray){
      g.display();
    }
  }
  leanx = 0;
  leany = 0;
  if (keyz[0] && !isPaused) {
    dx+= 5;
    leanx = -5;
  }
  if (keyz[1] && !isPaused) {
    dy-= 5;
    leany = 5;
  }
  if (keyz[2] && !isPaused) {
    dx-= 5;
    leanx = 5;
  }
  if (keyz[3] && !isPaused) {
    dy+= 5;
    leany = -5;
  }
  if (keyz[4]) {
    inv.display();
  }
  fill(5);

  text("" + dx + ", " + dy, 10, 10);
  fill(100, 50, 118);
  text("PLAYER BOI", 442, 368);
  stroke(#000000, 50);
  rect(400 + leanx, 400 + leany, 50, 50);
}

void keyPressed() {
  if (key == 'a')  keyz[0] = true;
  if (key == 's')  keyz[1] = true;
  if (key == 'd')  keyz[2] = true;
  if (key == 'w')  keyz[3] = true;
  if (key == 'i') {
    keyz[4] = !keyz[4];
    isPaused = !isPaused;
  }
}

void keyReleased() {
  if (key == 'a')  keyz[0] = false;
  if (key == 's')  keyz[1] = false;
  if (key == 'd')  keyz[2] = false;
  if (key == 'w')  keyz[3] = false;
}
