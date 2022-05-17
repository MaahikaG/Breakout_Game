void game () {
  //basic layout
  background (0);
  strokeWeight (1);
  
  //title 
  textSize (30);
  fill (255);
  text ("Break all the bricks to escape!", 400, 50);
  textSize (20);
  text ("Lives : " + lives, 400, 85);

  //draw ball
  fill (blue);
  stroke (blue);
  circle (ballx, bally, 20);

  //draw paddle
  fill (yellow);
  stroke (yellow);
  rect (paddlex, 750, 100, 10);

  //bricks
  int i = 0;
  int c = 0;
  while (i < n) {
    c = c + 1;
    if (c > 3) c = 0;
    if (c == 1) fill (pink);
    if (c == 2) fill (green);
    if (c == 3) fill (indigo);
    if (alive [i] == true) {
      manageBrick (i);
    }
    i = i + 1;
  }

  //moving ball
  ballx = ballx + vx;
  bally = bally + vy;

  //bounce ball;
  if (ballx < 10 || ballx > width - 10) {
    vx = vx * -1;
  }
  if (bally < 10) {
    vy = vy * -1;
  }

  //moving paddle
  if (leftkey == true && paddlex > 0) paddlex = paddlex - 5;
  if (rightkey == true && paddlex < 700) paddlex = paddlex + 5;

  //bouncing ball of paddle
  if (dist (ballx, bally, paddlex, 750) <= 20 || dist (ballx, bally, paddlex + 25, 750) <= 20 || dist (ballx, bally, paddlex + 50, 750) <= 20 || dist (ballx, bally, paddlex + 75, 750) <= 20 || dist (ballx, bally, paddlex + 100, 750) <= 20) {
    vx = (ballx - paddlex) / 8;
    vy = (bally - 800) / 8;
  }
  
  //pause and restart buttons 
  tactileRect (30, 30, 50, 40);
  rectMode (CORNER);
  fill (0);
  rect (15, 30, 50, 40);
  stroke (255);
  if (mode == GAME) {
    line (35, 40, 35, 60);
    line (50, 40, 50, 60);
  }
  
  //switching to gameover
  if (bally > height + 20) {
    if (lives == 1) {
      mode = GAMEOVER;
      bally = -20;
    } else {
      ballx = 400;
      bally = 600;
      vx = random (-5, 5);
      vy = random (-5, 5);
      lives = lives - 1;
    }
  }
  
  //switching to winner
  if (score == n) {
    bally = 820;
    vy = vy * -1;
    mode = WINNER;
  }
}

void manageBrick (int i) {
  rectMode (CENTER);
  stroke (0);
  rect (x [i], y [i], brickd  * 2, brickd);
  if (dist (ballx, bally, x [i], y [i]) <= 10 + brickd) {
    vx = (ballx - x [i]) / 8;
    vy = (bally - y [i]) / 8;
    alive [i] = false;
    score ++;
    coin.play ();
    coin.rewind ();
  }
}

 void gameClicks () {
  //Pause 
  if (mouseX > 15 && mouseX < 65 && mouseY > 30 && mouseY < 70) {
    mode = PAUSE;
    rect (15, 30, 50, 40);
    triangle (30, 40, 30, 60, 55, 50);
  }
 }
