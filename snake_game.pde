/* PROGRAMMING BASICS
 CUI-LYN HUANG
 huang.cu@husky.neu.edu
 SNAKE */

// looked at multiple resources online on Snake game implementations

/* **GAME MECHANICS**
 [IP - partially fixed] frame rate "issue"
 if (xpos[i-2].x - xpos[i-1].x == 0 || xpos[i-2].x - xpos[i-1].x == 0) {
 then do as you do
 if (xpos[i-2].x - xpos[i-1].x > 0) {
 then new square needs to -sidelen;
 else if (xpos[i-2].x - xpos[i-1].x < 0) {
 then new square needs to +sidelen;
 }
 if (ypos[i-2].y - ypos[i-1].y > 0) {
 then new square needs to -sidelen;
 else if (ypos[i-2].y - ypos[i-1].y < 0) {
 then new square needs to +sidelen;
 }
 }
 }
 [IP] fix grid alignment -> move needs to be a multiple of sidelength -> 
 add snake collision case
 add game over case
 eat food, slow the snake
 revert stage?? (if you get X points you get to cut off your tail?)
 
 **GAME AESTHETICS**
 change food style
 make it pretty - colour theme/look
 */

float snakeSide = 17;
float scoreMargin = 20;
float snakeSpeed;
float foodSize = 17;

color snake1StrokeColour = color(220);
color snake2StrokeColour = color(220);
color snake1FillColour = color(255, 0, 0);
color snake2FillColour = color(0, 0, 255);
color foodClr = color(129, 128, 129);
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

boolean gameOver = false;
boolean splashScreen = true;

PImage splash;
PImage gOver;

Snake snake1;
Snake snake2;
Food food;
ScoreBoard score;

void setup() {
  size(1000, 600); //will be fullscreen eventually
  frameRate(60);
  snake1 = new Snake("Red Player", snakeSide, snake1StrokeColour, snake1FillColour);
  snake2 = new Snake("Blue Player", snakeSide, snake2StrokeColour, snake2FillColour);
  food = new Food(foodSize, foodClr);
  score = new ScoreBoard(scoreMargin, snake1FillColour, snake2FillColour);
}

void draw() {
  //splash screen
  if (splashScreen == true) {
    background(0);
    splash = loadImage("2playerScreen.png");
    splash.resize(width, height);
    image(splash, 0, 0);
    if (keyPressed) {
      if (key == ' ') {
      splashScreen = false;
    }
  }
  background(255);
  if (gameOver == true) {
    fill(0);
    text("GAME OVER", 0.5*width, 0.5*height);
  } else {
    //check keyboard interactions
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

    //draw the objects
    score.render();
    food.render();
    snake1.render();
    snake2.render();

    //init snake speed
    if (frameCount%10 == 2) { 
      snake1.move();
      snake2.move();
      if (dist(food.xpos, food.ypos, snake1.xpos.get(0), snake1.ypos.get(0)) < snake1.sidelen ) {
        food.reset();
        snake1.addLink();
      }
      if (dist(food.xpos, food.ypos, snake2.xpos.get(0), snake2.ypos.get(0)) < snake2.sidelen ) {
        food.reset();
        snake2.addLink();
      }
    }

    //when food is eaten grow snake and reset food
  }
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

//void resetGame() {
//  gameOver = false;
//  score = 0;
//}