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
      // rect((x*50)+Minicraft.dx,(y*50)+Minicraft.dy,50,50);
      image(grassImg,(x*50)+Minicraft.dx,(y*50)+Minicraft.dy);
      image(stoneImg,(x*50)+Minicraft.dx,(y*50)+Minicraft.dy);
    }

    public String getName(){
      return "stone";
    }
}
