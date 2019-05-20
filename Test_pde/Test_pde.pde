float x, y; 
void draw() {
  if (keyPressed) {
    if (key == 'w') {
      y--;
    }
    if (key == 'a') {
      x--;
    }
    if (key == 's') {
      y++;
    }
    if (key == 'd') {
      x++;
    }
  }
  rect(x, y, 50, 50);
}
