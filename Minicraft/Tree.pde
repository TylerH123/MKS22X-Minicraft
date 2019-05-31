public class Tree extends Tile implements Transversable {
  int hp = 10; 
  Tree(float x, float y) {
    this.x = x;
    this.y = y; 
  }
  void display(){ 
    image(grassImg,x+Minicraft.dx,y+Minicraft.dy);
    image(treeImg,x+Minicraft.dx,y+Minicraft.dy);
  }
  boolean canWalk() {
    return false;
  }
  String getName() {
    return "tree";
  }
}
