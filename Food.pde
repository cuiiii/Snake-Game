class Food {

  // want to change to diamond shape/tilted square

  // define variables
  float xpos, ypos;
  float radius;
  color clr;

  //constructor
  Food(float radius_, color clr_) {
    //xpos = map(random(radius, width-radius), 0, snakeSide, radius, width-radius);
    //ypos = map(random(radius, height-radius), 0, snakeSide, radius, height-radius);
    xpos = random(20, width-20);
    ypos = random(20, height-20);
    radius = radius_;
    clr = clr_;
  }

  // functions
  void render() {
    fill(clr);
    noStroke();
    ellipse(xpos, ypos, 17, 17);
  }

  void reset() {
    xpos = random(20, width-20);
    ypos = random(20, height-20);
    //xpos = map(random(radius, width-radius), 0, snakeSide, radius, width-radius);
    //ypos = map(random(radius, height-radius), 0, snakeSide, radius, height-radius);
  }
}