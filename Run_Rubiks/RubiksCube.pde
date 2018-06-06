public abstract class RubiksCube {
  protected int size;
  color[][] front, back, left, right, up, down;//6 faces of a rubiks cube
  /**********************************************************************
   General use FXNs  
   
   ***********************************************************************/
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
      for (int x = 0; x < m.length;x++) {
        m[x]= color(237, 19, 37);
      }
    }
    for (color[] m : back) {//becomes orange
      for (int x = 0; x < m.length;x++) {
        m[x]= color(252, 165, 0);
      }
    }
    for (color[] m : up) {//becomes white
      for (int x = 0; x < m.length;x++) {
        m[x]= color(255, 255, 255);
      }
    }
    for (color[] m : down) {//becomes yellow
      for (int x = 0; x < m.length;x++) {
        m[x]= color(254, 255, 0);
      }
    }
    for (color[] m : left) {//becomes green
      for (int x = 0; x < m.length;x++) {
        m[x]= color(0, 255, 27);
      }
    }
    for (color[] m : right) {//becomes blue
      for (int x = 0; x < m.length;x++) {
        m[x]= color(0, 14, 255);
      }
    }
  }//end reset

  /**********************************************************************
   FXNS Incorporating turning     
   
   ***********************************************************************/
  protected abstract void turn(color[][] a, int turn);//to be implemented for specific use within 2x2 and 3x3 rubiks cube classes turn 1 == clockwise 0 == CC
  public void turnFC() {//will turn the front face clockwise;
    turn(front,1);
  }//end
  public void turnFCC() {//will turn front face Counter clockwise
    turn(front,0);
  }//end
  public void turnRC() {//right face clockwise
    turn(right,1);
  }//end 
  public void turnRCC() {//right face counterclockwise
    turn(right,0);
  }//end
  public void turnLC() {//left face clockwise
    turn(left,1);
  }//end 
  public void turnLCC() {//left face counterClockwise
    turn(left,0);
  }//end 
  public void turnBC() {//back face clockwise
    turn(back,1);
  }//end 
  public void turnBCC() {//turn back face counterclockwise
    turn(back,0);
  }//end 
  public void turnUC() {//turn up face clockwise
    turn(up,1);
  }//end 
  public void turnUCC() {//turn up face Counterclockwise
    turn(up,0);
  }//end
  public void turnDC() {//turn down face Clockwise
    turn(down,1);
  }//end
  public void turnDCC() {//turn down face Counter Clockwise
    turn(down,0);
  }//end
  /**********************************************************************
   FXNS Involving changing perspective     
   
   ***********************************************************************/
  public abstract void rotateUp();
  public abstract void rotateDown();
  public abstract void rotateLeft();
  public abstract void rotateRight();
}//end class
