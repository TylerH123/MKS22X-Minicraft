public class Armor extends Item {
  int type;
  String piece;
  float dmgReduc;
  int pieceStrength;
  int tier; 
  Armor (int id) {
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
    basic = piece;
  }
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
    basic = piece; 
    inv.inventory[id]++;
    if (type == 14) tier = 1; 
    if (type == 15) tier = 2; 
    if (type == 17) tier = 3; 
    if (type == 18) tier = 4; 
    dmgReduc = .015 * (tier * pieceStrength) * 100;
  }
  //returns name of armor
  String name() {
    String typeName = "";
    if (type == 14) typeName = "wooden";
    if (type == 15) typeName = "stone";
    if (type == 17) typeName = "iron";
    if (type == 18) typeName = "moodstone";
    return typeName + " " + piece;
  }
  //returns an array containing name, damage reduction, tier of the armor, and the piece
  String[] getInfo() {
    String[] info = new String[4];
    info[0] = name();
    info[1] = dmgReduc + "";
    info[2] = type + "";
    info[3] = piece; 
    return info;
  }
  /** checks to see if armor slot for this armor is filled, 
   *if filled, unequip it and equip this 
   *@param idx is the index of this armor in the items array
   **/
  void interact(int idx) {
    if (p.equipped[this.id - 1] == null) {
      inv.removeAmt(id, 1);
      if (inv.inventory[id] == 0) itemList[id] = null;
      p.equipped[id-1] = this; 
      p.updateArmor();
      if (inv.inventory[id] == 0) inv.items.remove(idx);
      inv.updateInventory();
      if (inv.current == inv.items.size() && inv.inventory[id] == 0) {
        inv.current--;
        inv.ypos -= 10; 
        inv.y -= 10;
      }
    } else {
      inv.unequipArmor(this.id);
      interact(idx);
    }
  }
  //armor can interact 
  boolean canInteract() {
    return true;
  }
}
