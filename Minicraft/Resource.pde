public class Resource extends Item {
  String name;
  Resource(int r) {
    id = r;
    if (r == 14) name = "wood";
    if (r == 15) name = "stone";
    if (r == 16) name = "sand";
    if (r == 17) name = "iron";
    if (r == 18) name = "moodstone";
  }
  String name() {
    return name;
  }
  String[] getInfo(){
   String[] info = new String[3]; 
   info[0] = id + ""; 
   info[1] = name; 
   return info; 
   
  }
  void interact(int idx){
  }
  boolean canInteract() {
    return false;
  }
}
