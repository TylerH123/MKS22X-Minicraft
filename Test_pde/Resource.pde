public class Resource extends Item {

  Resource(int r) {
    id = r;
  }
  String name() {
    return "";
  }
  boolean canInteract() {
    return false;
  }
}
