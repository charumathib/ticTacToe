PFont titleFont;
PFont xoFont;
boolean gameOver = false;
boolean shapesDrawn = false;
boolean xo = false;
int sector;
float x, y;
public void setup() {
  titleFont = loadFont("Damascus-48.vlw");
  textFont(titleFont);
  size(600, 700);
  background(0);
  rect(195, 100, 10, height-100);
  rect(395, 100, 10, height-100);
  rect(0, 295, width, 10);
  rect(0, 495, width, 10);
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
    if (xo == false) {
      textFont(titleFont);
      text("X", 100, 200);
    }
    if (x <= 395 && x>= 205 && y>=100 && y<=295) {
      sector = 2;
      if (xo == false) {
        textFont(titleFont);
        text("X", 250, 200);
      }
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
}