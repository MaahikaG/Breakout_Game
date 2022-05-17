void gameover () {
  gameover.play ();
  background (0);
  strokeWeight (1);
  
  //brick background
  int j = 0;
  int c = 0;
  while (j < jailn) {
    fill (59, 59, 59);
    stroke (59, 59, 59);
    rect (jailx [j], jaily [j], jaild  * 2, jaild);
    j = j + 1;
  }
 
  //draw ball
  fill (blue);
  stroke (blue);
  circle (ballx, bally, 20);

  //moving ball
  bally = bally + vy;
  ballx = ballx + vx;
  println (vy);
  
  //bars
  fill (96, 98, 96);
  stroke (96, 98, 96);
  rect (-20, -20, 40, bary, 10);
  rect (80, -20, 40, bary, 10);
  rect (180, -20, 40, bary, 10);
  rect (280, -20, 40, bary, 10);
  rect (380, -20, 40, bary, 10);
  rect (480, -20, 40, bary, 10);
  rect (580, -20, 40, bary, 10);
  rect (680, -20, 40, bary, 10);
  rect (780, -20, 40, bary, 10);
  rect (0, bary - 820, 800, 40, 10);
  
  //bouncing ball
  if (ballx < 10 || ballx > width - 10) {
    vx = vx * -1;
  }
  if (bally > height - 10) {
    vy = 0;
    vx = 0;
    bary = bary + 3;
  }
  
  //gameover text
  if (bary >= 820) {
    bary = bary - 3;
    fill (255);
    textSize (80);
    text ("YOU LOSE", 400, 100);
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

 void gameoverClicks () {
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
