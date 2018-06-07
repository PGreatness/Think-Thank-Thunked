import java.util.Stack;
public abstract class RubiksCube {

  protected int size;//signifies wether 2x2 or 3x3
  color[][] front, back, left, right, up, down;//6 faces of a rubiks cube
  /*************************************************************************
   Solving the cube
   *************************************************************************/

  protected Stack<Integer> solStack;//stack that holds solution
  //will track every move performed to allow for contructing a solution backwards
  /*
  Integers will represent a move
   0 = FC = Front clockwise . . . .  etc
   1 = FCC
   2 = RC
   3 = RCC
   4 = LC
   5 = LCC
   6 = DC
   7 = DCC
   8 = UC
   9 = UCC
   10 = BC
   11 = BCC
   12 = RU = Rotate Up  . . . . . etc
   13 = RD
   14 = RL
   15 = RR
   
   */

  public void solve(int x) {
    while (!solStack.isEmpty()) {
      int peekStack = solStack.peek();
      switch(peekStack) {
      case 0: 
        turnFC();
        break;
      case 1: 
        turnFCC();
        break;
      case 2: 
        turnRC();
        break;
      case 3: 
        turnRCC();
        break;
      case 4: 
        turnLC();
        break;
      case 5: 
        turnLCC();
        break;
      case 6: 
        turnDC();
        break;
      case 7: 
        turnDCC();        
        break;
      case 8: 
        turnUC();
        break;
      case 9: 
        turnUCC();
        break;
      case 10:
        turnBC();
        break;
      case 11:
        turnBCC();
        break;
      case 12:
        rotateUp();
        break;
      case 13:
        rotateDown();
        break;
      case 14:
        rotateLeft();
        break;
      case 15:
        rotateRight();        
        break;
      }//end switch
      solStack.pop();
      if (x == 1) {
        break;
      }
    }//end while loop
  }//end solve
  /**********************************************************************
   General use FXNs  
   
   ***********************************************************************/
  public void shuffle() {
    int operation;
    for (int x = 0; x < 50; x++) {
      operation = (int)(Math.random() * 16);
      switch(operation) {
      case 0: 
        turnFC();
        solStack.push(1);
        break;
      case 1: 
        turnFCC();
        solStack.push(0);
        break;
      case 2: 
        turnRC();
        solStack.push(3);
        break;
      case 3: 
        turnRCC();
        solStack.push(2);
        break;
      case 4: 
        turnLC();
        solStack.push(5);
        break;
      case 5: 
        turnLCC();
        solStack.push(4);
        break;
      case 6: 
        turnDC();
        solStack.push(7);
        break;
      case 7: 
        turnDCC();
        solStack.push(6);
        break;
      case 8: 
        turnUC();
        solStack.push(9);
        break;
      case 9: 
        turnUCC();
        solStack.push(8);
        break;
      case 10:
        turnBC();
        solStack.push(11);
        break;
      case 11:
        turnBCC();
        solStack.push(10);
        break;
      case 12:
        rotateUp();
        solStack.push(13);
        break;
      case 13:
        rotateDown();
        solStack.push(12);
        break;
      case 14:
        rotateLeft();
        solStack.push(15);
        break;
      case 15:
        rotateRight();
        solStack.push(14);
        break;
      }//end switch
    }
  }//end shuffle
  public String toString() {
    String retVal = "";
    retVal += "Front face:\n";
    for (color[] n : front) {       
      for (color m : n) {
        retVal += m + ", ";
      }
      retVal+="\n";
    }
    retVal += "Back face:\n";
    for (color[] n : back) {       
      for (color m : n) {
        retVal += m + ", ";
      }
      retVal+="\n";
    }
    retVal += "Left face:\n";
    for (color[] n : left) {       
      for (color m : n) {
        retVal += m + ", ";
      }
      retVal+="\n";
    }
    retVal += "Right face:\n";
    for (color[] n : right) {       
      for (color m : n) {
        retVal += m + ", ";
      }
      retVal+="\n";
    }
    retVal += "Up face:\n";
    for (color[] n : up) {       
      for (color m : n) {
        retVal += m + ", ";
      }
      retVal+="\n";
    }
    retVal += "Down face:\n";
    for (color[] n : down) {       
      for (color m : n) {
        retVal += m + ", ";
      }
      retVal+="\n";
    }
    return retVal;
  }//end toString

  public boolean isSolved() {
    color temp = front[0][0];
    for (color[] n : front) {//check for conformity in the front face
      for (color m : n) {
        if (!(m==temp)) {
          return false;
        }
      }
    }
    temp = back[0][0];
    for (color[] n : back) {//check for conformity in the back
      for (color m : n) {
        if (!(m==temp)) {
          return false;
        }
      }
    }
    temp = left[0][0];
    for (color[] n : left) {//check for conformity on the left
      for (color m : n) {
        if (!(m==temp)) {
          return false;
        }
      }
    }
    temp = right[0][0];
    for (color[] n : right) {//same but for right
      for (color m : n) {
        if (!(m==temp)) {
          return false;
        }
      }
    }
    temp = up[0][0];
    for (color[] n : up) {//again check
      for (color m : n) {
        if (!(m == temp)) {
          return false;
        }
      }
    }
    temp = down[0][0];
    for (color[] n : down) {//last face to check
      for (color m : n) {
        if (!(m ==temp)) {
          return false;
        }
      }
    }
    return true;
  }//end isSolved

  public void reset() {
    for (color[] m : front) {//front becomes red
      for (int x = 0; x < m.length; x++) {
        m[x]= color(237, 19, 37);
      }
    }
    for (color[] m : back) {//becomes orange
      for (int x = 0; x < m.length; x++) {
        m[x]= color(252, 165, 0);
      }
    }
    for (color[] m : up) {//becomes white
      for (int x = 0; x < m.length; x++) {
        m[x]= color(255, 255, 255);
      }
    }
    for (color[] m : down) {//becomes yellow
      for (int x = 0; x < m.length; x++) {
        m[x]= color(254, 255, 0);
      }
    }
    for (color[] m : left) {//becomes green
      for (int x = 0; x < m.length; x++) {
        m[x]= color(0, 255, 27);
      }
    }
    for (color[] m : right) {//becomes blue
      for (int x = 0; x < m.length; x++) {
        m[x]= color(0, 14, 255);
      }
    }
  }//end reset

  /**********************************************************************
   FXNS Incorporating turning     
   
   ***********************************************************************/
  protected abstract void turn(color[][] a, int turn);//to be implemented for specific use within 2x2 and 3x3 rubiks cube classes turn 1 == clockwise 0 == CC
  public void turnFC() {//will turn the front face clockwise;
    turn(front, 1);
  }//end
  public void turnFCC() {//will turn front face Counter clockwise
    turn(front, 0);
  }//end
  public void turnRC() {//right face clockwise
    turn(right, 1);
  }//end 
  public void turnRCC() {//right face counterclockwise
    turn(right, 0);
  }//end
  public void turnLC() {//left face clockwise
    turn(left, 1);
  }//end 
  public void turnLCC() {//left face counterClockwise
    turn(left, 0);
  }//end 
  public void turnBC() {//back face clockwise
    turn(back, 1);
  }//end 
  public void turnBCC() {//turn back face counterclockwise
    turn(back, 0);
  }//end 
  public void turnUC() {//turn up face clockwise
    turn(up, 1);
  }//end 
  public void turnUCC() {//turn up face Counterclockwise
    turn(up, 0);
  }//end
  public void turnDC() {//turn down face Clockwise
    turn(down, 1);
  }//end
  public void turnDCC() {//turn down face Counter Clockwise
    turn(down, 0);
  }//end
  /**********************************************************************
   FXNS Involving changing perspective     
   
   ***********************************************************************/
  public abstract void rotateUp();
  public abstract void rotateDown();
  public abstract void rotateLeft();
  public abstract void rotateRight();
}//end class
