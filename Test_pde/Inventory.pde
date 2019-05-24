public class Inventory {
  int[] inventory = new int[50];
  public Inventory() {
  }
  //displays the inventory menu
  void display() {
    fill(255);
    rect(520, 300, 200, 300);
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i] != null) {
        fill(0);
        text(inventory[i] + " " + itemList[i], 540, 313 + 10 * i);
      }
    }
    fill(255, 0, 0);
    triangle(530, 305, 530, 310, 535, 307.5);
  }
  //checks if the inventory contains an item, tgt, equal to or greater than amount
  boolean contains(int tgt, int amount) {
    if (inventory[tgt] >= amount) {
      return true;
    }
    return false;
  }
  //adds to the inventory at index itemID
  void add(int itemID) {
    inventory[itemID]++;
  }
  //reduces the amount of an item at index itemID by amt
  void remove(int itemID, int amt) {
    inventory[itemID] -= amt;
  }
  void moveUp() {
  }
}
