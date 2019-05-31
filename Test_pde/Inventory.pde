public class Inventory {
  //array containing id of items that show up in the inventory menu
  int[] inventory = new int[25];
  Interactable[] inter = new Interactable[15]; 
  int[] position = new int[25];
  int ypos = 0;
  //initial height of the pointer
  int y = 285;
  int current = 0;
  String hel = "none";
  String chest = "none"; 
  String leg = "none";
  String boot = "none"; 
  String tool = "fist";
  public Inventory() {
  }
  //displays the inventory menu
  void display() {
    fill(255);
    //menu
    rect(590, 430, 200, 300);
    //pos is used to place the items in inventory in the correct place
    int pos = 0;
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i] != null) {
        fill(0);
        text(inventory[i] + "x " + itemList[i], 510, 293 + 10 * pos);
        position[pos] = i;
        pos++;
      }
    }
    fill(255, 0, 0);
    triangle(500, 285 + ypos, 500, 290 + ypos, 505, 287.5 + ypos);
    fill(255); 
    rect(310, 335, 200, 110);
    if (p.equipped[0] != null) hel = p.equipped[0].name(); 
    if (p.equipped[1] != null) chest = p.equipped[1].name(); 
    if (p.equipped[2] != null) leg = p.equipped[2].name(); 
    if (p.equipped[3] != null) boot = p.equipped[3].name(); 
    if (p.equipped[4] != null) tool = p.equipped[4].name(); 
    else tool = "fist";
    fill(0);
    text("Helmet: " + hel, 215, 295);
    text("Chestpiece: " + chest, 215, 310);
    text("Leggings: " + leg, 215, 325);
    text("Boots: " + boot, 215, 340);
    text("Damage Reduction: " + (int)(p.dmgReduction) + "%", 240, 355);
    text("Current Tool: " + tool, 215, 370);
    text("Damage: " + p.dmg, 280, 385);
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
      items[position[current]].interact();
    }
    catch (NullPointerException e) {
    }
  }
  void unequip() {
    if (p.equipped[4] != null) {
      int tempID = parseInt(p.equipped[4].getInfo()[2]);
      inv.add(tempID);
      itemList[tempID] = p.equipped[4].getInfo()[0];
      items[tempID] = new Tool(parseInt(p.equipped[4].getInfo()[3]), tempID); 
      p.equipped[4] = null;
      p.updateDamage();
    }
  }
}
