import java.util.ArrayList; //<>// //<>//
Player p1;
ArrayList<Entity> entities;
ArrayList<Enemy> baddies;
void setup() {
  size(1280, 720);
  background(0, 0, 0);
  entities = new ArrayList<Entity>();
  /*VVVVVVVVVVVV Lines Added VVVVVVVVVVVV*/
  baddies = new ArrayList<Enemy>();
  int adder = 20; //makes the lines shift to make checkerboard pattern
  for (int baddieCount = 0; baddieCount <= 50; baddieCount++) {
    if (baddies.isEmpty()) { //first element of the list
      baddies.add(new Enemy(width / 4, height / 6));
    } else {
      if (baddies.get(baddieCount - 1). x + baddies.get(baddieCount - 1).radius + 10 < 3 * (width / 4)) { //x coord of baddies are in visually pleasing range
        baddies.add(new Enemy(baddies.get(baddieCount - 1).x + baddies.get(baddieCount - 1).radius + 40, baddies.get(baddieCount - 1).y));
      } else { //a new line of baddies need to be made
        baddies.add(new Enemy(baddies.get(0).x + baddies.get(0).radius + adder, baddies.get(baddieCount - 1).y + 40));
        if (adder > 0) { //shift baddies left or right depending on the previous line of baddies
          adder = -20;
        } else {
          adder = 20;
        }
      }
    }
  }
  /*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*/
  Player temp = new Player();
  p1 = temp;
  entities.add(p1);
}

void draw() {
  clear();
  for (Enemy bad : baddies) {
    fill(bad.myC);
    rect(bad.x, bad.y, bad.radius, bad.radius);
  }
  for (Entity n : entities) {
    if (n.state != -1) {
      fill(n.myC);
      ellipse(n.x, n.y, n.radius, n.radius);
    }
    if (n.state == 10) {
      n.y -=5;
      if (n.y < 0) {
        n.state = -1;
      }//mark it as dead
    }//update pos of projectiles
  }//stuff to do to all entities
}//end draw
void keyPressed() {
  //constrains to the given box added
  if (p1.y >= height / 2 && key == 119) {//w pressed
    p1.y -=20;
  }
  if (p1.x > 0 && key == 97) {//a pressed
    p1.x-=20;
  }
  if (p1.y < height && key == 115) {//s pressed
    p1.y+=20;
  }
  if (p1.x < width && key == 100) {//d pressed
    p1.x+=20;
  }
  if (key == 32) {//spacebar pressed
    entities.add(new Projectile(p1.x, p1.y));
  }
}
