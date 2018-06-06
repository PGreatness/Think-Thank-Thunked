RubiksCube player;
Button test = new Button(300, 500, 200, 100, "TurnFC()");
Start begin = new Start();

void setup() {
  size(1024, 768);
  player = new twoCube();
  player.reset();
  player.front[0][0] = color(156, 156, 156);
  player.back[0][0] = color(156, 156, 156);
  player.left[0][0] = color(156, 156, 156);
  player.right[0][0] = color(156, 156, 156);
  player.up[0][0] = color(156, 156, 156);
  player.down[0][0] = color(156, 156, 156);
}

void draw() {
  clear();
  int x = 512;
  int y = 384;
  test.makeButton();
  if (test.isPressed) {
   player.turnFC();
   test.isPressed = false;
  }
  for (color[] m : player.front) {
    for (color n : m) {
      fill(n);
      rect(x, y, 50, 50);
      x+=50;
    }
    y+=50;
    x = 512;
  }
  y-=220;
  for (color[] m : player.up) {
    for (color n : m) {
      fill(n);
      rect(x, y, 50, 50);
      x+=50;
    }
    y+=50;
    x = 512;
  }
  y-=220;
  for (color[] m : player.back) {
    for (color n : m) {
      fill(n);
      rect(x, y, 50, 50);
      x+=50;
    }
    y+=50;
    x = 512;
  }
  y = 504; 
  for (color[] m : player.down) {
    for (color n : m) {
      fill(n);
      rect(x, y, 50, 50);
      x+=50;
    }
    y+=50;
    x = 512;
  }
  y = 384;
  x = 512 -120;
  for (color[] m : player.left) {
    for (color n : m) {
      fill(n);
      rect(x, y, 50, 50);
      x+=50;
    }
    y+=50;
    x = 512-120;
  }
  y = 384;
  x = 512 + 120;
  for (color[] m : player.right) {
    for (color n : m) {
      fill(n);
      rect(x, y, 50, 50);
      x+=50;
    }
    y+=50;
    x = 512 + 120;
  }
  
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
  if (key == 'b') {
    player.turnFC();
  }
  if (key == 'B') {
    player.turnFCC();
  }
}
void mouseClicked() {
 test.mouseClicked(); 
}
