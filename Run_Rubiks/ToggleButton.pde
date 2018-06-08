/**
*Button subclass that works as a lever, able to be both on and off multiple times
*/

public class ToggleButton extends Button {
  public ToggleButton(int xCoor, int yCoor, float xSize, float ySize, String writing) {
    super(xCoor, yCoor, xSize, ySize, writing); //inherit from super
  }//end constuctor
  
  //display button
  
  public void makeButton() {
    super.makeButton();
  }//end makeButton()
  
  public void mouseClicked() {
    if (mouseX >= x && mouseX <= x + xsize && mouseY >= y && mouseY <= y + ysize) {      
      fill(#080707);
      rect(x, y, xsize, ysize);
      fill(#FAF7F7);
      text(message, x, y, xsize, ysize);
      isPressed = !isPressed; //allows togglability
    }//end if
  }//end mouseClicked()
}//end class
