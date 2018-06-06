public class Button {
  int x;
  int y;
  String message;
  float xsize;
  float ysize;
  public Button(int xCoor, int yCoor, float xSize, float ySize, String writing) {
    x = xCoor;
    y = yCoor;
    xsize = xSize / 2;
    ysize = ySize / 2;
    message = writing;
  }//end constuctor
  
  public void makeButton() {
    rect(x, y, xsize, ysize);
    text(message, x, y, xsize, ysize);
  }
  
}