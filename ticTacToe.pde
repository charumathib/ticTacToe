PFont titleFont;
PFont xoFont;
boolean gameOver = false;
boolean shapesDrawn = false;
boolean xo = false;
boolean x_sect1, x_sect2, x_sect3, x_sect4, x_sect5, x_sect6, x_sect7, x_sect8, x_sect9;
boolean o_sect1, o_sect2, o_sect3, o_sect4, o_sect5, o_sect6, o_sect7, o_sect8, o_sect9;

int sector;
String X = "X", O = "O" ;

boolean isItXTurn = true ;
float x, y;

public void setup() {
  size(600, 700);
  xoFont = loadFont("Damascus-72.vlw");
  titleFont = loadFont("Damascus-48.vlw");
  drawScreen();
  resetStates();
}

void drawScreen() { 
  background(0);
  fill(255, 255, 255);
  rect(195, 100, 10, height-100);
  rect(395, 100, 10, height-100);
  rect(0, 295, width, 10);
  rect(0, 495, width, 10);

  textFont(titleFont);
  textAlign(CENTER);
  text("TIC TAC TOE", 300, 75);
}

public void draw() {
}

public void mousePressed() { 
  if (!isDrawingPresent() && !gameOver) {
    if ( isItXTurn) {
      draw_XO(X);
      isItXTurn = false;
      isGameOver(X);
    } else {
      draw_XO(O);
      isItXTurn = true;
      isGameOver(O);
    }
  }
}


public boolean isGameOver(String xo) { 
  if ( sector123(xo) || sector456(xo) || sector789(xo) ||
    sector147(xo) || sector258(xo) || sector359(xo) ||
    sector159(xo) || sector357(xo)) { 

    flashWinner(xo);

    // gameOverScreenXO(xo);
    println("Game Over");
    gameOver = true ;
  }
  return gameOver ;
}

void keyPressed() { 
  if ( key == ENTER ) { 
    drawScreen();
    resetStates();
  }
}



void flashWinner(String xo) {
  if (sector123(xo)) { 
    drawWinner(1, 2, 3, xo) ;
  } else if ( sector456(xo)) { 
    drawWinner(4, 5, 6, xo);
  } else if ( sector789(xo)) { 
    drawWinner(7, 8, 9, xo);
  } else if ( sector147(xo)) { 
    drawWinner(1, 4, 7, xo);
  } else if ( sector359(xo)) { 
    drawWinner(3, 5, 9, xo);
  } else if ( sector159(xo)) { 
    drawWinner(1, 5, 9, xo);
  } else if ( sector258(xo)) { 
    drawWinner(2, 5, 8, xo);
  } else if ( sector357(xo)) { 
    drawWinner(3, 5, 7, xo);
  }
}

void drawWinner(int sector1, int sector2, int sector3, String xo) { 
  Position p1 = new Position().getPositionGivenSectorNumber(sector1);
  Position p2 = new Position().getPositionGivenSectorNumber(sector2);
  Position p3 = new Position().getPositionGivenSectorNumber(sector3);
  fill(44, 250, 30);
  simplyDraw_XO(xo, p1.getX(), p1.getY());
  simplyDraw_XO(xo, p2.getX(), p2.getY());
  simplyDraw_XO(xo, p3.getX(), p3.getY());

  fill(0);
  rect(0, 0, 700, 100);
  fill(255, 243, 3);
  textFont(titleFont);
  textAlign(CENTER);
  text("GAME OVER" + "... " + xo + " WINS!!!", 300, 75);
}



// Checks to see if either "X" or "O" has taken up the sector 123. If so then it returns TRUE, else FALSE
boolean sector123(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect1 && x_sect2 && x_sect3 ;
  } 
  return o_sect1 && o_sect2 && o_sect3 ;
}

boolean sector456(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect4 && x_sect5 && x_sect6 ;
  }
  return o_sect4 && o_sect5 && o_sect6 ;
}
boolean sector789(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect7 && x_sect8 && x_sect9 ;
  }
  return o_sect7 && o_sect8 && o_sect9 ;
}
boolean sector147(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect1 && x_sect4 && x_sect7 ;
  }
  return o_sect1 && o_sect4 && o_sect7 ;
}
boolean sector258(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect2 && x_sect5 && x_sect8 ;
  }
  return o_sect2 && o_sect5 && o_sect8 ;
}
boolean sector359(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect3 && x_sect5 && x_sect9 ;
  }
  return o_sect3 && o_sect5 && o_sect9 ;
}
boolean sector159(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect1 && x_sect5 && x_sect9 ;
  }
  return o_sect1 && o_sect5 && o_sect9 ;
}
boolean sector357(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect3 && x_sect5 && x_sect7 ;
  }
  return o_sect3 && o_sect5 && o_sect7 ;
}


// Returns TRUE when the mouse is in a Sector
boolean isSector1() { 
  x = mouseX;
  y = mouseY;  
  return (x <= 195 && y>100 && y<295);
}

boolean isSector2() { 
  x = mouseX;
  y = mouseY;  
  return (x <= 395 && x>= 205 && y>=100 && y<=295);
}

boolean isSector3() { 
  x = mouseX;
  y = mouseY;  
  return (x <= width && x>=405 && y>=100 && y<=295);
}

boolean isSector4() { 
  x = mouseX;
  y = mouseY;  
  return (x <= 195 && y>=305 && y<=505);
}

boolean isSector5() { 
  x = mouseX;
  y = mouseY;  
  return (x <= 395 && x>=195 && y>=305 && y<=505);
}

boolean isSector6() { 
  x = mouseX;
  y = mouseY;  
  return (x <= width && x>=405 && y>=305 && y<=505);
}

boolean isSector7() { 
  x = mouseX;
  y = mouseY;  
  return (x <= 195 && y>=505 && y<= height);
}

boolean isSector8() { 
  x = mouseX;
  y = mouseY;  
  return (x <= 395 && x>=195 && y>=505 && y<=height);
}

boolean isSector9() { 
  x = mouseX;
  y = mouseY;  
  return (x <= width &&  x>=405 && y>=505 && y<=height);
}

// When "X" or "O" is passed to this method for drawing them on the screen, 
// First a check is made with helper method getPositionGivenMouseLocation to obtain the "x" and "y" coordinates
// Then make a call to draw "X" or "O".
public void draw_XO(String xo) {   
  Position position = new Position().getPositionGivenMouseLocation();
  simplyDraw_XO(xo, position.getX(), position.getY());
}

// Draw at the given position either "X" or "O" and update the respective sector's boolean to true.
public void simplyDraw_XO(String xo, int x, int y) { 
  textFont(xoFont);
  text(xo, x, y);
  setSectorDrawnState(xo);
}

// Checks to see if a sector has been already drawn. We know this by checking to see the boolean for that particular sector
// for either "X" or "O". If they are set, then that particular sector is considered "drawing present"
public boolean isDrawingPresent() { 

  boolean returnState = false ; 
  if ( isSector1() ) { 
    returnState = x_sect1 || o_sect1 ;
  } else if ( isSector2()) { 
    returnState = x_sect2 || o_sect2 ;
  } else if ( isSector3()) { 
    returnState = x_sect3 || o_sect3 ;
  } else if ( isSector4()) { 
    returnState = x_sect4 || o_sect4;
  } else if ( isSector5()) { 
    returnState = x_sect5 || o_sect5;
  } else if ( isSector6()) { 
    returnState = x_sect6 || o_sect6 ;
  } else if ( isSector7()) { 
    returnState = x_sect7 || o_sect7 ;
  } else if ( isSector8()) { 
    returnState = x_sect8 || o_sect8 ;
  } else if ( isSector9()) { 
    returnState = x_sect9 || o_sect9 ;
  }
  return returnState ;
}

// Find the position and set the state of the boolean for that sector
// If the passed variable xo = "X" and if the sector1 is true, then the statement 
// x_sect1 = "X".equals(X) will be true ;
public void setSectorDrawnState(String xo) { 
  if ( isSector1() ) { 
    x_sect1 = xo.equals(X);
    o_sect1 = xo.equals(O);
  } else if ( isSector2()) { 
    x_sect2 = xo.equals(X);
    o_sect2 = xo.equals(O);
  } else if ( isSector3()) { 
    x_sect3 = xo.equals(X);
    o_sect3 = xo.equals(O);
  } else if ( isSector4()) { 
    x_sect4 = xo.equals(X);
    o_sect4 = xo.equals(O);
  } else if ( isSector5()) { 
    x_sect5 = xo.equals(X);
    o_sect5 = xo.equals(O);
  } else if ( isSector6()) { 
    x_sect6 = xo.equals(X);
    o_sect6 = xo.equals(O);
  } else if ( isSector7()) { 
    x_sect7 = xo.equals(X);
    o_sect7 = xo.equals(O);
  } else if ( isSector8()) { 
    x_sect8 = xo.equals(X);
    o_sect8 = xo.equals(O);
  } else if ( isSector9()) { 
    x_sect9 = xo.equals(X);
    o_sect9 = xo.equals(O);
  }
}

public void resetStates() { 
  x_sect1 = false ; 
  x_sect2 = false ; 
  x_sect3 = false ; 
  x_sect4 = false ; 
  x_sect5 = false ; 
  x_sect6 = false ; 
  x_sect7 = false ; 
  x_sect8 = false ; 
  x_sect9 = false ; 

  o_sect1 = false ; 
  o_sect2 = false ; 
  o_sect3 = false ; 
  o_sect4 = false ; 
  o_sect5 = false ; 
  o_sect6 = false ; 
  o_sect7 = false ; 
  o_sect8 = false ; 
  o_sect9 = false ; 

  gameOver = false ;
}