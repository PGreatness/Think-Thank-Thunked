public class threeCube extends RubiksCube {
  public threeCube() {
    front = new color[3][3];
    back = new color[3][3];
    up = new color[3][3];
    down = new color[3][3];
    left = new color[3][3];
    right = new color[3][3];
    solStack = new Stack<Integer>(); //move tracking
    size = 3;
  }//end constructor
  protected void turn(color[][] a, int turn) {

    color[] tmp = new color[3]; //new array to hold colors
    if (a.equals(front) && turn ==1) {
      rotateHC(front);//front 90 degrees
      tmp[0] = up[2][0];
      tmp[1] = up[2][1];
      tmp[2] = up[2][2];
      //hard code lets go
      up[2][0] = left[2][2];
      up[2][1] = left[1][2];
      up[2][2] = left[0][2];
      //left --> up
      left[2][2] = down[0][2];
      left[1][2] = down[0][1];
      left[0][2] = down[0][0];
      //down --> left
      down[0][2] = right[0][0];
      down[0][1] = right[1][0];
      down[0][0] = right[2][0];
      //right --> down
      right[0][0] = tmp[0];
      right[1][0] = tmp[1];
      right[2][0] = tmp[2];
      //up --> right
    }//clockwise for front face
    if (a.equals(front) && turn == 0) {
      for (int x = 0; x < 3; x++) {
        turn(front, 1);
      }
    }
    if (a.equals(right) && turn == 1) {//c
      rotateLeft();//now right is in the front
      turn(front, 1);
      rotateRight();//now its back where it belongs
    }
    if (a.equals(right) && turn == 0) {//cc
      rotateLeft();//now right is in the front
      turn(front, 0);
      rotateRight();//now its back where it belongs
    }
    if (a.equals(left) && turn == 1) {
      rotateRight();//left is in the front spot
      turn(front,1);//clockwise turn
      rotateLeft();//now its back where it belongs
    }
    if (a.equals(left) && turn == 0) {
      rotateRight();//left is in the front spot
      turn(front,0);//counterclockwise turn
      rotateLeft();//now its back where it belongs
    }
    if (a.equals(up) && turn == 1) {
      rotateDown();//up is in the front spot
      turn(front,1);
      rotateUp();//now its back
    }
    if (a.equals(up) && turn == 0) {
      rotateDown();//up is in the front spot
      turn(front,0);
      rotateUp();//now its back
    }
    if (a.equals(down) && turn == 1) {
      rotateUp();//down is now in the front
      turn(front,1);
      rotateDown();//now its back 
    }
    if (a.equals(down) && turn == 0) {
      rotateUp();//down is now in the front
      turn(front,0);
      rotateDown();//now its back 
    }
    if (a.equals(back) && turn == 1) {
      rotateDown();
      rotateDown();
      turn(front,0);
      rotateUp();
      rotateUp();
    }
    if (a.equals(back) && turn == 0) {
      rotateDown();
      rotateDown();
      turn(front,1);
      rotateUp();
      rotateUp();
    }
  }//end turn(color[][],int)
  private void rotateHC(color[][] a) {
    color tmp = a[0][0];
    color tmp2 = a[0][1];
    //move corners clockwise; 
    a[0][0] =a[2][0];
    a[2][0] =a[2][2];
    a[2][2] =a[0][2];
    a[0][2] =tmp;
    //move middle pieces clockwise
    a[0][1] = a[1][0];
    a[1][0] = a[2][1];
    a[2][1] = a[1][2];
    a[1][2] = tmp2;
  }//end rotate
  private void rotateHCC(color[][] a) {//while this may seem inefficient its neglible due to the size of the cube in general use you wont be running 100k cubes at once
    for (int x = 0; x < 3; x++) {
      rotateHC(a);
    }
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
}
