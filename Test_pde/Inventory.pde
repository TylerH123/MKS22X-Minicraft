public class Inventory {
  int[] inventory = new int[50];
  //array containing id of items that show up in the inventory menu
  float[] position = new float[50];
  int ypos = 0;
  //initial height of the pointer
  int y = 305;
  int current = 0;
  public Inventory() {
  }
  //displays the inventory menu
  void display() {
    fill(255);
    //menu
    rect(520, 300, 200, 295);
    //pos is used to place the items in inventory in the correct place
    int pos = 0;
    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i] != null) {
        fill(0);
        text(inventory[i] + "x " + itemList[i], 540, 313 + 10 * pos);
        position[pos] = i;
        pos++;
      }
    }
    fill(255, 0, 0);
    triangle(530, 305 + ypos, 530, 310 + ypos, 535, 307.5 + ypos);
  }
  int getSize() {
    int size = 0;
    for (String s : itemList) {
      if (s != null) {
        size++;
      }
    }
    return size;
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
    ypos -= 10;
    current--;
  }
  void moveDown() {
    ypos += 10;
    current++;
  }
  void use() {
    try {
      items[current].interact();
    }
    catch (NullPointerException e) {
    }
  }
}
