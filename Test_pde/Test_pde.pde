boolean keyz[] = new boolean [5];
boolean isPaused = false;
static float dx, dy;
float leanx, leany;
// ArrayList<Tile> t = new ArrayList<Tile>();
Tile[][] t = new Tile[100][100];
Inventory inv = new Inventory();
Player p = new Player();
//direction that player is facing
String direction = "";
//list shows cost as first value and id of the material needed to create
int[][] costList = new int[][]{ {}, {10, 0}, {20, 0}, {15, 0}, {5, 0}, {20, 14}, {20, 15}, {5, 17}, {15, 15}, {5, 0}, {5, 0}, {2, 0}, {2, 0}, {7, 0} };
//list with all the items in inventory
String[] itemList = new String[50];
void setup() {
  size(1000, 750);
  noStroke();
  smooth();
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      t[i][j] = new Grass(i*50, j*50);
    }
  }
}

void draw() {
  clear();
  background(0, 0, 255);
  stroke(#000000, 50);
  itemList[0] = "chicken";
  strokeWeight(2);
  for(int x = 0; x < 100; x++){
    for(int y = 0; y < 100; y++){
      t[x][y].display();
    }
  }
  leanx = 0;
  leany = 0;

  if (!isPaused){
    if (keyz[0]) {
      dx+= 5;
      leanx = -5;
      direction = "west";
    }
    if (keyz[1]) {
      dy-= 5;
      leany = 5;
      direction = "south";
    }
    if (keyz[2]) {
      dx-= 5;
      leanx = 5;
      direction = "east";
    }
    if (keyz[3]) {
      dy+= 5;
      leany = -5;
      direction = "north";
    }
  }

  if (keyz[4]) {
    inv.display();
  }

  fill(5);

  text("" + dx + ", " + dy, 10, 10);
  text(direction, 10, 20);
  p.display();
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
