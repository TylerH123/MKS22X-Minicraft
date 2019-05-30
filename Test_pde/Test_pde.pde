boolean keyz[] = new boolean [5];
boolean isPaused = false;
static boolean cannotwalk[] = new boolean[4];
static float dx, dy;
PImage treeImg, stoneImg, grassImg;
static int currtilex;
static int currtiley;

// static float currtilex;
// static float currtiley;

float leanx, leany;
static Tile[][] t = new Tile[10][10];

static TestTile[][] testarr= new TestTile[10][10];

Inventory inv = new Inventory();
Player p = new Player();
//direction that player is facing
String direction = "";
//list shows cost as first value and id of the material needed to create
int[][] costList = new int[][]{ {}, {10, 0}, {20, 0}, {15, 0}, {5, 0}, {20, 14}, {20, 15}, {5, 17}, {15, 15}, {5, 0}, {5, 0}, {2, 0}, {2, 0}, {7, 0} };
//list with all the items in inventory
String[] itemList = new String[25];
//list with all items that player can interact with
Interactable[] items = new Interactable[25];
int count = inv.getSize();
void setup() {
  rectMode(CENTER);
  size(1000, 750);
  noStroke();
  smooth();
  treeImg = loadImage("tree.png");
  stoneImg = loadImage("stone.png");
  grassImg = loadImage("grass.png");
  treeImg.resize(50, 50);
  stoneImg.resize(50,50);
  grassImg.resize(50,50);
  // for (int i = 0; i < 100; i++) {
  //   for (int j = 0; j < 100; j++) {
  //     if (j == 4 && i == 4) {
  //       t[i][j] = new Tree(i, j);
  //     } else if (j == 0|| j == 99 || i == 0 || i == 99) {
  //       t[i][j] = new Stone(i, j);
  //     } else {
  //       t[i][j] = new Grass(i, j);
  //     }
  //   }
  // }

  for(int x = 0; x < 10; x++){
    for(int y = 0; y < 10; y++){
      testarr[x][y] = new TestTile(x, y);
    }
  }
  testarr[3][3].makeStone();
  Armor a = new Armor(2, 2);
  items[2] = a;
  Armor b = new Armor(2, 1);
  items[1] = b;
  Armor c = new Armor(2, 3);
  items[3] = c;
  Armor d = new Armor(2, 4);
  items[4] = d;
  Tool t = new Tool(2, 13);
  items[13] = t;
  Tool t2 = new Tool(2,12);
  items[12] = t2;
  // rectMode(CENTER);
}

void draw() {
  // clear();
  background(#256d7b);
  stroke(#000000, 50);
  strokeWeight(2);
  for (int x = 0; x < 10; x++) {
    for (int y = 0; y < 10; y++) {
      // t[x][y].display();
      testarr[x][y].display();
    }
  }
  leanx = 0;
  leany = 0;

  if (!isPaused) {
    inv.ypos = 0;
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

  //white board the nedded transformation to map dx and dy to their tile underneath
  currtilex = 9-((int)dx/50) ;
  currtiley = 6-((int)dy/50) ;
  // Tile currtile = t[currtilex][currtiley-1];
  try{
  // TestTile currtile = testarr[(int)currtilex][(int)currtiley-1];
  //
  // text(currtile.getName()+"", 10, 30);
    text("You're at" + currtilex + ", " + currtiley, 10, 40);
  } catch(Exception e){
    text("COLLIDFE", 10, 40);
  }

  text((dx > 450) + " left bound check", 10, 50);
  text((dy > 300) + " up bound check", 10, 60);
  p.display();
  //System.out.println(items[2].getInfo()[1]);
}

void keyPressed() {

  if (key == 'a')  keyz[0] = true;
  if (key == 's')  keyz[1] = true;
  if (key == 'd')  keyz[2] = true;
  if (key == 'w')  keyz[3] = true;
  if (key == 'i') {
    count = inv.getSize();
    keyz[4] = !keyz[4];
    isPaused = !isPaused;
  }
  if (key == 'o' && !isPaused) p.punch();


  if (isPaused) {
    if (key == 'w') {
      if (inv.y - 10 >= 305) {
        inv.y -= 10;
        inv.moveUp();
      }
    }
    if (key == 's') {
      count--;
      if (inv.y + 15 <= 590) {
        if (count <= 0) {
          inv.y = 305;
          inv.current = 0;
          inv.ypos = 0;
          count = inv.getSize();
        } else {
          inv.y += 10;
          inv.moveDown();
        }
      }
    }
    if (key == 'o') {
      //System.out.println(inv.current + "works");
      inv.use();
    }
    if (key == 'u'){
      inv.unequip();
    }
  }
}

void keyReleased() {
  if (key == 'a')  keyz[0] = false;
  if (key == 's')  keyz[1] = false;
  if (key == 'd')  keyz[2] = false;
  if (key == 'w')  keyz[3] = false;
}
