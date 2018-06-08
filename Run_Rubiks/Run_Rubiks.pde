RubiksCube player;
RubiksCube two;
RubiksCube three;
ToggleButton cutout = new ToggleButton(200, 500, 110, 60, "Toggle Cutout");
ToggleButton switchCube = new ToggleButton(200,570,110, 90, "Switch cube type");
Button helpScreen = new Button(200, 200, 140, 60, "Click For Commands"); //show keyboard commands
ToggleButton goBack = new ToggleButton(2000, 2000, 120, 60, "Click to Go Back"); //go back from the help page
boolean onHelp; //are we on the help page?
boolean solve;//global for solving instantly vs animated solving
int ticks;//used to determine frames since last solve update
String s; //hint string
Boolean hint; //toggles when user wants hint displayed

void setup() {
  size(1024, 768);
  three = new threeCube();
  three.reset();
  two = new twoCube();
  two.reset();
  player = two;
  ticks = 0;
  onHelp = false;
  s = "";
  hint = false;
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
  fill(256,256,256);
  textSize(40);
  if (!onHelp) {
  text("Virtual Rubik's Cube 2018!", 10, 40);
  }
  /*default settings as seen on their github:
  https://github.com/processing/processing/blob/fa91706bf23c4080884b56c0a62b468a15e5d047/core/src/processing/core/PGraphics.java#L985
  */
  textSize(12);
  textLeading(14); //<>//
  textAlign(LEFT); //<>//
  textMode(MODEL); //<>//
  cutout.makeButton(); //<>//
  switchCube.makeButton(); //<>//
  if (!onHelp) { //becomes replaced with the goBack button //<>//
  helpScreen.x = 200; //<>//
  helpScreen.y = 200; //<>//
  goBack.x = 2000; //<>//
  goBack.y = 2000; //<>//
  helpScreen.makeButton(); //<>//
  } //<>//
  if (helpScreen.isPressed) { //<>// //<>//
    helpScreen.x = 2000; //<>// //<>//
    helpScreen.y = 2000; //<>// //<>//
    onHelp = true; //<>// //<>//
    goBack.x = 200; //<>// //<>//
    goBack.y = 150; //<>// //<>//
    goBack.makeButton(); //<>// //<>//
    fill(256, 256, 256); //<>// //<>//
    text("Welcome to the help screen for the Virtual Rubik's Cube!\nIn this helpful guide, you can find the commands for the " + //<>// //<>//
    "variety of options available to you. \nThey are listed down below:\n\n" +  //<>// //<>//
    //commands from here //<>// //<>//
    "Cubes\n" + //<>// //<>//
    "Y - Toggle between 2x2 cube or 3x3 cube\n\n" + //<>// //<>//
    "Rotations\n" +  //<>// //<>//
    "W - Physically rotates the cube upwards (Front face ----> up face)\n\n" + //<>// //<>//
    "A - Physically rotates the cube left (Front face ----> left face)\n\n" + //<>// //<>//
    "S - Physically rotates the cube right (Front face ---> right face)\n\n" + //<>// //<>//
    "D - Physically rotates the cube downwards (Front face ----> down face)\n\n" + //<>// //<>//
    "Turning\n\n" + //<>// //<>//
    "b - turns the front face clockwise\n\n" + //<>// //<>//
    "B - turns the front face counterclockwise\n\n" +  //<>// //<>//
    "g - turns the right face clockwise\n\n" +  //<>// //<>//
    "G - turns the right face counterclockwise\n\n" + //<>// //<>//
    "g - turns the right face clockwise\n\n" +  //<>// //<>//
    "G - turns the right face counterclockwise\n\n" + //<>// //<>//
    "h - turns the left face clockwise\n\n" +  //<>//
    "H - turns the left face counterclockwise\n\n" +  //<>// //<>//
    "n - turns the back face clockwise\n\n" + //<>// //<>//
    "N - turns the back face counterclockwise\n\n" + //<>// //<>//
    "j - turns the up face clockwise\n\n" + //<>// //<>//
    "J - turns the up face counterclockwise\n\n" + //<>// //<>//
    "m - turns the down face clockwise\n\n" + //<>// //<>//
    "M - turns the down face counterclockwise", width / 2 - 100, (height / 8) - 50, width - 100, height - 100); //<>// //<>//
    helpScreen.isPressed = true; //keeps the guide up //<>// //<>//
    if (goBack.isPressed) { //<>// //<>//
      onHelp = false; //<>// //<>//
      helpScreen.isPressed = false; //<>// //<>//
      goBack.isPressed = false; //<>//
    }//end guide //<>// //<>//
  }else{ //<>// //<>//
  if (switchCube.isPressed) { //user wishes to switch cubes //<>//
   if (player.size == 2) { //<>//
    player = three; //<>//
    switchCube.isPressed = !switchCube.isPressed; //<>//
   }else{ //<>//
    player = two; //<>//
    switchCube.isPressed = !switchCube.isPressed; //<>//
    } //<>//
  } //<>//
  if (cutout.isPressed) { //<>//
    if (player.size == 2) {     //<>//
      for (color[] a : player.front) { //<>//
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
    s = "It is solved already!"; //updates hint
    }
  }
  
  if (hint){ //if user wants hint, display hint
      fill(256, 256, 256);
      text(s,100,100);
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
  if (key == 'r'){    //update hint text according to solStack when s is pressed
     if (player.solStack.isEmpty()){
        s = "It is solved already!";
     }
     else{
        int top = player.solStack.peek();
        if (top == 0){
          s = "Hint: press b";
        }
        if (top == 1){
          s = "Hint: press B";
        }
        if (top == 2){
          s = "Hint: press g";
        }
        if (top == 3){
          s = "Hint: press G";
        }
        if (top == 4){
          s = "Hint: press h";
        }
        if (top == 5){
          s = "Hint: press H";
        }
        if (top == 6){
          s = "Hint: press m";
        }
        if (top == 7){
          s = "Hint: press M";
        }
        if (top == 8){
          s = "Hint: press j";
        }
        if (top == 9){
          s = "Hint: press J";
        }
        if (top == 10){
          s = "Hint: press n";
        }
        if (top == 11){
          s = "Hint: press N";
        }
        if (top == 12){
          s = "Hint: press w";
        }
        if (top == 13){
          s = "Hint: press s";
        }
        if (top == 14){
         s =  "Hint: press a";
        }
        if (top == 15){
         s =  "Hint: press d";
        }
     }
     hint = true;
  }
  if (key == 'y'){
        if (player.size == 2){
           player = three; 
        }
        else{
           player = two; 
        }
     }
  /*if (key == 't'){
   System.out.println("is it solved? " + player.isSolved());
   System.out.println("empty? "+ player.solStack.isEmpty());
   }*/
}
void mouseClicked() {
  cutout.mouseClicked();
  switchCube.mouseClicked();
  helpScreen.mouseClicked();
  goBack.mouseClicked();
}
