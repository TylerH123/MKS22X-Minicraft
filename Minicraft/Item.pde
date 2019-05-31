public abstract class Item {
  int id;
  public Item(){
  }
  abstract String name();
  abstract boolean canInteract(); 
  abstract String[] getInfo();
  abstract void interact(int idx);
  void place() {
  };
}