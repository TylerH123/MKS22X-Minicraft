public class Tool extends Item {
  int type;
  String piece;
  int dmg;
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
    inv.inventory[id]++;
  }
  String name() {
    String typeName = "";
    if (type == 1) typeName = "wooden";
    if (type == 2) typeName = "stone";
    if (type == 3) typeName = "moodstone"; 
    return typeName + " " + piece;
  }
  String[] getInfo() {
    String[] info = new String[4];
    info[0] = name();
    info[1] = dmg + "";
    info[2] = id + "";
    info[3] = type + "";
    return info;
  }
  void interact(int idx) {
    if (p.equipped[5] == null) {
      if (p.equipped[4] == null) {
        inv.remove(id, 1);
        itemList[id] = null;
        p.equipped[4] = this; 
        p.updateDamage();
        inv.items.remove(idx);
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
  boolean canInteract() {
    return true;
  }
}
