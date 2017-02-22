class Food {

  // define variables
  float xpos, ypos;

  //constructor
  Food() {
    xpos = random(20, width-20);
    ypos = random(20, height-20);
  }

  // functions
  void display() {

    fill(58, 58, 58);
    ellipse(xpos, ypos, 17, 17);
  }

  void reset() {
    xpos = random(20, width-20);
    ypos = random(20, height-20);
  }
}