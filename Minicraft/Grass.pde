public class Grass extends Tile {

  public Grass(int x, int y) {
    super();
    this.x = x;
    this.y = y;
    c = color(0, 255, 0);
  }
  void display() {
    fill(0,255,0);
    rect((x*50)+Minicraft.dx, (y*50)+Minicraft.dy, 50, 50);
    image(grassImg,(x*50)+Minicraft.dx, (y*50)+Minicraft.dy);
    fill(#1c0aad);
    text("" + (int)x + "\n" + (int)y, x+10 + Minicraft.dx, y+10 + Minicraft.dy);
  }
  public boolean canWalk() {
    return true;
  }

  public String getName() {
    return "grass";
  }
}
