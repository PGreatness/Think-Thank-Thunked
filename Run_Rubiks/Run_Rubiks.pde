RubiksCube player;

void setup() {
  size(1280, 720);
  player = new twoCube();
  player.reset();
  player.front[0][0] = color(156, 156, 156);
}

void draw() {
  clear();
  int x =720;
  int y = 360;
  for (color[] m : player.front) {
    for (color n : m) {
      fill(n);
      ellipse(x, y, 50, 50);
      x+=100;
    }
    y+=100;
    x = 720;
  }
}

void mouseClicked() {
  //player.turnFC(); 

  //player.rotateUp();
}
void keyPressed() {
  if (key == 119) {//w
    player.rotateUp();
  }
  if (key == 97) {//a
    player.rotateLeft();
  }
  if (key == 115) {//s
    player.rotateDown();
  }
  if (key == 100) {//d
    player.rotateRight();
  }
}
