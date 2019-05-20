float keyz[] = new float [4];
float x, y;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
}

void draw() {
  float dx = 0.0;
  float dy = 0.0;
  for (int n = 0; n < keyz.length; n++){
    if (n == 0 || n == 2){
      dx += keyz[n];
    }

    if (n == 1 || n == 3){
      dy += keyz[n];
    }
  }

  rect(dx, dy, 50, 50);
}

void keyPressed() {
  if (key == 'a')  keyz[0] = -10;
  if (key == 's')  keyz[1] = 10;
  if (key == 'd')  keyz[2] = 10;
  if (key == 'w')  keyz[3] = -10;
}

void keyReleased() {
  if (key == 'a')  keyz[0] = 0;
  if (key == 's')  keyz[1] = 0;
  if (key == 'd')  keyz[2] = 0;
  if (key == 'w')  keyz[3] = 0;
}
