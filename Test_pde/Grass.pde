public class Grass extends Tile {

  public Grass(int x, int y){
    super();
    this.x = x;
    this.y = y;
    c = color(0,255,0);
  }

  public boolean canWalk(){
    return true;
  }

  public String getName(){
    return "grass";
  }

}
