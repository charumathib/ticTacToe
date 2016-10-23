PFont titleFont;
PFont xoFont;
boolean gameOver = false;
boolean gameOverX, gameOverO ; 
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
  drawScreen();
  xoFont = loadFont("Damascus-72.vlw");
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

    if ( xo.equals(X)) { 
      gameOverX = true ;
    } else { 
      gameOverO = true ;
    }

    println("Game Over");
  }
  gameOver = gameOverX || gameOverO ;
  return gameOver ;
}


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
    return x_sect1 && x_sect2 && x_sect3 ;
  }
  return o_sect1 && o_sect2 && o_sect3 ;
}
boolean sector147(String xo) { 
  if ( xo.equals(X)) { 
    return x_sect1 && x_sect2 && x_sect3 ;
  }
  return o_sect1 && o_sect2 && o_sect3 ;
}
boolean sector258(String xo) { 

  return true ;
}
boolean sector359(String xo) { 

  return true ;
}
boolean sector159(String xo) { 

  return true ;
}
boolean sector357(String xo) { 

  return true ;
}



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


public void draw_XO(String xo) {   
  Position position = getPosition();
  textFont(xoFont);
  text(xo, position.getX(), position.getY());
  if ( xo.equals(X)) { 
    setSector_X_DrawnState(true);
  } else { 
    setSector_O_DrawnState(true);
  }
}


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

// Find the position and set the state of the variable for that sector
public void setSector_X_DrawnState(boolean state) { 
  if ( isSector1() ) { 
    x_sect1 = state ;
  } else if ( isSector2()) { 
    x_sect2 = state ;
  } else if ( isSector3()) { 
    x_sect3 = state ;
  } else if ( isSector4()) { 
    x_sect4 = state ;
  } else if ( isSector5()) { 
    x_sect5 = state ;
  } else if ( isSector6()) { 
    x_sect6 = state ;
  } else if ( isSector7()) { 
    x_sect7 = state ;
  } else if ( isSector8()) { 
    x_sect8 = state ;
  } else if ( isSector9()) { 
    x_sect9 = state ;
  }
}

public void setSector_O_DrawnState(boolean state) { 
  if ( isSector1() ) { 
    o_sect1 = state ;
  } else if ( isSector2()) { 
    o_sect2 = state ;
  } else if ( isSector3()) { 
    o_sect3 = state ;
  } else if ( isSector4()) { 
    o_sect4 = state ;
  } else if ( isSector5()) { 
    o_sect5 = state ;
  } else if ( isSector6()) { 
    o_sect6 = state ;
  } else if ( isSector7()) { 
    o_sect7 = state ;
  } else if ( isSector8()) { 
    o_sect8 = state ;
  } else if ( isSector9()) { 
    o_sect9 = state ;
  }
}

public Position getPosition() { 

  int x = 0, y = 0;
  if ( isSector1() ) { 
    x = 100; 
    y = 220;
  } else if ( isSector2()) { 
    x = 300 ; 
    y = 220 ;
  } else if ( isSector3()) { 
    x = 500 ; 
    y = 220 ;
  } else if ( isSector4()) { 
    x = 100 ; 
    y = 420 ;
  } else if ( isSector5()) { 
    x = 300 ; 
    y = 420 ;
  } else if ( isSector6()) { 
    x = 500 ; 
    y = 420 ;
  } else if ( isSector7()) { 
    x = 100 ; 
    y = 620 ;
  } else if ( isSector8()) { 
    x = 300 ; 
    y = 620 ;
  } else if ( isSector9()) { 
    x = 500 ; 
    y = 620 ;
  } 


  return new Position(x, y);
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
  
  gameOverX = false ; 
  gameOverO = false ; 
  gameOver = false ;
}