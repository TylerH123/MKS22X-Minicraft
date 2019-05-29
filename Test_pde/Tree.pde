public class Tree extends Tile implements Transversable {
  int hp = 10; 
  Tree(float x, float y) {
    this.x = x;
    this.y = y; 
  }
  void display(){
    fill(0,255,0); 
    rect(x+Test_pde.dx,y+Test_pde.dy,50,50);
    image(treeImg,x+Test_pde.dx,y+Test_pde.dy);
  }
  boolean canWalk() {
    return false;
  }
  String getName() {
    return "tree";
  }
}
