RubiksCube player;

void setup(){
  size(1280,720);
  player = new twoCube();
}

void draw(){
  clear();
  int x =720;
  int y = 360;
   for(color[] m : player.front){
      for (color n : m){
        fill(n);
        ellipse(x,y,50,50);
        x+=100;
      }
      y+=100;
      x = 720;
   }
}
