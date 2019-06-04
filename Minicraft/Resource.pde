public class Resource extends Item {
  String name;
  Resource(int r, int amt) {
    id = r;
    if (id == 14) name = "wood";
    if (id == 15) name = "stone";
    if (id == 16) name = "sand";
    if (id == 17) name = "iron";
    if (id == 18) name = "moodstone";
    inv.inventory[id] = amt;
  }
  //return name of resource
  String name() {
    return name;
  }
  //returns an array containing id and name
  String[] getInfo(){
   String[] info = new String[3]; 
   info[0] = id + ""; 
   info[1] = name; 
   return info; 
  }
  //resources cannot interact
  void interact(int idx){
  }
  //resources cannot interact
  boolean canInteract() {
    return false;
  }
}
