public class twoCube extends RubiksCube { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

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
    color[][] replace = new color[2][2]; //new array to replace a
    color[] tmp = new color[2]; 

    for (int i = 0; i < a[0].length; i++) {
      int count = 0; //used to insert in correct place for tmp

      //traverse through from bottom to top, left to right to represent a 90 degree turn clockwise
      for (int j = a.length - 1; j > -1; j--) {
        tmp[count] = a[j][i]; //represents a 90 degree clockwise turn
        count++; //count is increased to go through tmp
      } //end inner clockwise turn FOR loop

      //copy tmp into replace, else it becomes a pointer
      for (int w = 0; w < tmp.length; w++) {
        replace[i][w] = tmp[w];
      }//end inner copy FOR loop
    } //end outer FOR loop
    //check what a is equal and set that as the replace array
    if (a.equals(front)) {
      front = replace;
    } else {
      if (a.equals(back)) {
        back = replace;
      } else {
        if (a.equals(up)) {
          up = replace;
        } else {
          if (a.equals(left)) {
            left = replace;
          } else {
            if (a.equals(down)) {
              down = replace;
            } else {
              right = replace;
            }
          }
        }
      }
    }
  }//end turn(int[][],int[][],int[][],int[][],int[][],int[][])
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
  }
}//end class
