public class Consumable extends Item { 
  String name; 
  public Consumable(int id) {
    this.id = id;
    if (id == 19) name = "apple";
    if (id == 20) name = "bread";
    inv.inventory[id]++;
  }
  //returns name of conssumable
  String name() {
    return name;
  }
  //consumable can interact
  boolean canInteract() {
    return true;
  }
  //returns an array containing id and name
  String[] getInfo() {
    String[] info = new String[2];
    info[0] = id + ""; 
    info[1] = name; 
    return info;
  }
  /**use the consumable to heal yourself
   *@param idx is the index of the consumable in items array
   **/
  void interact(int idx) {
    inv.removeAmt(id, 1);
    if (inv.inventory[id] == 0) itemList[id] = null;
    if (inv.inventory[id] == 0) inv.items.remove(idx);
    inv.updateInventory();
    if (inv.current == inv.items.size() && inv.inventory[id] == 0) {
      inv.current--;
      inv.ypos -= 10; 
      inv.y -= 10;
    }
    if (id == 19) p.hp += 10;
    if (id == 20) p.hp += 20;  
    if (p.hp > 100) p.hp = 100;
  }
  void place() {
  }
}
