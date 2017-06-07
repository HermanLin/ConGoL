import java.util.*;

//variables
Cell[][] cells;

void setup() {
  //screen setup;
  size(600, 400);
  background(0);
  //frameRate(60);
  
  //create a grid of Cell
  cells = new Cell[width/5][height/5];
  for (int i = 0; i < width/5; i += 1) { 
    for (int j = 0; j < height/5; j += 1) { 
      cells[i][j] = new Cell(i, j, this);
    }
  } 
  cells[0][0].cell.setStroke(255);
  
  //randomize cell life
  for (int i = 0; i < width/5; i += 1) { 
    for (int j = 0; j < height/5; j += 1) { 
      int n = (int) random(10);
      if (n == 0) {
        cells[i][j].cell.setFill(0);
        cells[i][j].life = true;
      }
    }
  }
}

void draw() {
  //render cells
  for (int i = 0; i < width/5; i += 1) { 
    for (int j = 0; j < height/5; j += 1) { 
      cells[i][j].render();
      cells[i][j].checkAround();
      cells[i][j].liveOrDie();
    }
  }
  //noLoop()
  //loop()
  //redraw()
}