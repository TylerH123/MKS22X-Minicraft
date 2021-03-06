public class Player {

  float hitboxrad = .471;
  // static int x = 0;
  int dmg = 1;
  int hp = 100;
  float stamina = 100;
  float dmgReduction = 0.00;
  int vel = 0;
  boolean isSprinting = false;
  Item[] equipped = new Item[6];
  public Player() {
  }

  public int first(ArrayList<TestTile>arr, int low, int high, int e, int n, char mode)
  {
    if (high >= low)
    {
      if (mode == 'x') {
        int mid = low + (high - low)/2;
        if ( ( mid == 0 || e > arr.get(mid-1).x) && arr.get(mid).x == e)
          return mid;
        else if (e > arr.get(mid).x)
          return first(arr, (mid + 1), high, e, n, mode);
        else
          return first(arr, low, (mid -1), e, n, mode);
      } else {
        int mid = low + (high - low)/2;
        if ( ( mid == 0 || e > arr.get(mid-1).y) && arr.get(mid).y == e)
          return mid;
        else if (e > arr.get(mid).y)
          return first(arr, (mid + 1), high, e, n, mode);
        else
          return first(arr, low, (mid -1), e, n, mode);
      }
    }
    return -1;
  }

  /* if x is present in arr[] then returns the index of
   LAST occurrence of x in arr[0..n-1], otherwise
   returns -1 */
  public int last(ArrayList<TestTile> arr, int low, int high, int e, int n, char mode)
  {
    if (high >= low)
    {
      if (mode == 'x') {
        int mid = low + (high - low)/2;
        if (( mid == n-1 || e < arr.get(mid+1).x) && arr.get(mid).x == e)
          return mid;
        else if (e < arr.get(mid).x)
          return last(arr, low, (mid -1), e, n, mode);
        else
          return last(arr, (mid + 1), high, e, n, mode);
      } else {
        int mid = low + (high - low)/2;
        if (( mid == n-1 || e < arr.get(mid+1).y) && arr.get(mid).y == e)
          return mid;
        else if (e < arr.get(mid).y)
          return last(arr, low, (mid -1), e, n, mode);
        else
          return last(arr, (mid + 1), high, e, n, mode);
      }
    }
    return -1;
  }

  void isCollide(TestTile other) {
    if (other.isStone) {
      float deltay = abs(other.y - currtiley);
      float deltax = abs(other.x - currtilex);
      float dist = sqrt((pow(deltax, 2)) + (pow(deltay, 2)));
      //println(dist + ", " + (hitboxrad + other.radius));
      if (dist < hitboxrad + other.radius) {
        // println("AAAAAAA");
        // return true;
        // System.exit(1);
        if (other.x > currtilex) {
          keyz[2] = false;
        } else if (other.x < currtilex) {
          keyz[0] = false;
        }

        if (other.y < currtiley) {
          keyz[3] = false;
          //println("CANT DO A MOVE UP");
        } else if (other.y > currtiley) {
          keyz[1] = false;

          //println("CANT DO A MOVE DOWN: \n reeeeee");
        }
      }
    }
    if (other.isTree) {
      float deltay = abs(other.y - currtiley);
      float deltax = abs(other.x - currtilex);
      float dist = sqrt((pow(deltax, 2)) + (pow(deltay, 2)));
      //println(dist + ", " + (hitboxrad + other.radius));
      if (dist < hitboxrad + other.radius) {
        // println("AAAAAAA");
        // return true;
        // System.exit(1);
        if (other.x > currtilex) {
          keyz[2] = false;
        } else if (other.x < currtilex) {
          keyz[0] = false;
        }

        if (other.y < currtiley) {
          keyz[3] = false;
          //println("CANT DO A MOVE UP");
        } else if (other.y > currtiley) {
          keyz[1] = false;

          //println("CANT DO A MOVE DOWN: \n reeeeee");
        }
      }
    }
    // return false;
  }

  void isCollideStation(Station other) {
    float deltay = abs(other.worldy - currtiley);
    float deltax = abs(other.worldx - currtilex);
    float dist = sqrt((pow(deltax, 2)) + (pow(deltay, 2)));
    // println(dist + ", " + (hitboxrad + other.radius));
    if (dist < hitboxrad + other.radius) {
      collidingStation = true;
      currentStation = other; 
      // println("AAAAAAA");
      // return true;
      // System.exit(1);
      if (other.worldx > currtilex) {
        canWalk[2] = false;
        keyz[2] = false;
      } else if (other.worldx < currtilex) {
        canWalk[0] = false;
        keyz[0] = false;
      }

      if (other.worldy < currtiley) {
        canWalk[3] = false;
        keyz[3] = false;
        // println("CANT DO A MOVE UP");
      } else if (other.worldy > currtiley) {
        canWalk[1] = false;
        keyz[1] = false;

        // println("CANT DO A MOVE DOWN: \n reeeeee");
      }
    } else {
      collidingStation = false;
      canWalk[0] = true;
      canWalk[1] = true;
      canWalk[2] = true;
      canWalk[3] = true;
    }
  }

  void display() {
    fill(100, 50, 118);
    //text("PLAYER BOI", 442, 368);
    stroke(#000000, 50);
    if (direction.equals("north")) {
      image(pup, 450 + leanx, 300 + leany);
    }
    if (direction.equals("south")) {
      image(pdown, 450 + leanx, 300 + leany);
    }
    if (direction.equals("east")) {
      image(pright, 450 + leanx, 300 + leany);
    }
    if (direction.equals("west")) {
      image(pleft, 450 + leanx, 300 + leany);
    }
    fill(255);
    rect(width-50, 20, 100, 40);
    fill(255, 0, 0);
    text("HP: " + hp, width - 60, 15);
    text("Stamina: " + (int)stamina, width - 90, 30);
    //text("I'm at" + currtilex + ", " + currtiley, 450, 320);
    TestTile other = testarr[3][3];

    float deltay = abs(other.y - currtiley);
    float deltax = abs(other.x - currtilex);
    float dist = sqrt((pow(deltax, 2)) + (pow(deltay, 2)));
    //fill(#000000);
    //text("My distance to 3, 3 is: " + dist, 450, 330);
    //text("I'm at" + currtilex + ", " + currtiley, 450, 340);
    //text("3, 3 is at: " + other.x + ", " + other.y, 450, 350);
  }
  void updateArmor() {
    float armor = 0.00;
    if (equipped[0] != null) armor += parseFloat(equipped[0].getInfo()[1]);
    if (equipped[1] != null) armor += parseFloat(equipped[1].getInfo()[1]);
    if (equipped[2] != null) armor += parseFloat(equipped[2].getInfo()[1]);
    if (equipped[3] != null) armor += parseFloat(equipped[3].getInfo()[1]);
    dmgReduction = armor;
  }
  void updateDamage() {
    if (equipped[4] != null) dmg = parseInt(equipped[4].getInfo()[1]);
    else dmg = 1;
  }
  void punch() {
    if (stamina > 10) {
      stamina -= 5;
      if (direction == "north") {
        if (testarr[round(currtilex)][round(currtiley-1)].isStone) {
          if (p.equipped[4] != null && p.equipped[4].basic.equals("pickaxe"))
            testarr[round(currtilex)][round(currtiley-1)].health -= dmg * 2;
        }
        if (testarr[round(currtilex)][round(currtiley-1)].isTree) {
          if (p.equipped[4] == null) {
            testarr[round(currtilex)][round(currtiley-1)].health -= dmg;
            hp--;
          } else if (p.equipped[4].basic.equals("axe"))
            testarr[round(currtilex)][round(currtiley-1)].health -= dmg * 2;
        }
      }
      if (direction == "south") {
        if (testarr[round(currtilex)][round(currtiley+1)].isStone) {
          if (p.equipped[4] != null && p.equipped[4].basic.equals("pickaxe"))
            testarr[round(currtilex)][round(currtiley+1)].health -= dmg * 2;
        }
        if (testarr[round(currtilex)][round(currtiley+1)].isTree) {
          if (p.equipped[4] == null) {
            testarr[round(currtilex)][round(currtiley+1)].health -= dmg;
            hp--;
          } else if (p.equipped[4].basic.equals("axe"))
            testarr[round(currtilex)][round(currtiley+1)].health -= dmg * 2;
        }
      }
      if (direction == "east") {
        if (testarr[round(currtilex+1)][round(currtiley)].isStone) {
          if (p.equipped[4] != null && p.equipped[4].basic.equals("pickaxe"))
            testarr[round(currtilex+1)][round(currtiley)].health -= dmg * 2;
        }
        if (testarr[round(currtilex+1)][round(currtiley)].isTree) {
          if (p.equipped[4] == null) {
            testarr[round(currtilex+1)][round(currtiley)].health -= dmg;
            hp--;
          } else if (p.equipped[4].basic.equals("axe"))
            testarr[round(currtilex+1)][round(currtiley-1)].health -= dmg * 2;
        }
      }
      if (direction == "west") {
        if (testarr[round(currtilex-1)][round(currtiley-1)].isStone) {
          if (p.equipped[4] != null && p.equipped[4].basic.equals("pickaxe"))
            testarr[round(currtilex-1)][round(currtiley-1)].health -= dmg * 2;
        }
        if (testarr[round(currtilex-1)][round(currtiley)].isTree) {
          if (p.equipped[4] == null) {
            testarr[round(currtilex-1)][round(currtiley)].health -= dmg;
            hp--;
          } else if (p.equipped[4].basic.equals("axe"))
            testarr[round(currtilex-1)][round(currtiley)].health -= dmg * 2;
        }
      }
    }
  }
}  
