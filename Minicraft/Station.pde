public class Station extends Item {
  String name;
  PImage img;
  boolean isPlaced = false;
  float x, y;
  float px, py;
  int cy = 40;
  int c2y = 40;
  int cypos = 0;
  int c2ypos = 0;
  int current = 0;
  int current2 = 0;
  float radius = 0.589;
  float worldx, worldy;
  Station s; 
  Station(int station) {
    id = station;
    //workbench
    if (station == 5) {
      img = workBImg;
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
    basic = name;
    px = 0;
    py = 0;
    inv.inventory[id]++;
    s = this;
  }
  Station(int s, int g) {
    id = s;
    //workbench
    if (s == 5) {
      name = "workbench";
    }
    if (s == 6) {
      name = "furnace";
    }
    if (s == 7) {
      name = "anvil";
    }
    if (s == 8) {
      name = "oven";
    }
    basic = name;
  }
  //display the station if placed
  void display() {
    if (isPlaced) {
      image(img, x + px, y + py);
    }
  }
  /**first, checks your inventory to see if the item can be created. then creates it
   @param itemID is the id of the item you are trying to create
   @param rss is the main resource to create the item. this is only required for tools and armor.
   **/
  void craft(int itemID, int rss) {
    //get the resourceID from cost list array
    int rssID = costList[itemID][1];
    //if item is either armor piece or tool
    if (itemID >= 1 && itemID <= 4 || itemID >= 14 || itemID <= 18) {
      rssID = rss;
    }
    int c = costList[itemID][0];
    //if its a tool, also cehck if inventory has 5 wood
    if (itemID >= 14 && itemID <= 18) {
      if (inv.inventory[itemID] == 0) {
        if (inv.contains(rssID, c) && inv.contains(14, 5)) {
          //remove the resources required to craft
          inv.removeAmt(rssID, c);
          inv.removeAmt(14, 5);
          //add the crafted tool to the interactables items list
          itemList[itemID] = new Tool(rssID, itemID);
          inv.updateInventory();
          return;
        } else {
          return;
        }
      }
    }
    //if anything else, check inventory for the resources
    if (inv.contains(rssID, c)) {
      //if it is armor piece then add it to itemList
      if (itemID >= 1 && itemID <= 4) {
        if (inv.inventory[itemID] == 0) {
          itemList[itemID] = new Armor(rss, itemID);
          //remove the resources required to craft
          inv.removeAmt(rssID, c);
          inv.updateInventory();
        }
      }
      //if it is station then add it to itemList
      if (itemID >= 5 && itemID <= 8) {
        Station s = new Station(itemID);
        itemList[itemID] = s;

        //remove the resources required to craft
        inv.removeAmt(rssID, c);
        inv.updateInventory();
      }
      return;
    }
    return;
  }
  /**place the station 50 units in front of player according to direction
   @param station determines the picture of the station
   **/
  void place() {
    isPlaced = true;
    stations.add(s);
    if (inv.inventory[5] > 1) {
      itemList[5] = new Station(5);
      inv.inventory[5]--;
    }
    p.equipped[5] = null;
    if (direction.equals("north")) {
      x = 450;
      y = 250;
      worldx = currtilex;
      worldy = currtiley - 1;
    }
    if (direction.equals("south")) {
      x = 450;
      y = 350;
      worldx = currtilex;
      worldy = currtiley + 1;
    }
    if (direction.equals("east")) {
      x = 500;
      y = 300;
      worldx = currtilex + 1;
      worldy = currtiley;
    }
    if (direction.equals("west")) {
      x = 400;
      y = 300;
      worldx = currtilex - 1;
      worldy = currtiley;
    }
  }
  //returns an array containing id and name
  String[] getInfo() {
    String[] info = new String[4];
    info[0] = name();
    info[1] = id + "";
    return info;
  }
  /**if not placed, then player equips the station or swaps the station if player is currently holding one
   *else if placed and interacted, then ay the station menu
   *@param idx is the index of the station in items array
   **/
  void interact(int idx) {
    if (!isPlaced) {
      if (p.equipped[5] == null) {
        inv.removeAmt(id, 1);
        if (inv.inventory[id] == 0) itemList[id] = null;
        p.equipped[5] = this;
        if (inv.inventory[id] == 0) inv.items.remove(idx);
        inv.updateInventory();
        if (inv.current == inv.items.size() && inv.y - 10 > 275) {
          inv.current--;
          inv.ypos -= 10;
          inv.y -= 10;
        }
      } else {
        inv.returnToInv();
        interact(idx);
      }
    } else if (stationMenu) {
      inv.display();
      display(id);
    }
  }
  //interact for station menus
  //if station is workbench then craft
  void interact() {
    if (id == 5) {
      int rssID = 0;
      if ((current >= 0 && current <= 3) || (current >= 8 && current <= 12)) {
        if (current2 == 0) rssID = 14;
        if (current2 == 1) rssID = 15;
        if (current2 == 2) rssID = 17;
        if (current2 == 3) rssID = 18;
      } else {
        rssID = costList[current+1][1];
      }
      craft(craftables[current].id, rssID);
    }
  }
  //return name
  String name() {
    return name;
  }  
  //station can interact
  boolean canInteract() {
    return true;
  }
  //display station menu
  //@param s is the station
  void display(int s) {
    fill(255);
    rect(450, 150, 200, 230);
    if (s == 5) {
      fill(255, 0, 0);
      triangle(355, 40 + cypos, 355, 45 + cypos, 360, 42.5 + cypos);
      for (int i = 0; i < craftables.length; i++) {
        fill(0);
        text(craftables[i].basic, 365, 48 + i * 10);
        if ((current >= 0 && current <= 3) || (current >= 8 && current <= 12)) {
          fill(255, 0, 0);
          triangle(445, 40 + c2ypos, 445, 45 + c2ypos, 450, 42.5 + c2ypos);
          fill(0);
          text(costList[craftables[current].id][0] + "x wood", 455, 48);
          text(costList[craftables[current].id][0] + "x stone", 455, 58);
          text(costList[craftables[current].id][0] + "x iron", 455, 68);
          text(costList[craftables[current].id][0] + "x moodstone", 455, 78);
        } else {
          current2 = 0;
          if (current == 4) 
            text(costList[craftables[current].id][0] + "x wood", 455, 48);
          if (current == 5) 
            text(costList[craftables[current].id][0] + "x stone", 455, 48);
          if (current == 6) 
            text(costList[craftables[current].id][0] + "x iron", 455, 48);
          if (current == 7) 
            text(costList[craftables[current].id][0] + "x stone", 455, 48);
        }
      }
    }
  }
  //moves the pointer in station menu up
  void moveUp() {
    cypos -= 10;
    current--;
  }
  //moves the pointer in station menu down
  void moveDown() {
    cypos += 10;
    current++;
  }
  //moves the second pointer in station menu up
  void moveUp2() {
    c2ypos -= 10;
    current2--;
  }
  //moves the second pointer in the station menu down
  void moveDown2() {
    c2ypos += 10;
    current2++;
  }
}
