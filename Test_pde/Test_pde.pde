boolean keyz[] = new boolean [5];
boolean isPaused = false;
static boolean cannotwalk[] = new boolean[4];
static float dx, dy;
PImage treeImg, stoneImg; 
static int currtilex;
static int currtiley;

float leanx, leany;
static Tile[][] t = new Tile[100][100];
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
  size(1000, 750);
  noStroke();
  smooth();
  treeImg = loadImage("tree.png");
  stoneImg = loadImage("stone.png");
  treeImg.resize(50, 50); 
  stoneImg.resize(50,50);
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      if (j == 4 && i == 4) {
        t[i][j] = new Tree(i*50, j*50);
      } else if (j == 0|| j == 99 || i == 0 || i == 99) {
        t[i][j] = new Stone(i*50, j*50);
      } else {
        t[i][j] = new Grass(i*50, j*50);
      }
    }
  }
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
  background(0, 0, 255);
  stroke(#000000, 50);
  strokeWeight(2);
  for (int x = 0; x < 100; x++) {
    for (int y = 0; y < 100; y++) {
      t[x][y].display();
    }
  }
  leanx = 0;
  leany = 0;
  // cannotwalk[0] = p.getA();
  // cannotwalk[1] = p.getS();
  // cannotwalk[2] = p.getD();
  // cannotwalk[3] = p.getW();

  if (!isPaused) {
    inv.ypos = 0;
    if (collideDetect(keyz[0], cannotwalk[0])) {
      dx+= 5;
      leanx = -5;
      direction = "west";
    }
    if (collideDetect(keyz[1], cannotwalk[1])) {
      dy-= 5;
      leany = 5;
      direction = "south";
    }
    if (collideDetect(keyz[2], cannotwalk[2])) {
      dx-= 5;
      leanx = 5;
      direction = "east";
    }
    if (collideDetect(keyz[3], cannotwalk[3])) {
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
  currtilex = 9-(int)dx/50 - 1;
  currtiley = 6-(int)dy/50 - 1;
  // text(t[currtilex][currtiley].getName(), 10, 30);
  // text("You're at tile" + (currtilex) + ", " + (currtiley), 10, 40);
  // text("thing to my north is: " + t[currtiley - 1][currtilex].getName(),  10, 50);
  // text("is my north blocked?: " + p.getW(), 10, 60);
  p.display();
  //System.out.println(items[2].getInfo()[1]);
}


static boolean collideDetect(boolean keypress, boolean cannotwalk) {
  if (keypress && cannotwalk) {
    return false;
  }
  if (keypress && !cannotwalk) {
    return true;
  }
  return false;

  // return keypress;
}


void keyPressed() {
  cannotwalk[0] = p.getA();
  cannotwalk[1] = p.getS();
  cannotwalk[2] = p.getD();
  cannotwalk[3] = p.getW();


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
