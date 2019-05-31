public class Inventory {
  //array that acts as a dictionary for items. The index is the ID of the items
  int[] inventory = new int[25];
  //array list of the items in inventory with no null values in between each element
  ArrayList<Item> invItem = new ArrayList<Item>();
  int ypos = 0;
  //initial height of the pointer
  int y = 285;
  int current = 0;
  //variables for armor slots. default is none
  String hel = "none";
  String chest = "none"; 
  String leg = "none";
  String boot = "none"; 
  //variable for tool slot. default is fist
  String tool = "fist";
  
  public Inventory() {
  }
  //displays the menus
  void display() {
    //inventory menu
    fill(255);
    //menu
    rect(590, 430, 200, 300);
    //space is used to space the items in inventory correctly
    int space = 0;
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i] != null) {
        invItem.add(itemList[i]);
        fill(0);
        text(inventory[i] + "x " + itemList[i].name(), 510, 293 + 10 * space);
        space++; 
      }
    }
    //pointer
    fill(255, 0, 0);
    triangle(500, 285 + ypos, 500, 290 + ypos, 505, 287.5 + ypos);
    //armor menu
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
  //checks if the inventory contains an item, tgt, equal to or greater than amount
  boolean contains(int tgt, int amount) {
    if (inventory[tgt] >= amount) {
      return true;
    }
    return false;
  }
  //adds to the quantity of item itemID in inventory array
  void add(int itemID) {
    inventory[itemID]++;
  }
  //reduces the quantity of item itemID by amt in inventory array
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
    if (invItem.get(current).canInteract()){
      invItem.get(current).interact();
    }
  }
  void unequip() {
    if (p.equipped[4] != null) {
      int tempID = parseInt(p.equipped[4].getInfo()[2]);
      inv.add(tempID);
      Tool t = new Tool(parseInt(p.equipped[4].getInfo()[3]), tempID);
      itemList[tempID] = t;
      p.equipped[4] = null;
      p.updateDamage();
    }
  }
}
