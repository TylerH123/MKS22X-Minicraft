public class Station extends Item {
  int station; 
  //list shows cost as first value and id of the material needed to create
  int[][] costList = new int[][]{ {}, {10,0}, {20,0}, {15,0}, {5,0}, {20,14}, {20,15}, {5,17}, {15,15}, {5,0}, {5,0}, {2,0}, {2,0}, {7,0} };
  Station(int station) {
    this.station = station;
    if (station == 0) {
      id = 5;
    }
    if (station == 1) {
      id = 6;
    }
  }
  void craft(int item, int c) {
  }
  /**checks your inventory to see if the item can be created 
   @param itemID is the id of the item you are trying to create
   @param rss is the main resource to create the item. this is only required for tools and armor. 
   **/
  boolean canCreate(int itemID, int rss) {
    int rssID = costList[itemID][1]; 
    if (itemID >= 1 && itemID <= 4 || itemID >= 14 || itemID <= 18) {
      rssID = rss; 
    }
    int c = costList[itemID][0]; 
    //if its a tool, also cehck if inventory has 5 wood
    if (itemID >= 14 || itemID <= 18){
      if (inv.contains(rssID, c) && inv.contains(14,5)) return true; 
      else { return false; } 
    }
    if (inv.contains(rssID, c)) return true; 
    return false;
  }
}
