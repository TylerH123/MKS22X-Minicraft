public class TestTile{

  int x, y;
  public TestTile(int x, int y){
    this.x = x;
    this.y = y;
  }

  void display(){
    fill(0,255,0);
    rect((x*50) + dx, (y*50) + dy, 50, 50);
    imageMode(CENTER);
    image(grassImg,(x*50) + dx, (y*50) + dy);
  }

  String getName(){
    return "genericboi";
  }

}
