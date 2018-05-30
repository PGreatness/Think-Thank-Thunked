public class Cube {
  color[][] front;
  color[][] back;
  color[][] top;
  color[][] bottom;
  color[][] left;
  color[][] right;

  public Cube(int size) {
    front = new color[size][size];
    back = new color[size][size];
    top = new color[size][size];
    bottom = new color[size][size];
    left = new color[size][size];
    right = new color[size][size];
    
    for (color[] a : front) {
      for (color b : a) {
        b = color(20, 27, 216); //blue
      }
    }
    
    for (color[] a : back) {
      for (color b : a) {
        b = color(216, 20, 23); //red
      }
    }
    
    for (color[] a : top) {
      for (color b : a) {
        b = color(20, 216, 21); //green
      }
    }
    
    for (color[] a : bottom) {
      for (color b : a) {
        b = color(231, 240, 12); //yellow
      }
    }
    
    for (color[] a : left) {
      for (color b : a) {
        b = color(20, 27, 216); //blue
      }
    }
    
    for (color[] a : right) {
      for (color b : a) {
        b = color(256, 256, 256); //white
      }
    }
    
  }//end constructor
  
}//end class