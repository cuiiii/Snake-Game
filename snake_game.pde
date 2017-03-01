/* PROGRAMMING BASICS
 CUI-LYN HUANG
 huang.cu@husky.neu.edu
 SNAKE */

// looked at multiple resources online on Snake game implementations

int snakeSide = 17;
float scoreMargin = 50;
float snakeSpeed;
float foodSize = 17;

color snake1StrokeColour = color(255);
color snake2StrokeColour = color(255);
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
  size(986, 595); //will be fullscreen eventually
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
    text("Don't bump into your tail or lose your progress", width/2, 300); 
    fill(snake1FillColour);
    text("Player 1 use WASD to navigate", width/2, 350);  
    fill(snake2FillColour);
    text("Player 2 use IJKL to navigate", width/2, 400);
    fill(grey);
    text("Get 5 points to win!", width/2, 450);
    textSize(60);
    text("Press SPACE to start!", width/2, 530);
  }

  //game over condidtion
  if (gameOver == true) {
    background(255);
    textSize(60);
    if (snake1.len > snake2.len) {
      fill(snake1FillColour);
      text("Player 1 wins!", width/2, height/2);
    } else {
      fill(snake2FillColour);
      text("Player 2 wins!", width/2, height/2);
    }
    fill(grey);
    text("Press 'R' to restart", width/2, (height/2)+100);
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
    
    // win case
    if (snake1.len == 6 || snake2.len == 6) {
    gameOver = true;
  }
    //grid for aligning
    //stroke(0);
    //for (int i = 0; i < width; i += 17) {
    //  line (i, 0, i, height);
    //  line (0, i, width, i);
    //}
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
    case 'r':
    case 'R':
      resetGame();
      break;
    }
  }
  if (key == ' ') {
    splashScreen = false;
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

void resetGame() {
  gameOver = false;
  snake1.len = 1;
  snake2.len = 1;
  score.p1Score = 0;
  score.p2Score = 0;
}