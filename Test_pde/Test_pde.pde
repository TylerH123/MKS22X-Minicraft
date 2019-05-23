boolean keyz[] = new boolean [5];
boolean isPaused = false; 
static float dx, dy;
float leanx, leany;
ArrayList<Tile> t = new ArrayList<Tile>();
Inventory inv = new Inventory();
String direction = "";
void setup() {
  size(1000, 750);
  noStroke();
  smooth();
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      t.add(new Grass(i*50, j*50));
    }
  }
}

void draw() {
  clear(); 
  background(0, 0, 255);
  stroke(#000000, 50);

  strokeWeight(2);
  for (Tile g : t) {
    g.display();
  }
  leanx = 0;
  leany = 0;
  if (keyz[0] && !isPaused) {
    dx+= 5;
    leanx = -5;
    direction = "west";
  }
  if (keyz[1] && !isPaused) {
    dy-= 5;
    leany = 5;
    direction = "south";
  }
  if (keyz[2] && !isPaused) {
    dx-= 5;
    leanx = 5;
    direction = "east";
  }
  if (keyz[3] && !isPaused) {
    dy+= 5;
    leany = -5;
    direction = "south";
  }
  if (keyz[4]) {
    inv.display();
  }
  fill(5);

  text("" + dx + ", " + dy, 10, 10);
  fill(100, 50, 118);
  text("PLAYER BOI", 442, 368);
  stroke(#000000, 50);
  rect(450 + leanx, 375 + leany, 50, 50);
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
