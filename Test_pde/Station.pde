public class Station extends Item {
  int station; 
  Station(int station) {
    this.station = station;
    //workbench
    if (station == 0) {
      id = 5;
    }
    //furnace
    if (station == 1) {
      id = 6;
    }
    //anvil
    if (station == 2) {
      id = 7;
    }
    //oven
    if (station == 3) {
      id = 8;
    }
  }
  /**first, checks your inventory to see if the item can be created. then creates it
   @param itemID is the id of the item you are trying to create
   @param rss is the main resource to create the item. this is only required for tools and armor. 
   **/
  String craft(int itemID, int rss) {
    //get the resourceID from cost list array 
    int rssID = costList[itemID][1]; 
    //if item is either armor piece or tool
    if (itemID >= 1 && itemID <= 4 || itemID >= 14 || itemID <= 18) {
      rssID = rss;
    }
    int c = costList[itemID][0]; 
    //if its a tool, also cehck if inventory has 5 wood
    if (itemID >= 14 || itemID <= 18) {
      if (inv.contains(rssID, c) && inv.contains(14, 5)){
        //remove the resources required to craft
        inv.remove(rssID,c); 
        inv.remove(14,5); 
        //add crafted item to inventory
        inv.add(itemID); 
        return "Successfully crafted"; 
      }
      else { 
        return "Failed to craft";
      }
    }
    //if anything else, check inventory for the resources 
    if (inv.contains(rssID, c)){
      //remove the resources required to craft
      inv.remove(rssID,c); 
      //add crafted item to inventory
      inv.add(itemID);
      return "Successfully crafted";
    }
    return "Failed to craft";
  }
}
