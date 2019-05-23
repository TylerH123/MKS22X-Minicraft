public class Station extends Item{
  int station; 
  int cost; 
  Station(int station){
    this.station = station;
    if (station == 0){
      id = 5;
    }
    if (station == 1){
     id = 6;  
    }
  }
  void craft(int item, int c){
    if (canCreate(item)){
      
    }
    
  }
  boolean canCreate(int s) {
    int c = 0; 
    int itemID = 0; 
    if (s == 0) {
      c = 20;
      itemID = 500;
    }
    if (s == 1) {
      c = 20;
      itemID = 501; 
    }
    if (inv.contains(itemID,c)) return true; 
    return false; 
  }
}
