RubiksCube player;
ToggleButton cutout = new ToggleButton(300, 500, 110, 60, "Toggle Cutout");
Button turnFC = new Button(300, 600, 110, 60, "Turn Front Clockwise");
boolean solve;//global for solving instantly vs animated solving
int ticks;//used to determine frames since last solve update
void setup() {
  size(1024, 768);
  player = new threeCube();
  player.reset();
  ticks = 0;
  /*
  player.front[0][0] = color(156, 156, 156);
   player.back[0][0] = color(156, 156, 156);
   player.left[0][0] = color(156, 156, 156);
   player.right[0][0] = color(156, 156, 156);
   player.up[0][0] = color(156, 156, 156);
   player.down[0][0] = color(156, 156, 156);
   
   */
  //for cutouting ignore otherwise
  solve = false;
}

void draw() {
  clear();
  int x = 512;
  int y = 384;
  cutout.makeButton();
  turnFC.makeButton();
  if (turnFC.isPressed) {
    player.turnFC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(1);
    } else if (!(player.solStack.peek() == 0)) {
      player.solStack.push(1);
    } else {
      player.solStack.pop();
    }
    turnFC.isPressed = false;
  }
  if (cutout.isPressed) {
    if (player.size == 2) {    
      for (color[] a : player.front) {
        for (color b : a) {
          fill(256, 256, 256);
          rect(x, y, 55, 55);
          fill(b);
          rect(x, y, 50, 50);
          x += 75;
        }//end for
        y += 75;
        x = 512;
      }//end for
    }//if
    else {
      for (color[] a : player.front) {
        for (color b : a) {
          fill(256, 256, 256);
          rect(x, y, 55, 55);
          fill(b);
          rect(x, y, 50, 50);
          x += 75;
        }//end for
        y += 75;
        x = 512;
      }
    }//if you're 3x3 you have a different draw
  }//for button 
  else {
    if (player.size == 2) {
      for (color[] m : player.front) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512;
      }
      y-=220;//move up
      for (color[] m : player.up) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512;
      }
      y-=220;//move up
      for (color[] m : player.back) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512;
      }
      y = 504; //move back down
      for (color[] m : player.down) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512;
      }
      y = 384;//back up
      x = 512 -120;//left for left face
      for (color[] m : player.left) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512-120;
      }
      y = 384;//back up
      x = 512 + 120;//over to right
      for (color[] m : player.right) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512 + 120;
      }
    }//if 
    else {
      for (color[] m : player.front) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512;
      }
      y-=320;//move up
      for (color[] m : player.up) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512;
      }
      y-=320;//move up
      for (color[] m : player.back) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512;
      }
      y = 554;
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
      x = 512 -170;
      for (color[] m : player.left) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512 - 170;
      }
      y = 384;
      x = 512 + 170;
      for (color[] m : player.right) {
        for (color n : m) {
          fill(n);
          rect(x, y, 50, 50);
          x+=50;
        }
        y+=50;
        x = 512 + 170;
      }
      
    }//
  }//else
  if (solve) {//if solving animation toggled perform part of a solve
    ticks += 1;
    if (ticks == 60) {
      player.solve(1); 
      ticks = 0;
    }
  }//end solve animation

  if (player.isSolved()) { //if at anypoint the cube is solved, clear the moves stack
    Stack<Integer> newStack  = new Stack<Integer>(); 
    player.solStack = newStack;
  }
}//end draw

void keyPressed() {
  if (key == 119) {//RU
    player.rotateUp();
    if (player.solStack.isEmpty()) {
      player.solStack.push(13);
    } else if (!(player.solStack.peek() == 12)) {
      player.solStack.push(13);//pushes opposite of move performed to make the process reversible into a solved state
    } else {
      player.solStack.pop();
    }
  }
  if (key == 97) {//RL
    player.rotateLeft();
    if (player.solStack.isEmpty()) {
      player.solStack.push(15);
    } else if (!(player.solStack.peek() == 14)) {
      player.solStack.push(15);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 115) {//RD
    player.rotateDown();
    if (player.solStack.isEmpty()) {
      player.solStack.push(12);
    } else if (!(player.solStack.peek() == 13)) {
      player.solStack.push(12);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 100) {//RR
    player.rotateRight();
    if (player.solStack.isEmpty()) {
      player.solStack.push(14);
    } else if (!(player.solStack.peek() == 15)) {
      player.solStack.push(14);
    } else {
      player.solStack.pop();
    }
  }

  if (key == 'b') { //FC
    player.turnFC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(1);
    } else if (!(player.solStack.peek() == 0)) {
      player.solStack.push(1);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'B') { //FCC
    player.turnFCC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(0);
    } else if (!(player.solStack.peek() == 1)) {
      player.solStack.push(0);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'g') { //RC
    player.turnRC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(3);
    } else if (!(player.solStack.peek() == 2)) {
      player.solStack.push(3);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'G') { //RCC
    player.turnRCC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(2);
    } else if (!(player.solStack.peek() == 3)) {
      player.solStack.push(2);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'h') { //LC
    player.turnLC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(5);
    } else if (!(player.solStack.peek() == 4)) {
      player.solStack.push(5);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'H') { //LCC
    player.turnLCC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(4);
    } else if (!(player.solStack.peek() == 5)) {
      player.solStack.push(4);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'n') { //BC
    player.turnBC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(11);
    } else if (!(player.solStack.peek() == 10)) {
      player.solStack.push(11);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'N') { //BCC
    player.turnBCC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(10);
    } else if (!(player.solStack.peek() == 11)) {
      player.solStack.push(10);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'j') { //UC
    player.turnUC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(9);
    } else if (!(player.solStack.peek() == 8)) {
      player.solStack.push(9);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'J') { //UCC
    player.turnUCC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(8);
    } else if (!(player.solStack.peek() == 9)) {
      player.solStack.push(8);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'm') { //DC
    player.turnDC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(7);
    } else if (!(player.solStack.peek() == 6)) {
      player.solStack.push(7);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'M') { //DCC
    player.turnDCC();
    if (player.solStack.isEmpty()) {
      player.solStack.push(6);
    } else if (!(player.solStack.peek() == 7)) {
      player.solStack.push(6);
    } else {
      player.solStack.pop();
    }
  }
  if (key == 'z') {
    player.solve(0);
  }
  if (key == 'Z') {
    solve = !solve;
  }
  if (key == 'X' || key == 'x') {
    player.shuffle();
  }
  /*if (key == 't'){
   System.out.println("is it solved? " + player.isSolved());
   System.out.println("empty? "+ player.solStack.isEmpty());
   }*/
}
void mouseClicked() {
  cutout.mouseClicked();
  turnFC.mouseClicked();
}
