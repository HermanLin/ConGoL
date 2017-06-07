class Cell {

  int x;
  int y;
  boolean life;

  PShape cell;
  CGoL durr;

  Cell(int xCoor, int yCoor, CGoL game) {
    durr = game;
    x = xCoor * 5;
    y = yCoor * 5;
    life = false;

    cell = createShape(RECT, x, y, 5, 5);
    beginShape();
    stroke(255);
    endShape();
  }

  int countNeighbors() {
    int ret = 0;
    int xVal = (x + 5) / 5 - 1;
    int yVal = (y + 5) / 5 - 1;
    /*
    //case 1: the corner
     if (xVal == 0 && yVal == 0) {
     if ((life) && (durr.cells[xVal + 1][yVal].life)) ret ++;
     if ((life) && (durr.cells[xVal][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal + 1].life)) ret ++;
     } else if (xVal == width/5 && yVal == 0) {
     if ((life) && (durr.cells[xVal][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal].life)) ret ++;
     } else if (xVal == 0 && yVal == height/5) {
     if ((life) && (durr.cells[xVal][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal].life)) ret ++;
     } else if (xVal == width/5 && yVal == height/5) {
     if ((life) && (durr.cells[xVal - 1][yVal].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal][yVal - 1].life)) ret ++;
     }
     //case 2: on the edge
     else if (xVal == 0) {
     if ((life) && (durr.cells[xVal][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal][yVal + 1].life)) ret ++;
     } else if (xVal == width/5) {
     if ((life) && (durr.cells[xVal - 1][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal].life)) ret ++;
     } else if (yVal == 0) {
     if ((life) && (durr.cells[xVal + 1][yVal].life)) ret ++;
     if ((life) && (durr.cells[xVal + 1][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal].life)) ret ++;
     } else if (yVal == height/5) {
     if ((life) && (durr.cells[xVal][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal + 1].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal].life)) ret ++;
     if ((life) && (durr.cells[xVal - 1][yVal - 1].life)) ret ++;
     if ((life) && (durr.cells[xVal][yVal - 1].life)) ret ++;
     }
     */
    //case 3: within the borders
    try {
      if ((durr.cells[xVal - 1][yVal - 1].life)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal][yVal - 1].life)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal + 1][yVal - 1].life)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal + 1][yVal].life)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal + 1][yVal + 1].life)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal][yVal + 1].life)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal - 1][yVal + 1].life)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal - 1][yVal].life)) ret ++;
    }
    catch (Exception e) {
    }

    return ret;
  }

  void checkAround() {
    //Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    if ((life) && (countNeighbors() < 2)) life = false;
    //Any live cell with two or three live neighbours lives on to the next generation.
    if ((life) && (countNeighbors() == 2 || countNeighbors() == 3)) life = true;
    //Any live cell with more than three live neighbours dies, as if by overpopulation.
    if ((life) && (countNeighbors() > 3)) life = false; 
    //Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    if ((!life) && (countNeighbors() == 3)) life = true;
  }

  void liveOrDie() {
    if (life) {
      cell.setFill(0);
    } else if (!life) {
      cell.setFill(255);
    }
  }

  void render() {
    shape(cell);
  }
}