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
    rect(450 + leanx, 300 + leany, 30, 30);
  }

  // boolean getW(){
  //   return()
  // }
}
