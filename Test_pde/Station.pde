public class Station extends Item{
  String name;
  Station(int station) {
    id = station;
    //workbench
    if (station == 5) {
      name = "workbench";
    }
    if (station == 6) {
      name = "furnace";
    }
    if (station == 7) {
      name = "anvil";
    }
    if (station == 8) {
      name = "oven";
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
      if (inv.contains(rssID, c) && inv.contains(14, 5)) {
        //remove the resources required to craft
        inv.remove(rssID, c);
        inv.remove(14, 5);
        //add crafted item to inventory
        inv.add(itemID);
        //add the crafted tool to the interactables items list
        itemList[itemID] = new Tool(rssID, itemID);
        return "Successfully crafted";
      } else {
        return "Failed to craft";
      }
    }
    //if anything else, check inventory for the resources
    if (inv.contains(rssID, c)) {
      //if it is armor piece then add it to itemList
      if (itemID >= 1 && itemID <= 4) {
        itemList[itemID] = new Armor(rss, itemID);
      }
      //if it is station then add it to itemList
      if (itemID >= 5 && itemID <= 8) {
        itemList[itemID] = new Station(itemID);
      }
      //remove the resources required to craft
      inv.remove(rssID, c);
      //add crafted item to inventory
      inv.add(itemID);
      return "Successfully crafted";
    }
    return "Failed to craft";
  }
  /**place the station 50 units in front of player according to direction
   @param station determines the picture of the station
   **/
  void place() {
    if (direction.equals("north")) {
      rect(450, 325, 50, 50);
    }
    if (direction.equals("south")) {
      rect(450, 425, 50, 50);
    }
    if (direction.equals("east")) {
      rect(500, 375, 50, 50);
    }
    if (direction.equals("west")) {
      rect(400, 375, 50, 50);
    }
  }
  String[] getInfo() {
    String[] info = new String[10];

    return info;
  }
  void interact(int idx) {
  }
  String name() {
    return "";
  }
  boolean canInteract(){
     return true;  
  }
}
