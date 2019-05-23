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
      cost = 10;
    }
    if (piece.equals("chest")) {
      pieceStrength = 4; 
      id = 2;
      cost = 20;
    }
    if (piece.equals("legs")) {
      pieceStrength = 3; 
      id = 3;
      cost = 15;
    }
    if (piece.equals("foot")) { 
      pieceStrength = 1; 
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
  boolean canCreate(String p, int t) {
    int c = 0; 
    if (p.equals("head")) {
      c = 10;
    }
    if (p.equals("chest")) {
      c = 20;
    }
    if (p.equals("legs")) {
      c = 15;
    }
    if (p.equals("foot")) { 
      c = 5;
    }
    if (inv.contains(t,c)) return true; 
    return false; 
  }
}
