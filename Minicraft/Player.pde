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
      if(high >= low)
      {
        if (mode == 'x'){
          int mid = low + (high - low)/2;
          if( ( mid == 0 || e > arr.get(mid-1).x) && arr.get(mid).x == e)
          return mid;
          else if(e > arr.get(mid).x)
          return first(arr, (mid + 1), high, e, n, mode);
          else
          return first(arr, low, (mid -1), e, n, mode);
        }

        else{
          int mid = low + (high - low)/2;
          if( ( mid == 0 || e > arr.get(mid-1).y) && arr.get(mid).y == e)
          return mid;
          else if(e > arr.get(mid).y)
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
        if (mode == 'x'){
          int mid = low + (high - low)/2;
          if (( mid == n-1 || e < arr.get(mid+1).x) && arr.get(mid).x == e)
          return mid;
          else if (e < arr.get(mid).x)
          return last(arr, low, (mid -1), e, n, mode);
          else
          return last(arr, (mid + 1), high, e, n, mode);
        }
        else{
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

  void isCollide(TestTile other){
    if (other.isStone){
      float deltay = abs(other.y - currtiley);
      float deltax = abs(other.x - currtilex);
      float dist = sqrt((pow(deltax, 2)) + (pow(deltay, 2)));
      println(dist + ", " + (hitboxrad + other.radius));
      if (dist < hitboxrad + other.radius){
        // println("AAAAAAA");
        // return true;
        // System.exit(1);
        if(other.x > currtilex){
          keyz[2] = false;
        }
        else if(other.x < currtilex){
          keyz[0] = false;
        }

        if (other.y < currtiley){
          keyz[3] = false;
          println("CANT DO A MOVE UP");
        }
        else if (other.y > currtiley){
          keyz[1] = false;

          println("CANT DO A MOVE DOWN: \n reeeeee");
        }
      }

    }
    // return false;
  }


  void display() {
    fill(100, 50, 118);
    //text("PLAYER BOI", 442, 368);
    stroke(#000000, 50);
    rect(450 + leanx, 300 + leany, 40, 40);
    fill(255);
    rect(width-50,20,100,40);
    fill(255,0,0);
    text("HP: " + hp, width - 60, 15);
    text("Stamina: " + (int)stamina, width - 90, 30);
    text("I'm at" + currtilex + ", " + currtiley, 450, 320);
    TestTile other = testarr[3][3];

    float deltay = abs(other.y - currtiley);
    float deltax = abs(other.x - currtilex);
    float dist = sqrt((pow(deltax, 2)) + (pow(deltay, 2)));
    fill(#000000);
    text("My distance to 3, 3 is: " + dist, 450, 330);
    text("I'm at" + currtilex + ", " + currtiley, 450, 340);
    text("3, 3 is at: " + other.x + ", " + other.y, 450, 350);
  }
  void updateArmor(){
    float armor = 0.00;
    if (equipped[0] != null) armor += parseFloat(equipped[0].getInfo()[1]);
    if (equipped[1] != null) armor += parseFloat(equipped[1].getInfo()[1]);
    if (equipped[2] != null) armor += parseFloat(equipped[2].getInfo()[1]);
    if (equipped[3] != null) armor += parseFloat(equipped[3].getInfo()[1]);
    dmgReduction = armor;
  }
  void updateDamage(){
    if (equipped[4] != null) dmg = parseInt(equipped[4].getInfo()[1]);
    else dmg = 1;
  }
  void punch() {
    if (direction == "north") {
    }
    if (direction == "south") {
    }
    if (direction == "east") {
    }
    if (direction == "west") {
    }
  }
}
