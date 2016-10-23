PFont titleFont;
PFont xoFont;
boolean gameOver = false;
boolean shapesDrawn = false;
boolean xo = false;
int sector;
float x, y;
public void setup() {
  size(600, 700);
  drawScreen();
}

void drawScreen() { 
  background(0);
  rect(195, 100, 10, height-100);
  rect(395, 100, 10, height-100);
  rect(0, 295, width, 10);
  rect(0, 495, width, 10);

  titleFont = loadFont("Damascus-48.vlw");
  textFont(titleFont);
  textAlign(CENTER);
  text("TIC TAC TOE", 300, 75);
}

public void draw() {
  if (mousePressed == true) {
    mouseDetection();
  }
}


public void mouseDetection() {
  x = mouseX;
  y = mouseY;

  if (x <= 195 && y>100 && y<295) {
    sector = 1;
    drawShapes();
  }
  if (x <= 395 && x>= 205 && y>=100 && y<=295) {
    sector = 2;
    drawShapes();
  }
  if (x <= width && x>=405 && y>=100 && y<=295) {
    sector = 3;
  }
  if (x <= 195 && y>=305 && y<=505) {
    sector = 4;
  }
  if (x <= 395 && x>=195 && y>=305 && y<=505) {
    sector = 5;
  }
  if (x <= width && x>=405 && y>=305 && y<=505) {
    sector = 6;
  }
  if (x <= 395 && x>= 195 && y>=505 && y<= height) {
    sector = 7;
  }
  if (x <= 395 && x<=195 && y>=505 && y<=height) {
    sector = 8;
  }
  if (x <= width &&  x>=405 && y>=505 && y<=height) {
    sector = 9;
  }
}
public void drawShapes() {
  if (xo == false) {
    titleFont = loadFont("Damascus-48.vlw");
    textFont(titleFont);
    text("TIC TAC TOE", 300, 75);
  }
}