public class Button {
  int x;
  int y;
  String message;
  float xsize;
  float ysize;
  boolean isPressed = false;
  public Button(int xCoor, int yCoor, float xSize, float ySize, String writing) {
    x = xCoor;
    y = yCoor;
    xsize = xSize / 2;
    ysize = ySize / 2;
    message = writing;
  }//end constuctor
  
  public void makeButton() {
      fill(#C1BFBF);
      rect(x, y, xsize, ysize);
      fill(#FF0000);
      text(message, x, y, xsize, ysize); 
  }
  void mouseClicked() {
    if (mouseX >= x && mouseX <= x + xsize && mouseY >= y && mouseY <= y + ysize) {      
      fill(#080707);
      rect(x, y, xsize, ysize);
      fill(#FAF7F7);
      text(message, x, y, xsize, ysize);
      isPressed = true;
    }
  }
}
