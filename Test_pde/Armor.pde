public class Armor extends Item{
  int type; 
  String piece; 
  float dmgReduc; 
  int pieceStrength;
  int cost; 
  Armor(int type, String piece) {
    this.type = type; 
    this.piece = piece; 
    dmgReduc = .015 * (type * pieceStrength);
    if (piece.equals("head")) {
      pieceStrength = 2; 
      id = 1;
    }
    if (piece.equals("chest")) {
      pieceStrength = 4; 
      id = 2;
    }
    if (piece.equals("legs")) {
      pieceStrength = 3; 
      id = 3;
    }
    if (piece.equals("foot")) { 
      pieceStrength = 1; 
      id = 4;
    }
    cost = costList[id];
  }
  String name() {
    String typeName = ""; 
    if (type == 1) typeName = "wooden"; 
    if (type == 2) typeName = "stone";
    if (type == 3) typeName = "moodstone";
    return typeName + " " + piece;
  }
}
