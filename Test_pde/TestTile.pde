public class TestTile{

  int x, y;
  boolean isStone;
  public TestTile(int x, int y){
    this.x = x;
    this.y = y;
  }

  void display(){
    if(isStone){
      fill(157, 180, 119);
      rect((x*60) + dx, (y*60) + dy, 60, 60);
      return;
    }
    fill(100, 50, 118);
    rect((x*60) + dx, (y*60) + dy, 60, 60);
  }

  String getName(){
    return "genericboi";
  }

  void makeStone(){
    isStone = true;
  }

}
