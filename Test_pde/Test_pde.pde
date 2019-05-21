boolean keyz[] = new boolean [4];
static float dx, dy;
float leanx, leany;
ArrayList<Tile> t = new ArrayList<Tile>(); 
void setup() {
  size(1000, 1200);
  noStroke();
  smooth();
  t.add(new Grass(0, 50));
  t.add(new Grass(0, 100));
  t.add(new Grass(0, 150));
  t.add(new Grass(0, 200));
}

void draw() {
  background(80);
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
  rect(400 + leanx, 500 + leany, 50, 50);
  for (Tile g : t){ 
    g.display();
  }
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
