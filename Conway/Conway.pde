import java.util.*;

//variables
int[][] cells;
boolean pause;
int life;

//setup
void setup() {
  //screen setup;
  size(1000, 800);
  background(0);
  frameRate(24);
  pause = false;

  //create grid lines
  stroke(48);

  //initialize 2D array
  cells = new int[width/5][height/5];
  //spawn new world of 'cells'
  newWorld();
}

void draw() {
  //if not paused
  if (!pause) {
    deadOrAlive();
    changeStates();
  }
}

//randomize the world with dead/alive cells
void newWorld() {
  for (int x = 0; x < width/5; x ++) {
    for (int y = 0; y < height/5; y ++) {
      cells[x][y] = int(random(2));
      if (cells[x][y] == 1) {
        renderCell(x, y, 1);
      } else {
        renderCell(x, y, 0);
      }
    }
  }
}

//make the world dead
void clearWorld() {
  for (int x = 0; x < width/5; x ++) {
    for (int y = 0; y < height/5; y ++) {
      cells[x][y] = 0;
      renderCell(x, y, 0);
    }
  }
}

//color cell based on life state
void renderCell(int x, int y, int status) {
  if (status == 1) {
    fill(255);
    rect(x * 5, y * 5, 4, 4);
  } else {
    fill(0);
    rect(x * 5, y * 5, 4, 4);
  }
}

//count the number of neighbors around the cell
int countNeighbors(int x, int y) {
  int neighbors = 0;

  for (int i = -1; i <= 1; i ++) {
    for (int j = -1; j <= 1; j ++) {
      if (i == 0 && j == 0) continue; 
      if ((x + i >= 0 && x + i < width/5) && 
        (y + j >= 0 && y + j < height/5) && 
        (cells[x + i][y + j] == 1 || cells[x + i][y + j] == -1))
        neighbors ++;
    }
  }

  return neighbors;
}

//render cells
void deadOrAlive() {
  int num;

  for (int x = 0; x < width/5; x ++) {
    for (int y = 0; y < height/5; y ++) {
      num = countNeighbors(x, y);

      //Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
      if (cells[x][y] == 0 && num == 3) {
        cells[x][y] = 2;
        renderCell(x, y, 1);
      }
      //Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
      //Any live cell with more than three live neighbours dies, as if by overpopulation.
      if (cells[x][y] == 1 && (num < 2 || num > 3)) {
        cells[x][y] = -1;
        renderCell(x, y, 0);
      }
    }
  }
}

//change life state to original statuses
void changeStates() {
  for (int x = 0; x < width/5; x ++) {
    for (int y = 0; y < height/5; y ++) {
      if (cells[x][y] == 2) cells[x][y] = 1;
      if (cells[x][y] == -1) cells[x][y] = 0;
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') newWorld();
  if (key == ' ') pause = !pause;
  if (key == 'c' || key == 'C') { 
    clearWorld();
    if (pause == true) pause = false;
  }
}