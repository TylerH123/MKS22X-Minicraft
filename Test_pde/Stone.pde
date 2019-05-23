public class Stone extends Tile implements Transversable {

    color c = #a43512;

    public Stone(int x, int y){
      super();
      this.x = x;
      this.y = y;
      c = color(0,255,0);
    }

    boolean isTouching(Object o){
     return true;
    }

    boolean canWalk(){
      return false;
    }
}
