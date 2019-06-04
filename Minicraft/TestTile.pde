public class TestTile{

  int x, y;
  float radius = 0.5;
  float health;
  boolean isStone;
  public TestTile(int x, int y, int health){
    this.x = x;
    this.y = y;
    this.health = health;
  }

  void display(){
    if (health <= 0){
      isStone = false;
    }
    if(isStone){
      //fill(157, 180, 119);
      image(grassImg,(x*60) + dx - 30, (y*60)+dy);
      image(stoneImg,(x*60) + dx - 30, (y*60) + dy);
      return;
    }
    // fill(100, 50, 118);
    // rect((x*60) + dx - 30, (y*60) + dy, 60, 60);
    imageMode(CENTER);
    image(grassImg,(x*60)+dx - 30,(y*60)+dy);
  }

  String getName(){
    return "genericboi";
  }

  void makeStone(){
    isStone = true;
  }

  int compareTo(TestTile other){
    if (this.x < other.x){
      return -1;
    }
    if (this.x > other.x){
      return 1;
    }
    return 0;
  }

}
