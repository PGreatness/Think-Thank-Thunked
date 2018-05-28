import java.util.ArrayList;
public class Face{
  ArrayList<miniCube> cubes = new ArrayList<miniCube>();
  public Face(color x, float size) {
     for (int i = 0; i < 9; i++) {
       if (x == color(#2013E8)) { //code for blue
         cubes.add(new blueCube(size, size)); //<>//
         println("Cube added blue");
       }
       if (x == color(#23F216)) { //code for green
         cubes.add(new greenCube(size, size));
         println("Cube added green");
       }
       if (x == color(#F28F16)) { //code for orange
         cubes.add(new orangeCube(size, size));
         println("Cube added orange");
       }
       if (x == color(#E81313)) { //code for red
         cubes.add(new redCube(size, size));
         println("Cube added");
       }
       if (x == color(#F0F0F5)) { //code for white
        cubes.add(new whiteCube(size, size)); 
        println("Cube added white");
       }
       if (x == color(#EAF216)) { //code for yellow
         cubes.add(new yellowCube(size, size));
         println("Cube added yellow");
       }
     }
   }
}
