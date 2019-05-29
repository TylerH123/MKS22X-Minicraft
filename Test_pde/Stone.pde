public class Stone extends Tile implements Transversable {

    color c = #73aba3;

    public Stone(int x, int y){
      super();
      this.x = x;
      this.y = y;
    }

    boolean isTouching(Object o){
     return true;
    }

    boolean canWalk(){
      return false;
    }

    void display(){
      fill(0,255,0);
      rect(x+Test_pde.dx,y+Test_pde.dy,50,50);
      image(stoneImg,x+Test_pde.dx,y+Test_pde.dy);
    }

    public String getName(){
      return "stone";
    }
}
