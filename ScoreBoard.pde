class ScoreBoard {
  
  //define variables
  int p1Score;
  int p2Score;
  float margin;
  color clr;
  
  //constructor
  ScoreBoard(float margins, color fillColor) {
    p1Score = 0;
    p2Score = 0;
    clr = fillColor;
    margin = margins;
  }

  void render() {
    pushStyle();
    fill(clr);
    textSize(20);
    text( "P1 SCORE: " + (snake1.len-1), margin, 20); 
    text( "P2 SCORE: " + (snake2.len-1), width-margin-120, 20);
  }
}