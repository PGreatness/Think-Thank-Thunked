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
    color[] tmp = new color[2]; //new array to replace a //<>//
    if (a.equals(front) && c.equals(right)) { //<>//
      rotateHC(front); //<>//
      for (int i = 0; i < up.length; i++) { //<>//
       tmp[i] = up[up.length - 1][i];  //<>//
      } //<>//
      for (int i = 0; i < left.length; i++) { //<>//
       up[up.length - 1][i] = left[i][left.length - 1]; //<>//
      } //<>//
      for (int i = 0; i < down.length; i++) { //<>//
       left[i][left.length - 1] = down[0][i]; //<>//
      } //<>//
      for (int i = 0; i < right.length; i++) { //<>//
       down[0][i] = right[i][0]; //<>//
      } //<>//
      for (int i = 0; i < tmp.length; i++) { //<>//
       right[i][0] = tmp[i]; //<>//
      } //<>//
      
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
