public abstract class Tile {

  float x,y;
  color c;

  void display(){
    fill(c);
    rect(x+Test_pde.dx,y+Test_pde.dy,50,50);
  };

}
