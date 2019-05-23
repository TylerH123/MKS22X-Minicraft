public class Inventory {
  int[] inventory = new int[50]; 
  public Inventory() {
  }
  void display() {
    fill(255);
    rect(520, 375, 100, 100);
  }
  boolean contains(int tgt, int amount) {
    if (inventory[tgt] == amount) {
      return true;
    }
    return false;
  }
}
