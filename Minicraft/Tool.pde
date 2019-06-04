public class Tool extends Item {
  int type;
  String piece;
  int dmg;
  Tool(int id) {
    this.id = id; 
    if (id == 9) {
      piece = "pickaxe";
    }
    if (id == 10) {
      piece = "axe";
    }
    if (id == 11) {
      piece = "shovel";
    }
    if (id == 12) {
      piece = "hoe";
    }
    if (id == 13) {
      piece = "sword";
    }
    basic = piece;
  }
  Tool(int type, int id) {
    this.id = id; 
    this.type = type; 
    if (id == 9) {
      dmg = 3 * type; 
      piece = "pickaxe";
    }
    if (id == 10) {
      dmg = 3 * type; 
      piece = "axe";
    }
    if (id == 11) {
      dmg = 2 * type; 
      piece = "shovel";
    }
    if (id == 12) {
      dmg = 2 * type; 
      piece = "hoe";
    }
    if (id == 13) {
      dmg = 5 * type; 
      piece = "sword";
    }
    basic = piece; 
    inv.inventory[id]++;
  }
  //return name of tool
  String name() {
    String typeName = "";
    if (type == 1) typeName = "wooden";
    if (type == 2) typeName = "stone";
    if (type == 3) typeName = "moodstone"; 
    return typeName + " " + piece;
  }
  //returns an array containing id, name, damage, and tier 
  String[] getInfo() {
    String[] info = new String[4];
    info[0] = name();
    info[1] = dmg + "";
    info[2] = id + "";
    info[3] = type + "";
    return info;
  }
  /**equip the tool or swap the tool
   *@param idx is the index of the tool in items array
   **/
  void interact(int idx) {
    if (p.equipped[5] == null) {
      if (p.equipped[4] == null) {
        inv.removeAmt(id, 1);
        if (inv.inventory[id] == 0) itemList[id] = null;
        p.equipped[4] = this; 
        p.updateDamage();
        if (inv.inventory[id] == 0) inv.items.remove(idx);
        inv.updateInventory();
        if (inv.current == inv.items.size() && inv.y - 10 > 275) {
          inv.current--;
          inv.ypos -= 10; 
          inv.y -= 10;
        }
      } else {
        inv.unequip();
        interact(idx);
      }
    }
  }
  //tool can interact
  boolean canInteract() {
    return true;
  }
}
