class Cell {

  int x;
  int y;
  int life;

  PShape cell;
  CGoL durr;

  Cell(int xCoor, int yCoor, CGoL game) {
    durr = game;
    x = xCoor * 5;
    y = yCoor * 5;
    life = 0;

    cell = createShape(RECT, x, y, 5, 5);
    beginShape();
    stroke(255);
    endShape();
  }

  int countNeighbors() {
    int ret = 0;
    int xVal = (x + 5) / 5 - 1;
    int yVal = (y + 5) / 5 - 1;

    try {
      if ((durr.cells[xVal - 1][yVal - 1].life == 1)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal][yVal - 1].life == 1)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal + 1][yVal - 1].life == 1)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal + 1][yVal].life == 1)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal + 1][yVal + 1].life == 1)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal][yVal + 1].life == 1)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal - 1][yVal + 1].life == 1)) ret ++;
    }
    catch (Exception e) {
    }
    try {
      if ((durr.cells[xVal - 1][yVal].life == 1)) ret ++;
    }
    catch (Exception e) {
    }

    return ret;
  }

  void checkAround() {
    //Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    //Any live cell with more than three live neighbours dies, as if by overpopulation.
    if ((life == 1) && (countNeighbors() < 2 || countNeighbors() > 3)) life = 0;
    //Any live cell with two or three live neighbours lives on to the next generation.
    if ((life == 1) && (countNeighbors() == 2 || countNeighbors() == 3)) life = 1;    
    //Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    if ((life == 0) && (countNeighbors() == 3)) life = 1;
  }

  void liveOrDie() {
    if (life == 1) {
      cell.setFill(0);
    } else if (life == 0) {
      cell.setFill(255);
    }
  }

  void render() {
    shape(cell);
  }
}