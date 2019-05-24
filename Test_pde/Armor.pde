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
    if (piece.equals("helemt")) {
      pieceStrength = 2;
      id = 1;
    }
    if (piece.equals("chestpiece")) {
      pieceStrength = 4;
      id = 2;
    }
    if (piece.equals("leggings")) {
      pieceStrength = 3;
      id = 3;
    }
    if (piece.equals("boots")) {
      pieceStrength = 1;
      id = 4;
    }
    cost = costList[id][0];
    itemList[id] = name();
  }
  String name() {
    String typeName = "";
    if (type == 1) typeName = "wooden";
    if (type == 2) typeName = "stone";
    if (type == 3) typeName = "moodstone";
    return typeName + " " + piece;
  }
}
