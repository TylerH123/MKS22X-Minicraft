public class Station extends Item {
  int station; 
  int[][] costList = new int[][]{ {10},{20},{15},{5},{20},{20},{5},{15},{5},{5},{2},{2},{7} };
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
    if (canCreate(item)) {
    }
  }
  /**checks your inventory to see if the item can be created 
   @param itemID is the id of the item you are trying to create
   @param rss is the main resource to create the item. this is only required for tools and armor. 
   **/
  boolean canCreate(int itemID, int rss) {
    int rssID = 0; 
    if (itemID >= 1 && itemID <= 4 || itemID >= 14 || itemID <= 18) {
      rssID = rss; 
    }
    int c = 0; 
    
    if (inv.contains(itemID, c)) return true; 
    return false;
  }
}
