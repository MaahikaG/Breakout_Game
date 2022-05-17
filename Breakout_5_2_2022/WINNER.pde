void winner () {
  gameover.play ();
  
  //castle background
  rectMode (CORNER);
  background (196, 246, 255);
  strokeWeight (1);
  
  fill (indigo);
  stroke (indigo);
  rect (200, 500, 400, 300);
  rect (100, 300, 100, 500);
  rect (600, 300, 100, 500);
  rect (300, 300, 200, 200);
  
  fill (indigo);
  stroke (indigo);
  triangle (100, 300, 150, 200, 200, 300);
  triangle (600, 300, 650, 200, 700, 300);
  triangle (300, 300, 400, 150, 500, 300);
  
  fill (yellow);
  stroke (yellow);
  for (int i = 200; i <= 575; i = i + 25) {
    rect (i, 480, 20, 20);
  }
  for (int i = 90; i <= 200; i = i + 25) {
    rect (i, 400, 20, 20);
  }
  for (int i = 90; i <= 200; i = i + 25) {
    rect (i, 280, 20, 20);
  }
  for (int i = 590; i <= 700; i = i + 25) {
    rect (i, 400, 20, 20);
  }
  for (int i = 590; i <= 700; i = i + 25) {
    rect (i, 280, 20, 20);
  }
  for (int i = 290; i <= 500; i = i + 25) {
    rect (i, 280, 20, 20);
  }
  
  fill (100, 68, 32);
  stroke (100, 68, 32);
  rect (325, 650, 150, 150);
  circle (400, 650, 150);
  
  //draw ball
  fill (blue);
  stroke (blue);
  circle (ballx, bally, 20);

  //moving ball
  bally = bally + vy;
  ballx = ballx + vx;
  println (vy);
  
  //bouncing ball
  if (ballx < 10 || ballx > width - 10) {
    vx = vx * -1;
  }
  if (bally < 10) {
    textSize (80);
    fill (160, 157, 155);
    text ("You Win", 400, 100);
    fill (0);
    tactileRect (175, 150, 200, 100);
    rect (175, 150, 200, 100);
    tactileRect (425, 150, 200, 100);
    rect (425, 150, 200, 100);
    fill (255);
    textSize (30);
    text ("Restart", 275, 200);
    text ("Exit", 525, 200);
  }
}

void winnerClicks () {
  if (mouseX > 175 && mouseX < 375 && mouseY > 150 && mouseY < 250) {
    mode = INTRO;
    ballx = 400;
    bally = 600;
    vx = random (-5, 5);
    vy = random (-5, 5);
    paddlex = width/2;
    score = 0;
    int i = 0;
    while (i < n)  {
      alive [i] =  true;
      i ++;
    }
    clicknumber = 0;
    showcrack1 = false;
    showcrack2 = false;
    showcrack3 = false;
    bary = 0;
    gameover.pause ();
    gameover.rewind ();
    theme.rewind ();
  }
  if (mouseX > 425 && mouseX < 625 && mouseY > 30 && mouseY < 70) {
    exit ();
  }
}
