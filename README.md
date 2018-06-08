# Virtual Rubik's Cube
Created By: Think-Thank-Thunked - Colin Hosking, Peter Cwalina, Ahnaf Hasan

### Description 
The Virtual Rubik's Cube offers user's a fully-functional Rubik's cube on their computer.
Users can select between types of cube (2x2 or 3x3) and viewing style (front face only or entire cube unfolded). 
The user can then shuffle the cube.
All 6 moves are availible to the user to make, as well as rotating the cube physically without altering its state.
The user can also ask for a hint and and the move that will solve the cube the fastest will be printed in the terminal.
Lastly, the user can experience immense satisfaction when toggling on/off the autosolver, in which the cube magically solves itself from any state.

### Inner Workings
We use six 2D arrays to store the colors of each face. 
The driver of the simulation, along with checking for button presses, simply prints out a cube according to the colors 
stored in these arrays. The arrays are modified when the user either makes a move or physically rotates the cube.

The move tracking is initiated when the cube is shuffled. A sequence of random moves will be performed on the cube, 
and their opposites will be pushed into a stack. When the user makes a move, if it is a correct move (the top of the stack
matches it), the stack is popped. If the move is incorrect, the opposite is pushed onto the stack. Then the program checks
if the stack contains any circular moves (for of any move in a row or one move + its oppisite), and pops them if they are present.

### Launch Instructions

**Setup**
1. Clone repo.
2. Open file located at: ThinkThankThunked/Run_Rubiks/Run_Rubiks.pde  
3. Click on "Play" button in top left corner of window.

**Controls:**

*On-Screen Buttons*

Click for Commands - displays all controls

Toggle Cutout - toggles the style in which the cube is displayed. One style depicts all 6 faces 'unfolded', with the front face in the center, while the other style depitcs only the front face visible.

Switch Cube - toggles type of cube (2x2 or 3x3)

*Rotation*

W - physically rotates upward (front face ---> up face)

A - physically rotates left (front face ---> left face)

S - physically rotates right (front face ---> right face)

D - physically rotates downward (front face ---> down face)

*Turning*

b - turns the front face clockwise

B - turns the front face counterclockwise

g - turns the right face clockwise

G - turns the right face counterclockwise

g - turns the right face clockwise

G - turns the right face counterclockwise

h - turns the left face clockwise

H - turns the left face counterclockwise

n - turns the back face clockwise

N - turns the back face counterclockwise

j - turns the up face clockwise

J - turns the up face counterclockwise

m - turns the down face clockwise

M - turns the down face counterclockwise

*Misc*

X - shuffles the cube

z - resets the cube 

Z - TOGGLES the solution animation. Cube will solve before your eyes with this mode toggled.

r - a hint is printed in the right of window

y - toggles between 2x2 and 3x3 cube
