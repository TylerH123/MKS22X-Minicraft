public class Resource extends Item {

  Resource(int r) {
    id = r;
  }
  String name() {
    return "";
  }
  String[] getInfo(){
   return new String[2]; 
  }
  void interact(){
  }
  boolean canInteract() {
    return false;
  }
}
