public class Station extends Item {
  int station; 
  //list shows cost as first value and id of the material needed to create
  int[][] costList = new int[][]{ {}, {10, 0}, {20, 0}, {15, 0}, {5, 0}, {20, 14}, {20, 15}, {5, 17}, {15, 15}, {5, 0}, {5, 0}, {2, 0}, {2, 0}, {7, 0} };
  Station(int station) {
    this.station = station;
    if (station == 0) {
      id = 5;
    }
    if (station == 1) {
      id = 6;
    }
    if (station == 2) {
      id = 7;
    }
    if (station == 3) {
      id = 8;
    }
  }
  /**first, checks your inventory to see if the item can be created. then creates it
   @param itemID is the id of the item you are trying to create
   @param rss is the main resource to create the item. this is only required for tools and armor. 
   **/
  String craft(int itemID, int rss) {
    int rssID = costList[itemID][1]; 
    //if item is either armor piece or tool
    if (itemID >= 1 && itemID <= 4 || itemID >= 14 || itemID <= 18) {
      rssID = rss;
    }
    int c = costList[itemID][0]; 
    //if its a tool, also cehck if inventory has 5 wood
    if (itemID >= 14 || itemID <= 18) {
      if (inv.contains(rssID, c) && inv.contains(14, 5)){
        inv.remove(rssID,c); 
        inv.remove(14,5); 
        inv.add(itemID); 
        return "Successfully crafted"; 
      }
      else { 
        return "Failed to craft";
      }
    }
    //if anything else, check inventory for the resources 
    if (inv.contains(rssID, c)){
      inv.remove(rssID,c); 
      inv.add(itemID);
      return "Successfully crafted";
    }
    return "Failed to craft";
  }
}
