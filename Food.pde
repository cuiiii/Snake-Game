class Food {

  // want to change to diamond shape/tilted square

  // define variables
  float xpos, ypos;
  float diameter;
  color clr;

  //constructor
  Food(float diameter_, color clr_) {
    //xpos = map(random(20, width-20), 0, width/17, 20, width-20);
    //ypos = map(random(20, height-20), 0, height/17, 20, height-20);
    
    //ypos = map(random(20, height-radius), 0, snakeSide, radius, height-radius);
    int snakeSide = 17;
    int margin = 20;
    
    int xMax = floor((width - margin) / snakeSide);
    int yMax = floor((height - margin) / snakeSide);
    int min = ceil(margin / snakeSide);
    xpos = int(random(min, xMax))*snakeSide;
    ypos = int(random(min, yMax))*snakeSide;
    
    //xpos = random(20, width-20);
    //ypos = random(20, height-20);
    diameter = diameter_;
    clr = clr_;
    print("("+xpos+","+ypos+")");
  }

  // functions
  void render() {
    ellipseMode(CORNER);
    fill(clr);
    noStroke();
    ellipse(xpos, ypos, diameter, diameter);
  }

  void reset() {
    //xpos = map(random(20, width-20), 0, width/17, 20, width-20);
    //ypos = map(random(20, height-20), 0, height/17, 20, height-20);
    xpos = random(20, width-20);
    ypos = random(20, height-20);
    //xpos = map(random(radius, width-radius), 0, snakeSide, radius, width-radius);
    //ypos = map(random(radius, height-radius), 0, snakeSide, radius, height-radius);
  }
}