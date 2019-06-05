import java.util.Comparator;
import java.util.Collections;
import java.util.Random;

//array of booleans for keys pressed 0-3 is for movement 4 is for inventory 5 is for sprinting
boolean keyz[] = new boolean[6];
//boolean to check if game is paused
boolean isPaused = false;
//boolean to check if a station menu is open
boolean stationMenu = false;
static boolean canWalk[] = new boolean[]{true, true, true, true};
static float dx, dy;
//images for tree, stone, and grass
PImage treeImg, stoneImg, grassImg, workBImg, pup, pdown, pleft, pright;

static float currtilex;
static float currtiley;
static float xcoor;
static float ycoor;

float leanx, leany;
static ArrayList<TestTile> stonesx = new ArrayList<TestTile>();
static ArrayList<TestTile> stonesy = new ArrayList<TestTile>();
static ArrayList<TestTile> treesx = new ArrayList<TestTile>();
static ArrayList<TestTile> treesy = new ArrayList<TestTile>();

boolean collidingStation;
static TestTile[][] testarr= new TestTile[100][100];
//inventory
Inventory inv = new Inventory();
//player
Player p = new Player();
//direction that player is facing
String direction = "";
//list shows cost as first value and id of the material needed to create
int[][] costList = new int[][]{ {}, {10, 0}, {20, 0}, {15, 0}, {5, 0}, {20, 14}, {20, 15}, {5, 17}, {15, 15}, {5, 0}, {5, 0}, {2, 0}, {2, 0}, {7, 0} };
//list with all the items in inventory
Item[] itemList = new Item[25];
ArrayList<Station> stations = new ArrayList<Station>();
Station currentStation;
//array for workbench. this allows for items to be crafted
Item[] craftables = new Item[] { new Armor(1), new Armor(2), new Armor(3), new Armor(4), new Station(5, 1), new Station(6, 1), new Station(7, 1), new Station(8, 1), new Tool(9), new Tool(10), new Tool(11), new Tool(12), new Tool(13) };
void setup() {
  rectMode(CENTER);
  shapeMode(CENTER);
  size(1000, 750);
  noStroke();
  smooth();
  direction = "south";
  treeImg = loadImage("tree.png");
  stoneImg = loadImage("stone.png");
  grassImg = loadImage("grass.png");
  workBImg = loadImage("workbench.png");
  pup = loadImage("psprites/tu.png");
  pdown = loadImage("psprites/td.png");
  pleft = loadImage("psprites/tl.png");
  pright = loadImage("psprites/tr.png");
  pup.resize(40, 40);
  pdown.resize(40, 40);
  pleft.resize(40, 40);
  pright.resize(40, 40);
  treeImg.resize(60, 60);
  stoneImg.resize(60, 60);
  grassImg.resize(60, 60);
  workBImg.resize(60, 60);

  Generator g = new Generator();

  for (int x = 0; x < 100; x++) {
    for (int y = 0; y < 100; y++) {
      testarr[x][y] = new TestTile(x, y, 10);
      if(g.data[x][y] == 1){
        testarr[x][y].makeStone();
        // stones.add(testarr[x][y]);
      }

      if(g.data[x][y] == 2){
        testarr[x][y].makeTree();
        // stones.add(testarr[x][y]);
      }
    }
  }

  for (int x = 10; x < 16; x++) {
    for (int y = 10; y < 16; y++) {
      testarr[x][y].makeStone();
      stonesx.add(testarr[x][y]);
      stonesy.add(testarr[x][y]);
    }
  }
  for (int x = 17; x < 20; x++) {
    for (int y = 17; y < 20; y++) {
      testarr[x][y].makeTree();
      treesx.add(testarr[x][y]);
      treesy.add(testarr[x][y]);
    }
  }

  testarr[3][3].makeStone();
  Armor a = new Armor(14, 2);

  stonesx.add(testarr[3][3]);
  stonesy.add(testarr[3][3]);

  TileXComparator xs = new TileXComparator();
  TileYComparator ys = new TileYComparator();

  Collections.sort(stonesx, xs);
  Collections.sort(stonesy, ys);
  Collections.sort(treesx, xs);
  Collections.sort(treesy, ys);

  itemList[2] = a;
  Armor b = new Armor(15, 1);
  itemList[1] = b;
  Armor c = new Armor(17, 3);
  itemList[3] = c;
  Armor d = new Armor(18, 4);
  itemList[4] = d;
  Tool t = new Tool(2, 13);
  itemList[13] = t;
  Tool t2 = new Tool(2, 12);
  itemList[12] = t2;
  Station s = new Station(5);
  itemList[5] = s;
  stations.add(s);
  itemList[14] = new Resource(14, 100);
  Consumable ap = new Consumable(19);
  itemList[19] = ap;
  Tool t3 = new Tool(2, 9);
  itemList[9] = t3;
  Tool t4 = new Tool(2, 10);
  itemList[10] = t4;
}

void draw() {
  background(#256d7b);
  stroke(#000000, 50);
  strokeWeight(2);
  for (int x = 0; x < 100; x++) {
    for (int y = 0; y < 100; y++) {
      // t[x][y].display();
      testarr[x][y].display();
    }
  }
  leanx = 0;
  leany = 0;

  currtilex = 9-(dx/60) - 1;
  currtiley = 6-(dy/60) - 1;

  int relevantxstart = p.first(stonesx, 0, stonesx.size() - 1, (int)currtilex, stonesx.size(), 'x');
  int relevantxend = p.last(stonesx, 0, stonesx.size() - 1, (int)currtilex, stonesx.size(), 'x');

  int relevantystart = p.first(stonesy, 0, stonesy.size() - 1, (int)currtiley, stonesy.size(), 'y');
  int relevantyend = p.last(stonesy, 0, stonesy.size() - 1, (int)currtiley, stonesy.size(), 'y');

  for (int x = (int)currtilex - 2; x < currtilex + 2; x++) {
    for (int y = (int)currtiley - 2; y < currtiley + 2; y++) {
      if (x > 0 && y > 0 && x < 100 && y < 100) {
        p.isCollide(testarr[x][y]);
      }
    }
  }

  if (!isPaused) {
    if (keyz[0] && canWalk[0]) {
      dx += (5 + p.vel);
      leanx = -5;
      direction = "west";
      if (keyz[5]) p.isSprinting = true;
    }
    if (keyz[1] && canWalk[1]) {
      dy-= (5 + p.vel);
      leany = 5;
      direction = "south";
      if (keyz[5]) p.isSprinting = true;
    }
    if (keyz[2] && canWalk[2]) {
      dx-= (5 + p.vel);
      leanx = 5;
      direction = "east";
      if (keyz[5]) p.isSprinting = true;
    }
    if (keyz[3] && canWalk[3]) {
      dy+= (5 + p.vel);
      leany = -5;
      direction = "north";
      if (keyz[5]) p.isSprinting = true;
    }
    if (keyz[5]) {
      if (!keyz[0] && !keyz[1] && !keyz[2] && !keyz[3]) {
        if (p.stamina < 100.0) {
          p.stamina += 0.1;
          p.isSprinting = false;
        }
      }
      if (p.stamina > 0) {
        p.vel = 2;
      } else {
        p.vel = 0;
        keyz[5] = !keyz[5];
        p.isSprinting = false;
      }
    } else {
      p.vel = 0;
      p.isSprinting = false;
      if (p.stamina < 100.0) p.stamina += 0.1;
    }
    if (p.isSprinting) p.stamina -= .1;
  }

  fill(5);

  //text("" + dx + ", " + dy, 10, 10);
  //text(direction, 10, 20);

  //white board the nedded transformation to map dx and dy to their tile underneath
  currtilex = 9-(dx/60) - 1;
  currtiley = 6-(dy/60) - 1;
  xcoor = (dx/60);
  ycoor = (dy/60);
  // Tile currtile = t[currtilex][currtiley-1];
  try {
    //text("You're at" + currtilex + ", " + currtiley, 10, 40);
  }
  catch(Exception e) {
    //text("COLLIDFE", 10, 40);
  }
  for (Station s : stations) {
    s.display();
    p.isCollideStation(s);
    if (!isPaused && s.isPlaced) {
      if (canWalk[0] && keyz[0]) s.px += (5 + p.vel);
      if (canWalk[1] && keyz[1]) s.py -= (5 + p.vel);
      if (canWalk[2] && keyz[2]) s.px -= (5 + p.vel);
      if (canWalk[3] && keyz[3]) s.py += (5 + p.vel);
    }
    //System.out.println(s.isPlaced);
  }
  //text((dx > 450) + " left bound check", 10, 50);
  //text((dy > 300) + " up bound check", 10, 60);
  //text("Sprinting: " + keyz[5], 10, 70);
  //text("Velocity:  " + p.vel, 10, 80);
  if (keyz[4]) {
    inv.display();
  }
  if (stationMenu) {
    currentStation.interact(currentStation.id);
  }
  p.display();
  //System.out.println(items[2].getInfo()[1]);
}

void keyPressed() {
  if (!isPaused) {
    if (key == 'a')  keyz[0] = true;
    if (key == 's')  keyz[1] = true;
    if (key == 'd')  keyz[2] = true;
    if (key == 'w')  keyz[3] = true;
    if (key == 'k') {
      keyz[5] = !keyz[5];
    }
    if (key == 'p') {
      if (p.equipped[5] != null) p.equipped[5].place();
      else p.punch();
    }
  }
  if (key == 'i') {
    if (!stationMenu) {
      inv.updateInventory();
      keyz[4] = !keyz[4];
      isPaused = !isPaused;
      inv.current = 0;
      inv.ypos = 0;
    } else {
      stationMenu = false;
      isPaused = !isPaused;
    }
  }

  if (key == 'o' && !stationMenu) {
    if (collidingStation) {
      stationMenu = true;
      isPaused = true;
    }
  }

  if (isPaused) {
    if (key == 'w') {
      if (!stationMenu) {
        if (inv.y - 10 >= 275) {
          inv.y -= 10;
          inv.moveUp();
          if (inv.current < 0) {
            int i = inv.items.size();
            inv.y = (i-1) * 10 + 285;
            inv.ypos = (i-1) * 10;
            inv.current = i - 1;
          }
        }
      } else {
        if (currentStation.cy - 10 >= 30) {
          currentStation.cy -= 10;
          currentStation.moveUp();
          //System.out.println(currentStation.current);
          if (currentStation.current < 0) {
            currentStation.cy = (craftables.length - 1) * 10 + 40;
            currentStation.cypos = (craftables.length - 1) * 10;
            currentStation.current = craftables.length - 1;
          }
        }
      }
    }
    if (key == 's') {
      if (!stationMenu) {
        if (inv.y + 15 <= 580) {
          inv.y += 10;
          inv.moveDown();
          if (inv.current >= inv.items.size()) {
            inv.y = 285;
            inv.current = 0;
            inv.ypos = 0;
          }
        }
      } else {
        if (currentStation.cy + 10 <= 365) {
          currentStation.cy += 10;
          currentStation.moveDown();
          if (currentStation.current >= craftables.length) {
            currentStation.cy = 40;
            currentStation.current = 0;
            currentStation.cypos = 0;
          }
        }
      }
    }
    if (key == 'o') {
      if (!stationMenu) inv.use();
      else currentStation.interact();
    }
    if (key == 'u') {
      if (p.equipped[5] == null) {
        inv.unequip();
      } else {
        inv.returnToInv();
      }
    }
    if (key == 'p' && stationMenu) {
      stationMenu = false;
      currentStation.isPlaced = false;
      inv.inventory[currentStation.id]++;
      itemList[currentStation.id] = currentStation;
      inv.items.add(currentStation);
      isPaused = !isPaused;
    }
    if (key == CODED && stationMenu) {
      if (keyCode == DOWN) {
        if ((currentStation.current >= 0 && currentStation.current <= 3) || (currentStation.current >= 8 && currentStation.current <= 12)) {
          if (currentStation.c2y + 10 <= 365) {
            currentStation.c2y += 10;
            currentStation.moveDown2();
            if (currentStation.current2 >= 4) {
              currentStation.c2y = 40;
              currentStation.current2 = 0;
              currentStation.c2ypos = 0;
            }
          }
        }
      }
      if (keyCode == UP) {
        if ((currentStation.current >= 0 && currentStation.current <= 3) || (currentStation.current >= 8 && currentStation.current <= 12)) {
          if (currentStation.c2y - 10 >= 30) {
            currentStation.c2y -= 10;
            currentStation.moveUp2();
            if (currentStation.current2 < 0) {
              currentStation.c2y = 70;
              currentStation.c2ypos = 30;
              currentStation.current2 = 3;
            }
          }
        }
      }
    }
  }
}
void keyReleased() {
  if (key == 'a')  keyz[0] = false;
  if (key == 's')  keyz[1] = false;
  if (key == 'd')  keyz[2] = false;
  if (key == 'w')  keyz[3] = false;
}

static float distcalc(float p1x, float p1y, float p2x, float p2y) {
  float deltax = abs(p1x - p2x);
  float deltay = abs(p1y - p2y);
  return sqrt(pow(deltax, 2) + pow(deltay, 2));
}
