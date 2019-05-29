public class Player{
  // static int x = 0;

  public Player(){

  }

  int currtiley = 6-(int)dy/50 - 1;
  int currtilex = 9-(int)dx/50 - 1;


  void display(){
    fill(100, 50, 118);
    text("PLAYER BOI", 442, 368);
    stroke(#000000, 50);
    rect(450 + leanx, 300 + leany, 40, 40);
  }

  boolean getW(){
    System.out.println(t[currtiley - 1][currtilex].getName());
    return t[Test_pde.currtiley - 1][Test_pde.currtilex].getName().equals("stone");
  }

  boolean getS(){
    return t[Test_pde.currtiley + 1][Test_pde.currtilex].getName().equals("stone");
  }
  boolean getA(){
    return t[Test_pde.currtiley][Test_pde.currtilex - 1].getName().equals("stone");
  }
  boolean getD(){
    return t[Test_pde.currtiley][Test_pde.currtilex + 1].getName().equals("stone");
  }
}
