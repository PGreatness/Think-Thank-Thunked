public class twoCube extends RubiksCube { 
  public twoCube() {
    front = new color[2][2];
    back = new color[2][2];
    up = new color[2][2];
    down = new color[2][2];
    left = new color[2][2];
    right = new color[2][2];
    solStack = new Stack<Integer>(); //move tracking
    size = 2; //we've got a 2x2
  }//end constructor

  /**
   *Turns the cube given that the first is the one to be turned
   **/
  protected void turn(color[][] a, int turn) {

    color[] tmp = new color[2]; //new array to hold colors
    if (a.equals(front) && turn == 1) {
      rotateHC(front); //rotate front 90 degs
      //hardcoding start
      /**
       *Original colors:
       *Up: Yellow
       *Front: Red
       *Left: Green
       *Right: Blue
       *Down: White
       *Back: Orange
       */
      tmp[0] = up[1][0]; //add bottom row of up face to an array 
      tmp[1] = up[1][1];
      up[1][0] = left[1][1]; //left[1][1] is in this position because it's now on the side
      up[1][1] = left[0][1];
      left[0][1] = down[0][0]; //down[0][0] is the gray dot, moves to left's side 
      left[1][1] = down[0][1]; 
      down[0][0] = right[1][0]; 
      down[0][1] = right[0][0];
      right[0][0] = tmp[0];
      right[1][0] = tmp[1];
    } 
    if (a.equals(front) && turn == 0) {
      for (int x = 0; x < 3; x++) {
        turn(front, 1);
      }
    } 
    if (a.equals(right) && turn == 1) {
      rotateHC(right); //rotate front 90 degs

      tmp[0] = up[0][1];  
      tmp[1] = up[1][1];

      up[0][1] = front[0][1]; 
      up[1][1] = front[1][1];

      front[0][1] = down[0][1]; //down[0][0] is the gray dot, moves to left's side
      front[1][1] = down[1][1]; 

      down[0][1] = back[0][1]; 
      down[1][1] = back[1][1];

      back[0][1] = tmp[0];
      back[1][1] = tmp[1];
    } 
    if (a.equals(right) && turn == 0) {
      for (int x = 0; x < 3; x++) {
        turn(right, 1);
      }
    } 
    if (a.equals(left) && turn == 1) {
      rotateHC(left); //rotate front 90 degs

      tmp[0] = up[0][0];  
      tmp[1] = up[1][0];

      up[0][0] = back[0][0]; 
      up[1][0] = back[1][0];

      back[0][0] = down[0][0]; //down[0][0] is the gray dot, moves to left's side
      back[1][0] = down[1][0]; 

      down[0][0] = front[0][0]; 
      down[1][0] = front[1][0];

      front[0][0] = tmp[0];
      front[1][0] = tmp[1];
    } 
    if (a.equals(left) && turn == 0) {
      for (int x = 0; x < 3; x++) {
        turn(left, 1);
      }
    }
    if (a.equals(back) && turn == 0) {
      rotateDown();
      rotateDown();//now back is in the front pos
      turn(front,1);
      rotateUp();
      rotateUp();//put it back where it was
    } 
    if (a.equals(back) && turn == 1) {
      for (int x = 0; x < 3; x++) {
        turn(back, 0);
      }
    }
    if (a.equals(up) && turn == 1) {
      rotateDown();
      //now up is in the front pos
      turn(front,1);
      rotateUp();
      //put it back where it was
    } 
    if (a.equals(up) && turn == 0) {
      for (int x = 0; x < 3; x++) {
        turn(up, 1);
      }
    }
    if (a.equals(down) && turn == 1) {
      rotateUp();
      //now down is in the front pos
      turn(front,1);
      rotateDown();
      //put it back where it was
    } 
    if (a.equals(down) && turn == 0) {
      for (int x = 0; x < 3; x++) {
        turn(down, 1);
      }
    }
  }//end turn(color[][],int)
  private void rotateHC(color[][] a) {
    color temp = a[0][0];
    a[0][0] = a[1][0];
    a[1][0] = a[1][1];
    a[1][1] = a[0][1];
    a[0][1] = temp;
  }//end rotate
  private void rotateHCC(color[][] a) {
    color temp = a[0][0];
    a[0][0] = a[0][1];
    a[0][1] = a[1][1];
    a[1][1] = a[1][0];
    a[1][0] = temp;
  }//end rotation helper function

  public void rotateUp() {
    color[][] temp = front;
    front = down;
    down = back;
    back = up;
    up = temp;
    rotateHC(right);
    rotateHCC(left);
  }
  public void rotateDown() {
    color[][] temp = front;
    front = up;
    up = back;
    back = down;
    down = temp;
    rotateHC(left);
    rotateHCC(right);
  }
  public void rotateLeft() {
    color[][] temp = front;
    front = right;
    rotateHC(back);
    rotateHC(back);
    right = back;
    rotateHC(left);
    rotateHC(left);
    back = left;
    left = temp;
    rotateHC(up);
    rotateHCC(down);
  }
  public void rotateRight() {
    color[][] temp = front;
    front = left;
    rotateHC(back);
    rotateHC(back);
    left = back;
    rotateHC(right);
    rotateHC(right);
    back = right;
    right = temp;
    rotateHC(down);
    rotateHCC(up);
  }
}//end class
