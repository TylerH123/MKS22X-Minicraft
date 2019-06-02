public abstract class Item {
  int id;
  String basic; 
  public Item(){
  }
  abstract String name();
  abstract boolean canInteract(); 
  abstract String[] getInfo();
  abstract void interact(int idx);
  void place() {
  };
}
