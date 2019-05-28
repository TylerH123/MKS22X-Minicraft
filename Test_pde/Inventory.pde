public class Inventory {
  int[] inventory = new int[50];
  //array containing id of items that show up in the inventory menu
  float[] position = new float[50];
  int ypos = 0;
  //initial height of the pointer
  int y = 305;
  int current = 0;
  String hel = "none";
  String chest = "none"; 
  String leg = "none";
  String boot = "none"; 
  public Inventory() {
  }
  //displays the inventory menu
  void display() {
    fill(255);
    //menu
    rect(520, 300, 200, 295);
    //pos is used to place the items in inventory in the correct place
    int pos = 0;
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i] != null) {
        fill(0);
        text(inventory[i] + "x " + itemList[i], 540, 313 + 10 * pos);
        position[pos] = i;
        pos++;
      }
    }
    fill(255, 0, 0);
    triangle(530, 305 + ypos, 530, 310 + ypos, 535, 307.5 + ypos);
    fill(255); 
    rect(230, 300, 200, 85);
    if (itemList[1] != null) hel = itemList[1];
    if (itemList[2] != null) chest = itemList[2];
    if (itemList[3] != null) leg = itemList[3];
    if (itemList[4] != null) boot = itemList[4];
    fill(0);
    text("Helmet: " + hel, 235, 315);
    text("Chestpiece: " + chest, 235, 330);
    text("Leggings: " + leg, 235, 345);
    text("Boots: " + boot, 235, 360);
    text("Damage Reduction: " + p.dmgReduction, 255, 375);
  }
  int getSize() {
    int size = 0;
    for (String s : itemList) {
      if (s != null) {
        size++;
      }
    }
    return size;
  }
  //checks if the inventory contains an item, tgt, equal to or greater than amount
  boolean contains(int tgt, int amount) {
    if (inventory[tgt] >= amount) {
      return true;
    }
    return false;
  }
  //adds to the inventory at index itemID
  void add(int itemID) {
    inventory[itemID]++;
  }
  //reduces the amount of an item at index itemID by amt
  void remove(int itemID, int amt) {
    inventory[itemID] -= amt;
  }
  void moveUp() {
    ypos -= 10;
    current--;
  }
  void moveDown() {
    ypos += 10;
    current++;
  }
  void use() {
    try {
      items[current].interact();
    }
    catch (NullPointerException e) {
    }
  }
}
