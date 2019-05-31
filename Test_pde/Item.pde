public abstract class Item implements Interactable{
  int id;
  public Item(){
  }
  abstract String name();
  abstract boolean canInteract(); 
}
