public class TestTile {

  int x, y;
  float radius = 0.5;
  float health;
  boolean isStone;
  boolean isTree; 
  boolean wasStone = false; 
  boolean wasTree = false; 
  public TestTile(int x, int y, int health) {
    this.x = x;
    this.y = y;
    this.health = health;
  }

  void display() {
    if (health <= 0) {
      if (wasStone) {
        isStone = false;
        Resource s = new Resource(15, 3); 
        itemList[15] = s; 
        wasStone = false;
      }
      if (wasTree) {
         isTree = false; 
         Resource t = new Resource(14,3); 
         itemList[14] = t;
         wasTree = false; 
         if ((int)(Math.random() * 100) < 70) {
           Consumable a = new Consumable(19);
           if (itemList[19] == null) itemList[19] = a;  
         }
      }
    }
    if (isStone) {
      //fill(157, 180, 119);
      image(grassImg, (x*60) + dx - 30, (y*60)+dy);
      image(stoneImg, (x*60) + dx - 30, (y*60) + dy);
      return;
    }
    if (isTree) {
      image(grassImg, (x*60) + dx - 30, (y*60)+dy);
      image(treeImg, (x*60) + dx - 30, (y*60) + dy);
      return;
    }
    // fill(100, 50, 118);
    // rect((x*60) + dx - 30, (y*60) + dy, 60, 60);
    imageMode(CENTER);
    image(grassImg, (x*60)+dx - 30, (y*60)+dy);
  }

  String getName() {
    return "genericboi";
  }
  void makeTree() {
    isTree = true; 
    wasTree = true;
  }
  void makeStone() {
    isStone = true;
    wasStone = true;
  }

  int compareTo(TestTile other) {
    if (this.x < other.x) {
      return -1;
    }
    if (this.x > other.x) {
      return 1;
    }
    return 0;
  }
}
