public class Chest extends Item implements Placeable {
  Inventory chestInv = new Inventory();
  Chest() {
    id = 22;
  }
  String[] getInfo() {
    String[] info = new String[10];

    return info;
  }
  String name() {
    return "";
  }
  void place() {
  }
  void interact() {
  }
  boolean canInteract() {
    return true;
  }
}
