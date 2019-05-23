public class Inventory {
  int[] inventory = new int[50]; 
  public Inventory() {
  }
  //displays the inventory menu 
  void display() {
    fill(255);
    rect(520, 375, 100, 100);
  }
  //checks if the inventory contains an item, tgt, equal to or greater than amount 
  boolean contains(int tgt, int amount) {
    if (inventory[tgt] >= amount) {
      return true;
    }
    return false;
  }
  //adds to the inventory at index itemID
  void add(int itemID){
   inventory[itemID]++;
  }
  //reduces the amount of an item at index itemID by amt
  void remove(int itemID, int amt){
    inventory[itemID] -= amt;
  }
}
