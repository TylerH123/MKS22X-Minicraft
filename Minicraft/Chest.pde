public class Chest extends Item{
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
  void interact(int idx) {
  }
  boolean canInteract() {
    return true;
  }
}
