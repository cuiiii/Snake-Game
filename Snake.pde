class Snake {

  //define variables
  int len;
  float sidelen;
  color strokeClr;
  color fillClr;
  String dir; 
  ArrayList <Float> xpos, ypos;
  String name;

  //constructor
  Snake(String name_, float side, color sClr, color fClr) {
    len = 1;
    sidelen = side;
    dir = "right";
    xpos = new ArrayList();
    ypos = new ArrayList();
    xpos.add(random(width));
    ypos.add(random(height));
    fillClr = fClr;
    strokeClr = sClr;
    name = name_;
  }

  //functions
  void move() {
    for (int i = len - 1; i > 0; i = i -1 ) {
      xpos.set(i, xpos.get(i - 1));
      ypos.set(i, ypos.get(i - 1));
    } 
    if (dir == "left") {
      xpos.set(0, xpos.get(0) - sidelen);
    }
    if (dir == "right") {
      xpos.set(0, xpos.get(0) + sidelen);
    }

    if (dir == "up") {
      ypos.set(0, ypos.get(0) - sidelen);
    }

    if (dir == "down") {
      ypos.set(0, ypos.get(0) + sidelen);
    }
    xpos.set(0, (xpos.get(0) + width) % width);
    ypos.set(0, (ypos.get(0) + height) % height);

    // check if hit itself and if so cut off the tail
    if (checkHit() == true) {
      gameOver = true;
      println(name + "loses");
    }
  }
  
  /*len = 1;
      float xtemp = xpos.get(0);
      float ytemp = ypos.get(0);
      xpos.clear();
      ypos.clear();
      xpos.add(xtemp);
      ypos.add(ytemp);
      */

  void render() {
    stroke(strokeClr);
    for (int i = 0; i <len; i++) {
      fill(fillClr, map(i-1, 0, len-1, 250, 50));
      //fill(129, 128, 129, map(i-1, 0, len-1, 250, 50));
      rect(xpos.get(i), ypos.get(i), sidelen, sidelen);
    }
  }

  void addLink() {
    xpos.add(xpos.get(len-1) + sidelen);
    ypos.add(ypos.get(len-1) + sidelen);
    len++;
  }

  boolean checkHit() {
    for (int i = 1; i < len; i++) {
      if ( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sidelen) {
        return true;
      }
    } 
    return false;
  }
}