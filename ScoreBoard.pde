class ScoreBoard {

  //define variables
  int p1Score;
  int p2Score;
  float margin;
  color leftClr;
  color rightClr;

  //constructor
  ScoreBoard(float margins, color lClr, color rClr) {
    p1Score = 0;
    p2Score = 0;
    leftClr = lClr;
    rightClr = rClr;
    margin = margins;
  }

  void render() {
    pushStyle();
    fill(leftClr);
    textSize(20);
    text(snake1.len-1, margin, 20); 
    fill(rightClr);
    text(snake2.len-1, width-margin-120, 20);
  }
}