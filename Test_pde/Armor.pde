public class Armor extends Item {
  int type; 
  String piece; 
  float dmgReduc; 
  int pieceStr;
  int cost; 
  Armor(int type, String piece) {
    this.type = type; 
    this.piece = piece; 
    dmgReduc = .015 * (type * pieceStr);
    if (piece.equals("head")) {
      pieceStr = 2; 
      id = 1;
      cost = 10; 
    }
    if (piece.equals("chest")) {
      pieceStr = 4; 
      id = 2;
      cost = 20; 
    }
    if (piece.equals("legs")) {
      pieceStr = 3; 
      id = 3;
      cost = 15; 
    }
    if (piece.equals("foot")) { 
      pieceStr = 1; 
      id = 4;
      cost = 5; 
    }
  }
  String name() {
    String typeName = ""; 
    if (type == 1) typeName = "wooden"; 
    if (type == 2) typeName = "stone";
    if (type == 3) typeName = "moodstone";
    return typeName + " " + piece;
  }
}
