class ScoreBoard {
  
  //define variables
  int p1Score;
  color clr;
  
  //constructor
  ScoreBoard(color fillColor) {
    p1Score = 0;
    clr = fillColor;
  }

  void render() {
    pushStyle();
    fill(clr);
    textSize(20);
    text( "P1 SCORE: " + (snake1.len-1), 20, 20); //we want to not hardcode this
    text( "P2 SCORE: " + (snake2.len-1), 20, 20);
  }
}