public class TestTile{

  int x, y;
  public TestTile(int x, int y){
    this.x = x;
    this.y = y;
  }

  void display(){
    rect((x*50) + dx, (y*50) + dy, 50, 50);
  }

}
