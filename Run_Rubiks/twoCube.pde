public class twoCube extends RubiksCube {  //<>//

  public twoCube() {
    front = new color[2][2];
    back = new color[2][2];
    up = new color[2][2];
    down = new color[2][2];
    left = new color[2][2];
    right = new color[2][2];
  }//end constructor

  /**
   *Turns the cube given that the first is the one to be turned
   **/
  protected void turn(color[][] a, color[][] b, color[][] c, color[][] d, color[][] e) {
    //doesn't work, needs to be fixed
    
    color[] tmp = new color[2]; //new array to hold colors //<>//
    if (a.equals(front) && c.equals(right)) { //<>//
      rotateHC(front); //rotate front 90 degs //<>//
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
       //<>// //<>// //<>//
      up[1][0] = left[1][1]; //left[1][1] is in this position because it's now on the side
      up[1][1] = left[0][1];
       //<>// //<>// //<>//
      left[0][1] = down[0][0]; //down[0][0] is the gray dot, moves to left's side
      left[1][1] = down[0][1]; 
       //<>// //<>// //<>//
      down[0][0] = right[1][0]; 
      down[0][1] = right[0][0];
       //<>// //<>// //<>//
      right[0][0] = tmp[0];
      right[1][0] = tmp[1]; //<>// //<>// //<>//
      
    } //<>//
  }//end turn(int[][],int[][],int[][],int[][],int[][],int[][])
  private void rotateHC(color[][] a) { //<>//
    color temp = a[0][0]; //<>//
    a[0][0] = a[1][0]; //<>//
    a[1][0] = a[1][1]; //<>//
    a[1][1] = a[0][1]; //<>//
    a[0][1] = temp; //<>//
  }//end rotate //<>//
  private void rotateHCC(color[][] a) {
    color temp = a[0][0];
    a[0][0] = a[0][1];
    a[0][1] = a[1][1];
    a[1][1] = a[1][0];
    a[1][0] = temp;
  }//end ration function

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
  public void rotateRight() {
    color[][] temp = front;
    front = right;
    rotateHC(back);
    rotateHC(back);
    right = back;
    rotateHC(left);
    rotateHC(left);
    back = left;
    left = temp;
  }
  public void rotateLeft() {
    color[][] temp = front;
    front = left;
    rotateHC(back);
    rotateHC(back);
    left = back;
    rotateHC(right);
    rotateHC(right);
    back = right;
    right = temp;
  }
}//end class
