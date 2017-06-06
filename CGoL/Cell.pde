class Cell {

  int x;
  int y;
  boolean life;

  PShape cell;
  CGoL durr;

  Cell(int xCoor, int yCoor, CGoL game) {
    durr = game;
    x = xCoor;
    y = yCoor;
    life = false;

    cell = createShape(RECT, x, y, 5, 5);
    beginShape();
    stroke(255);
    endShape();
  }

  int countNeighbors() {
    int ret = 0;
    if (durr.cells[x - 1][y - 1].life) ret ++;
    if (durr.cells[x][y - 1].life) ret ++;
    if (durr.cells[x + 1][y - 1].life) ret ++;
    if (durr.cells[x + 1][y].life) ret ++;
    if (durr.cells[x + 1][y + 1].life) ret ++;
    if (durr.cells[x][y + 1].life) ret ++;
    if (durr.cells[x - 1][y + 1].life) ret ++;
    if (durr.cells[x - 1][y].life) ret ++;
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

  void render() {
    shape(cell);
  }
}