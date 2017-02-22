/* PROGRAMMING BASICS
 CUI-LYN HUANG
 huang.cu@husky.neu.edu
 SNAKE */

// looked at multiple resources online on Snake game implementations
// also referenced pong code from class

//fix grid alignment 
//change food style
//add snake collision case
//add game over case
//think about motivation to play the game -> eat food, slow the snake
//revert stage??
//frame rate "issue"
//multiplayer key press issue -
//make it pretty
//barriers

float snakeSide = 17;
float scoreMargin = 20;

float snakeSpeed;

color snake1Colour = color(0, 0, 255);
color snake2Colour = color(255, 0, 0);
color snakeFillColour = color(129, 128, 129);

Snake snake1;
Snake snake2;
Food food;
ScoreBoard score;

color green = color(209, 204, 174);
color grey = color(129, 128, 129);

boolean isOneMovingUp = false;
boolean isOneMovingDown = false;
boolean isOneMovingLeft = false;
boolean isOneMovingRight = false;

boolean isTwoMovingUp = false;
boolean isTwoMovingDown = false;
boolean isTwoMovingLeft = false;
boolean isTwoMovingRight = false;

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

  //snake1 movements
  if (isOneMovingUp) {
    snake1.dir = "up";
  }
  if (isOneMovingDown) {
    snake1.dir = "down";
  }
  if (isOneMovingLeft) {
    snake1.dir = "left";
  }
  if (isOneMovingRight) {
    snake1.dir = "right";
  }

  //snake2 movements
  if (isTwoMovingUp) {
    snake2.dir = "up";
  }
  if (isTwoMovingDown) {
    snake2.dir = "down";
  }
  if (isTwoMovingLeft) {
    snake2.dir = "left";
  }
  if (isTwoMovingRight) {
    snake2.dir = "right";
  }

  score.render();

  // can set functions to execute every x frames with if statement
  snake1.move();
  snake1.render();

  snake2.move();
  snake2.render();

  food.render();

  if (dist(food.xpos, food.ypos, snake1.xpos.get(0), snake1.ypos.get(0)) < snake1.sidelen ) {
    food.reset();
    snake1.addLink();
  }
  if (dist(food.xpos, food.ypos, snake2.xpos.get(0), snake2.ypos.get(0)) < snake2.sidelen ) {
    food.reset();
    snake2.addLink();
  }
}

void keyPressed() {
  // Listen to key events
  if (keyPressed) {
    switch(key) {
    case 'w':
    case 'W':
      isOneMovingUp = true;
      break;
    case 's': 
    case 'S':
      isOneMovingDown = true;
      break;
    case 'a':
    case 'A':
      isOneMovingLeft = true;
      break;
    case 'd': 
    case 'D':
      isOneMovingRight = true;
      break;
    case 'i':
    case 'I':
      isTwoMovingUp = true;
      break;
    case 'k': 
    case 'K':
      isTwoMovingDown = true;
      break;
    case 'j':
    case 'J':
      isTwoMovingLeft = true;
      break;
    case 'l': 
    case 'L':
      isTwoMovingRight = true;
      break;
    }
  }
}

void keyReleased() {
  switch(key) {
  case 'w':
  case 'W':
    isOneMovingUp = false;
    break;
  case 's': 
  case 'S':
    isOneMovingDown = false;
    break;
  case 'a':
  case 'A':
    isOneMovingLeft = false;
    break;
  case 'd': 
  case 'D':
    isOneMovingRight = false;
    break;
  case 'i':
  case 'I':
    isTwoMovingUp = false;
    break;
  case 'k': 
  case 'K':
    isTwoMovingDown = false;
    break;
  case 'j':
  case 'J':
    isTwoMovingLeft = false;
    break;
  case 'l': 
  case 'L':
    isTwoMovingRight = false;
    break;
  }
}

////keypressed keyreleased
//if (keyPressed == true) {
//  // snake 1 movements
//  if (key == 'a' || key =='A') {
//    snake1.dir = "left";
//  } else if (key == 'd' || key =='D') {
//    snake1.dir = "right";
//  } else if (key == 'w' || key =='W') {
//    snake1.dir = "up";
//  } else if (key == 's' || key =='S') {
//    snake1.dir = "down";
//  }
//  // snake 2 movements
//  if (key == 'j' || key =='J') {
//    snake2.dir = "left";
//  } else if (key == 'l' || key =='L') {
//    snake2.dir = "right";
//  } else if (key == 'o' || key =='O') {
//    snake2.dir = "up";
//  } else if (key == 'k' || key =='K') {
//    snake2.dir = "down";
//  }
//}