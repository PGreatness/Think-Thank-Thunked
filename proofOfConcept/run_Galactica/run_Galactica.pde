import java.util.ArrayList;
Player p1;
ArrayList<Entity> entities;
void setup() {
  size(1280, 720);
  background(0, 0, 0);
  entities = new ArrayList<Entity>();
  Player temp = new Player();
  p1 = temp;
  entities.add(p1);
}

void draw() {
  clear();
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
  if (key == 119) {//w pressed
    p1.y -=20;
  }
  if (key == 97) {//a pressed
    p1.x-=20;
  }
  if (key == 115) {//s pressed
    p1.y+=20;
  }
  if (key == 100) {//d pressed
    p1.x+=20;
  }
  if (key == 32) {//spacebar pressed
    entities.add(new Projectile(p1.x, p1.y));
  }
}
