RubiksCube player;
Button test = new Button(300, 500, 200, 100, "TurnFC()");
//Start begin = new Start();

void setup() {
  size(1024, 768);
  player = new twoCube();
  player.reset();
  /*
  player.front[0][0] = color(156, 156, 156);
  player.back[0][0] = color(156, 156, 156);
  player.left[0][0] = color(156, 156, 156);
  player.right[0][0] = color(156, 156, 156);
  player.up[0][0] = color(156, 156, 156);
  player.down[0][0] = color(156, 156, 156);
  
  */
  //for testing ignore otherwise
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
    player.solStack.push(13);//pushes opposite of move performed to make the process reversible into a solved state
  }
  if (key == 97) {//a
    player.rotateLeft();
    player.solStack.push(15);
  }
  if (key == 115) {//s
    player.rotateDown();
    player.solStack.push(12);
  }
  if (key == 100) {//d
    player.rotateRight();
    player.solStack.push(14);
  }
  if (key == 'b') {
    player.turnFC();
    player.solStack.push(1);
  }
  if (key == 'B') {
    player.turnFCC();
    player.solStack.push(0);
  }
  if (key == 'g') {
    player.turnRC();
    player.solStack.push(3);
  }
  if (key == 'G') {
    player.turnRCC();
    player.solStack.push(2);
  }
  if (key == 'h') {
    player.turnLC();
    player.solStack.push(5);
  }
  if (key == 'H') {
    player.turnLCC();
    player.solStack.push(4);
  }
  if (key == 'n') {
    player.turnBC();
    player.solStack.push(11);
  }
  if (key == 'N') {
    player.turnBCC();
    player.solStack.push(10);
  }
  if (key == 'j') {
    player.turnUC();
    player.solStack.push(9);
  }
  if (key == 'J') {
    player.turnUCC();
    player.solStack.push(8);
  }
  if (key == 'm') {
    player.turnDC();
    player.solStack.push(7);
  }
  if (key == 'M') {
    player.turnDCC();
    player.solStack.push(6);
  }
  if (key == 'z' || key == 'Z'){
    player.solve();
  }
}
void mouseClicked() {
 test.mouseClicked(); 
}
