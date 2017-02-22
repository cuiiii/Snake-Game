/* PROGRAMMING BASICS
 CUI-LYN HUANG
 huang.cu@husky.neu.edu
 SNAKE */

Snake snake1;
Snake snake2;
Food food;
ScoreBoard score;

color green = color(209, 204, 174);
color grey = color(129, 128, 129);

void setup() {
  size(1000, 600);
  frameRate(14);
  snake1 = new Snake();
  snake2 = new Snake();
  food = new Food();
  score = new ScoreBoard(grey);
}

void draw() {
  background(green);
  
  score.render();

  snake1.move();
  snake1.render();
  food.render();

  if ( dist(food.xpos, food.ypos, snake1.xpos.get(0), snake1.ypos.get(0)) < snake1.sidelen ) {
    food.reset();
    snake1.addLink();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      snake1.dir = "left";
    }
    if (keyCode == RIGHT) {
      snake1.dir = "right";
    }
    if (keyCode == UP) {
      snake1.dir = "up";
    }
    if (keyCode == DOWN) {
      snake1.dir = "down";
    }
  }
}