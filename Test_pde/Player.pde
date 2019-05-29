public class Player {

  float hitboxrad = 28.284;
  // static int x = 0;
  int dmg = 1;
  float dmgReduction = 0.00;
  Interactable[] equipped = new Interactable[5];
  public Player() {
  }

  int currtiley = 6-(int)dy/50 - 1;
  int currtilex = 9-(int)dx/50 - 1;

  boolean Wcollide(){
    if(t[currtilex][currtiley-1].getName().equals("stone")){
      if(dist(450, 300, x+dx, y+dy) > hitboxrad + 35.35){
        return true;
      }
    }
    return false;
  }

  void display() {
    fill(100, 50, 118);
    text("PLAYER BOI", 442, 368);
    stroke(#000000, 50);
    rect(450 + leanx, 300 + leany, 40, 40);
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
