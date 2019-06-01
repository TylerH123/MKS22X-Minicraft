public class Player {

  float hitboxrad = 28.284;
  // static int x = 0;
  int dmg = 1;
  float dmgReduction = 0.00;
  Interactable[] equipped = new Interactable[5];
  public Player() {
  }


  /* if x is present in arr[] then returns the index of
    FIRST occurrence of x in arr[0..n-1], otherwise
    returns -1 */
    public int first(TestTile[] arr, int low, int high, int e, int n, char mode)
    {
        if(high >= low)
        {
          if (mode == 'x'){
            int mid = low + (high - low)/2;
            if( ( mid == 0 || e > arr[mid-1].x) && arr[mid].x == e)
            return mid;
            else if(e > arr[mid].x)
            return first(arr, (mid + 1), high, e, n, mode);
            else
            return first(arr, low, (mid -1), e, n, mode);
          }

          else{
            int mid = low + (high - low)/2;
            if( ( mid == 0 || e > arr[mid-1].y) && arr[mid].y == e)
            return mid;
            else if(e > arr[mid].y)
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
    public int last(TestTile[] arr, int low, int high, int e, int n, char mode)
    {
        if (high >= low)
        {
          if (mode == 'x'){
            int mid = low + (high - low)/2;
            if (( mid == n-1 || e < arr[mid+1].x) && arr[mid].x == e)
            return mid;
            else if (e < arr[mid].x)
            return last(arr, low, (mid -1), e, n, mode);
            else
            return last(arr, (mid + 1), high, e, n, mode);
          }
          else{
            int mid = low + (high - low)/2;
            if (( mid == n-1 || e < arr[mid+1].y) && arr[mid].y == e)
                 return mid;
            else if (e < arr[mid].y)
                return last(arr, low, (mid -1), e, n, mode);
            else
                return last(arr, (mid + 1), high, e, n, mode);
          }
        }
    return -1;
    }


  void display() {
    fill(100, 50, 118);
    text("PLAYER BOI", 442, 368);
    fill(42, 171, 235);
    text(direction, 442, 400);
    stroke(#000000, 50);
    rect(420 + leanx, 360 + leany, 40, 40);
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
  void equip(int itemID){

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
