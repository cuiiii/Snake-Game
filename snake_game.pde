/* PROGRAMMING BASICS
CUI-LYN HUANG
huang.cu@husky.neu.edu
SNAKE */

// things to look at:
// issue with going reverse direction -> should end game/be impossible move
// sometimes food does not align with grid/snake? 
// add walls as barrier 
// full screen or no?

Snake snake1;
Snake snake2;
Food food;
int highScore;

color green = color(209, 204, 174);
color grey = color(129, 128, 129);

void setup() {
  size(1000, 600);
  frameRate(14);
  snake1 = new Snake();
  snake2 = new Snake();
  food = new Food();

  highScore = 0;
}

void draw() {
  background(green);
  scoreboard();

  snake1.move();
  snake1.display();
  food.display();

  if ( dist(food.xpos, food.ypos, snake1.xpos.get(0), snake1.ypos.get(0)) < snake1.sidelen ) {
    food.reset();
    snake1.addLink();
  }

  if (snake1.len > highScore) {
    highScore = (snake1.len-1);
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

void scoreboard() {
  fill(grey);
  textSize(20);
  text( "SCORE: " + (snake1.len-1), 20, 20);
  text( "HIGH SCORE: " + highScore, 20, 40);
}

  