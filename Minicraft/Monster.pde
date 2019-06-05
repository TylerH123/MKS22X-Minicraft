public class Monster {

  float hitboxrad = .471;
  float dmg = .05;
  int hp = 10;
  float x,y; 
  float radius = 0.5; 
  public Monster(int x, int y) {
    this.x = x;
    this.y = y; 
  }

  void display() {
    if (hp > 0) {
      imageMode(CENTER);
      fill(#BBE593);
      rect((x*60)+dx - 30, (y*60)+dy,60,60);
    }
  }
  void move() {
    x += Math.random() * .05;  
    y += Math.random() * .05;  
  }
  void isCollidePlayer(Player other) {
    float deltay = abs(this.y - currtiley);
    float deltax = abs(this.x - currtilex);
    float dist = sqrt((pow(deltax, 2)) + (pow(deltay, 2)));
    //println(dist + ", " + (hitboxrad + other.radius));
    float timer = 0;
    if (dist < hitboxrad + this.radius) { 
      if (timer % 50 == 0) {
        other.hp -= this.dmg;
      }
      timer += 1;
      // println("AAAAAAA");
      // return true;
      // System.exit(1);
      if (this.x > currtilex) {
        keyz[2] = false;
      } else if (this.x < currtilex) {
        keyz[0] = false;
      }

      if (this.y < currtiley) {
        keyz[3] = false;
        //println("CANT DO A MOVE UP");
      } else if (this.y > currtiley) {
        keyz[1] = false;

        //println("CANT DO A MOVE DOWN: \n reeeeee");
      }
    }
  }
}
