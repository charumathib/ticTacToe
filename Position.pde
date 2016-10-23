class Position { 
  private int x ; 
  private int y ; 
  final int S1 = 1; 
  final int S2 = 2; 
  final int S3 = 3; 
  final int S4 = 4; 
  final int S5 = 5; 
  final int S6 = 6; 
  final int S7 = 7; 
  final int S8 = 8; 
  final int S9 = 9; 
  
  public Position() { 
    this.x = 0 ; 
    this.y = 0 ; 
  }

  public Position(int x, int y) {
    this.x = x ; 
    this.y = y ;
  }

  public int getX() { 
    return this.x ;
  }

  public int getY() { 
    return this.y ;
  }

  public Position getPositionGivenMouseLocation() { 
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
  
  public Position getPositionGivenSectorNumber(int sector) { 
    int x = 0, y = 0;
    if ( sector == S1 ) { 
      x = 100; 
      y = 220;
    } else if ( sector == S2 ) { 
      x = 300 ; 
      y = 220 ;
    } else if ( sector == S3 ) { 
      x = 500 ; 
      y = 220 ;
    } else if ( sector == S4 ) { 
      x = 100 ; 
      y = 420 ;
    } else if ( sector == S5 ) { 
      x = 300 ; 
      y = 420 ;
    } else if ( sector == S6 ) { 
      x = 500 ; 
      y = 420 ;
    } else if ( sector == S7 ) { 
      x = 100 ; 
      y = 620 ;
    } else if ( sector == S8 ) { 
      x = 300 ; 
      y = 620 ;
    } else if ( sector == S9 ) { 
      x = 500 ; 
      y = 620 ;
    } 
    return new Position(x, y);
  }
}