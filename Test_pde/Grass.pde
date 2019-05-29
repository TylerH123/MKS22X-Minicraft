public class Grass extends Tile {

  public Grass(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    c = color(0, 255, 0);
  }
  void display() {
    fill(0,255,0);
    rect(x+Test_pde.dx, y+Test_pde.dy, 50, 50);
    image(grassImg,x+Test_pde.dx, y+Test_pde.dy);
    fill(#1c0aad);
    text("" + (int)x + "\n" + (int)y, x+10 + Test_pde.dx, y+10 + Test_pde.dy);
  }
  public boolean canWalk() {
    return true;
  }

  public String getName() {
    return "grass";
  }
}
