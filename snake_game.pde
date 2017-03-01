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

float i;
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
  background(255);

  //splash screen
  if (splashScreen == true) {
    background(255);
    textAlign(CENTER);
    textSize(100);
    fill(grey);
    text("SNAKE", width/2, 200);
    textSize(40);
    text("Eat more food than your oppononent", width/2, 250);
    text("Watch out for your tails!", width/2, 300); 
    fill(snake1FillColour);
    text("Player 1 use WASD to navigate", width/2, 350);  
    fill(snake2FillColour);
    text("Player 2 use IJKL to navigate", width/2, 400);
    fill(grey);
    textSize(60);
    text("Press SPACE to start!", width/2, 480);
  }

  //game over condidtion
  if (gameOver == true) {
    background(255);
    fill(100);
    textSize(100);
    text("GAME OVER", width/2, height/2);
    textSize(60);
    if (snake1.len > snake2.len) {
      fill(snake1FillColour);
      text("Player 1 WINS", width/2, (height/2)+100);
    } else {
      fill(snake2FillColour);
      text("Player 2 WINS", width/2, (height/2)+100);
    }
    text("Press 'R' to restart", width/2, (height/2)+200);
  } else if (splashScreen == false) {

    //game condition
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

    //initial snake speed
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
      //case 'r':
      //case 'R':
      //  resetGame();
      //  break;
      //}
    }
    if (key == ' ') {
      splashScreen = false;
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
//  snake1.len = 1;
//  snake2.len = 1;
//  score.p1Score = 0;
//  score.p2Score = 0;
//}