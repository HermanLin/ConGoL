import java.util.*;

//variables
Cell[][] cells;

void setup() {
  //screen setup;
  size(600, 400);
  background(0);
  frameRate(1);
  
  //create a grid of Cell
  cells = new Cell[width][height];
  for (int i = 0; i < width; i += 5) { 
    for (int j = 0; j < height; j += 5) { 
      cells[i][j] = new Cell(i, j, this);
    }
  } 
  cells[0][0].cell.setStroke(255);
  
  //randomize cell life
  for (int i = 0; i < width; i += 5) { 
    for (int j = 0; j < height; j += 5) { 
      int n = (int) random(5);
      if (n == 4) {
        cells[i][j].cell.setFill(0);
        cells[i][j].life = true;
      }
    }
  }
}

void draw() {
  //render cells
  for (int i = 0; i < width; i += 5) { 
    for (int j = 0; j < height; j += 5) { 
      cells[i][j].render();
    }
  }
  //noLoop()
  //loop()
  //redraw()
}