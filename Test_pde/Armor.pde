public class Armor extends Item {
  int type;
  String piece;
  float dmgReduc;
  int pieceStrength;
  Armor(int type, int id) {
    this.type = type;
    this.id = id;
    if (id == 1) {
      pieceStrength = 2;
      piece = "helmet";
    }
    if (id == 2) {
      pieceStrength = 4;
      piece = "chestpiece";
    }
    if (id == 3) {
      pieceStrength = 3;
      piece = "leggings";
    }
    if (id == 4) {
      pieceStrength = 1;
      piece = "boots";
    }
    dmgReduc = .015 * (type * pieceStrength) * 100;
  }
  String name() {
    String typeName = "";
    if (type == 1) typeName = "wooden";
    if (type == 2) typeName = "stone";
    if (type == 3) typeName = "moodstone";
    return typeName + " " + piece;
  }
  String[] getInfo() {
    String[] info = new String[2];
    info[0] = name();
    info[1] = dmgReduc + "";
    return info;
  }
  void interact(int idx) {
    inv.remove(id, 1);
    itemList[id] = null;
    p.equipped[id-1] = this; 
    p.updateArmor();
    inv.items.remove(idx);
    inv.updateInventory();
    if (inv.current == inv.items.size() - 1) {
      inv.current--;
      inv.ypos -= 10; 
      inv.y -= 10;
    }
  }
  boolean canInteract() {
    return true;
  }
}
