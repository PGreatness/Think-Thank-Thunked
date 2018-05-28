import java.util.ArrayList;
ArrayList<Face> faces;
public final color BLUE = #2013E8;
public final color RED = #E81313;
public final color GREEN = #23F216;
public final color YELLOW = #EAF216;
public final color WHITE = #F0F0F5;
public final color ORANGE = #F28F16;
public Face currFace;
void setup() {
  size(600, 600);
  faces = new ArrayList<Face>();
  faces.add(new Face(BLUE, 50)); //<>//
  faces.add(new Face(RED, 50));
  faces.add(new Face(GREEN, 50));
  faces.add(new Face(YELLOW, 50));
  faces.add(new Face(WHITE, 50));
  faces.add(new Face(ORANGE, 50));
  currFace = faces.get(0);
}

//doesn't work, needs to be debugged. Rectangles are not drawn
void draw() {
  clear();
  for (int mc = 0; mc < 9; mc++) { //<>//
    fill(currFace.cubes.get(mc).myCol);  //<>//
    if (mc == 0) { //first element of list has to start the drawing somewhere //<>//
      currFace.cubes.get(mc).x = width / 2; //<>//
      currFace.cubes.get(mc).y = height / 2; //<>//
      //draw a rectangle at the given (x,y) coords with a specified size
      rect(currFace.cubes.get(mc).x,currFace.cubes.get(mc).y, currFace.cubes.get(mc).xSize, currFace.cubes.get(mc).ySize); //<>//
    } else { //this is not the first element to be drawn //<>//
      if (currFace.cubes.get(mc - 1).x + 5 < width) { //still within visible boundaries //<>//
      //take from previous cube's x and give some spacing
        currFace.cubes.get(mc).x = currFace.cubes.get(mc - 1).x + 5; //<>//
        currFace.cubes.get(mc).y = currFace.cubes.get(mc - 1).y; //<>//
        rect(currFace.cubes.get(mc).x, currFace.cubes.get(mc).y, currFace.cubes.get(mc).xSize, currFace.cubes.get(mc).ySize); //<>//
      }else{ //a new line of cubes have to be made //<>//
        currFace.cubes.get(mc).x = currFace.cubes.get(0).x; //<>//
        currFace.cubes.get(mc).y = currFace.cubes.get(mc - 1).y + 5; //<>//
        rect(currFace.cubes.get(mc).x, currFace.cubes.get(mc).y, currFace.cubes.get(mc).xSize, currFace.cubes.get(mc).ySize); //<>//
      }
    }
  }
}
