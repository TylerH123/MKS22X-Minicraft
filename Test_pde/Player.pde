public class Player {
  // static int x = 0;
  int dmg = 1; 
  float dmgReduction = 0.00; 
  String[] equipped = new String[5]; 
  public Player() {
  }

  int currtiley = 6-(int)dy/50 - 1;
  int currtilex = 9-(int)dx/50 - 1;

  void display() {
    fill(100, 50, 118);
    text("PLAYER BOI", 442, 368);
    stroke(#000000, 50);
    rect(450 + leanx, 300 + leany, 30, 30);
  }
  void updateArmor(){
    float armor = 0.00;
    if (items[1] != null) armor += parseFloat(items[1].getInfo()[1]); 
    if (items[2] != null) armor += parseFloat(items[2].getInfo()[1]); 
    if (items[3] != null) armor += parseFloat(items[3].getInfo()[1]); 
    if (items[4] != null) armor += parseFloat(items[4].getInfo()[1]); 
    dmgReduction = armor; 
  }
  void equip(int itemID){
     
  }
  boolean getW() {
    System.out.println(t[currtiley - 1][currtilex].getName());
    return t[Test_pde.currtiley - 1][Test_pde.currtilex].getName().equals("stone");
  }

  boolean getS() {
    return t[Test_pde.currtiley + 1][Test_pde.currtilex].getName().equals("stone");
  }
  boolean getA() {
    return t[Test_pde.currtiley][Test_pde.currtilex - 1].getName().equals("stone");
  }
  boolean getD() {
    return t[Test_pde.currtiley][Test_pde.currtilex + 1].getName().equals("stone");
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
