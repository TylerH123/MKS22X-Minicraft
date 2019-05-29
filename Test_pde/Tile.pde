public abstract class Tile implements Transversable{

  float x,y;
  color c;

  public abstract boolean canWalk();
  public abstract String getName();
  void display(){
    fill(c);
    rect((x*50)+Test_pde.dx,(y*50)+Test_pde.dy,50,50);
    fill(#1c0aad);
    // text("" + (int)x + "\n" + (int)y, x+10 + Test_pde.dx, y+10 + Test_pde.dy);
  }

}
