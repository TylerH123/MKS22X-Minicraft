float x, y; 

void setup(){
 size(1000,1000); 
  
}
void draw() {
  if (keyPressed) {
    if (key == 'w' && key == 'h') {
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
