/* PROGRAMMING BASICS
 CUI-LYN HUANG
 huang.cu@husky.neu.edu
 SNAKE */

// looked at multiple resources online on Snake game implementations
// also referenced pong code from class

float snakeSide = 17;
float scoreMargin = 20;
color snake1Colour = color(0, 0, 255);
color snake2Colour = color(255, 0, 0);
color snakeFillColour = color(129, 128, 129);

Snake snake1;
Snake snake2;
Food food;
ScoreBoard score;

color green = color(209, 204, 174);
color grey = color(129, 128, 129);

void setup() {
  size(1000, 600); //will be fullscreen eventually
  frameRate(14);
  snake1 = new Snake(snakeSide, snake1Colour, snakeFillColour);
  snake2 = new Snake(snakeSide, snake2Colour, snakeFillColour);
  food = new Food();
  score = new ScoreBoard(scoreMargin, grey);
}

void draw() {
  background(green);
  score.render();

  snake1.move();
  snake1.render();

  snake2.move();
  snake2.render();

  food.render();

  if (dist(food.xpos, food.ypos, snake1.xpos.get(0), snake1.ypos.get(0)) < snake1.sidelen ) {
    food.reset();
    snake1.addLink();
  }

  if (keyPressed == true) {
    // snake 1 movements
    if (key == 'a' || key =='A') {
      snake1.dir = "left";
    } else if (key == 'd' || key =='D') {
      snake1.dir = "right";
    } else if (key == 'w' || key =='W') {
      snake1.dir = "up";
    } else if (key == 's' || key =='S') {
      snake1.dir = "down";
    }
    // snake 2 movements
    if (key == 'j' || key =='J') {
      snake2.dir = "left";
    } else if (key == 'l' || key =='L') {
      snake2.dir = "right";
    } else if (key == 'o' || key =='O') {
      snake2.dir = "up";
    } else if (key == 'k' || key =='K') {
      snake2.dir = "down";
    }
  }
}