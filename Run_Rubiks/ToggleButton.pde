public class ToggleButton extends Button {
  public ToggleButton(int xCoor, int yCoor, float xSize, float ySize, String writing) {
    super(xCoor, yCoor, xSize, ySize, writing);
  }//end constuctor
  
  public void makeButton() {
    super.makeButton();
  }
  
  public void mouseClicked() {
    if (mouseX >= x && mouseX <= x + xsize && mouseY >= y && mouseY <= y + ysize) {      
      fill(#080707);
      rect(x, y, xsize, ysize);
      fill(#FAF7F7);
      text(message, x, y, xsize, ysize);
      isPressed = !isPressed;
    }
  }
}
