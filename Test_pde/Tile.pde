public abstract class Tile implements Transversable{

  float x,y;
  color c;

  public abstract boolean canWalk();
  
  void display(){
    fill(c);
    rect(x+Test_pde.dx,y+Test_pde.dy,50,50);
  }

}
