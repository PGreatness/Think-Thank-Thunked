public class Enemy extends Entity {
  int health;
  public Enemy(float initX, float initY) {
    health = 1;
    x = initX;
    y = initY;
    radius = 20;
    myC = color(#D80D0D); //red color
    state = 5;
  }
}
