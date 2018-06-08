//Class to make a button. Works as a switch, can only be on once

public class Button {
  int x; //x-coordinate of button
  int y; //y-coordinate of button
  String message; //message to be put in button
  float xsize; //length of button
  float ysize; //height of button
  boolean isPressed = false; //whether or not the button is being pressed
  public Button(int xCoor, int yCoor, float xSize, float ySize, String writing) {
    x = xCoor;
    y = yCoor;
    xsize = xSize / 2; 
    ysize = ySize / 2;
    message = writing;
  }//end constuctor
  
  //display button with pre-made colors
  public void makeButton() {
      fill(#C1BFBF);
      rect(x, y, xsize, ysize);
      fill(#0A0A0A);
      text(message, x, y, xsize, ysize); 
  }//end makeButton()
  void mouseClicked() {
    if (mouseX >= x && mouseX <= x + xsize && mouseY >= y && mouseY <= y + ysize) { //mouse is in range of button
      fill(#080707);
      rect(x, y, xsize, ysize);
      fill(#FAF7F7);
      text(message, x, y, xsize, ysize);
      isPressed = true; //lever action
    }//end if
  }//end mouseClicked()
}//end class
