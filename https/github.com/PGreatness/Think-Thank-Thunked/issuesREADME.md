# Virtual Rubik's Cube
Created By: Think-Thank-Thunked - Colin Hosking, Peter Cwalina, Ahnaf Hasan

### Description 
The Virtual Rubik's Cube offers user's a fully-functional Rubik's cube on their computer.
Users can select between types of cube (2x2 or 3x3) and viewing style (front face only or entire cube unfolded). 
The user can then shuffle the cube.
All 6 moves are availible to the user to make, as well as rotating the cube physically without altering its state.
The user can also ask for a hint and and the move that will solve the cube the fastest will be printed in the terminal.

### Inner Workings
We use six 2D arrays to store the colors of each face. 
The driver of the simulation, along with checking for button presses, simply prints out a cube according to the colors 
stored in these arrays. The arrays are modified when the user either makes a move or physically rotates the cube.
Each possible rotation has its own method, but the moves 

The move tracking is initiated when the cube is shuffled. A sequence of random moves will be performed on the cube, 
and their opposites will be pushed into a stack. When the user makes a move, if it is a correct move (the top of the stack
matches it), the stack is popped. If the move is incorrect, the opposite is pushed onto the stack. Then the program checks
if the stack contains any circular moves (for of any move in a row or one move + its oppisite), and pops them if they are present.

### Launch Instructions
1. Open program through Processing application.
2. Select type of cube and viewing style.
3. User labled buttons to navigate the simulation
