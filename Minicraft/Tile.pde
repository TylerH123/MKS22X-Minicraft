public abstract class Tile implements Transversable{

  float x,y;
  color c;

  public abstract boolean canWalk();
  public abstract String getName();
  void display(){
    fill(c);
    rect((x*50)+Minicraft.dx,(y*50)+Minicraft.dy,50,50);
    fill(#1c0aad);
    // text("" + (int)x + "\n" + (int)y, x+10 + Minicraft.dx, y+10 + Minicraft.dy);
  }

}
