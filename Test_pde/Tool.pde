public class Tool extends Item implements Interactable {
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
    itemList[id] = name();
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
  void interact() {
    if (p.equipped[4] == null) {
      inv.remove(id, 1);
      itemList[id] = null;
      p.equipped[4] = this; 
      p.updateDamage();
      items[id] = null;
    } else {
      int tempID = parseInt(p.equipped[4].getInfo()[2]);
      inv.add(tempID);
      itemList[tempID] = p.equipped[4].getInfo()[0];
      items[tempID] = new Tool(parseInt(p.equipped[4].getInfo()[3]), tempID); 
      inv.remove(id,1);
      itemList[id] = null; 
      p.equipped[4] = this; 
      p.updateDamage();
      items[id] = null;
    }
  }
}
