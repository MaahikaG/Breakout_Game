void intro () {
  theme.play ();
  background (0);
  strokeWeight (3);
  textFont (font, 128);
    
  //text 
  fill (255);
  textSize (80);
  text ("BRICK BREAKER", 400, 100);
  textSize (30);
  text ("Break the pink brick to start", 400, 200);
   
  //bricks
  fill (pink);
  rect (300, 400, 200, 100);
  fill (indigo);
  rect (-100, 400, 200, 100);
  rect (100, 400, 200, 100);
  rect (500, 400, 200, 100);
  rect (700, 400, 200, 100);
  rect (0, 500, 200, 100);
  rect (200, 500, 200, 100);
  rect (400, 500, 200, 100);
  rect (600, 500, 200, 100);
  
  //clicknumber cracks
  if (showcrack1 == true) {
    line (400, 400, 400, 460);
    line (400, 440, 380, 450);
    line (400, 420, 420, 440);
    clicknumber = 1;
  }
  if (showcrack2 == true) {
    line (380, 450, 370, 440);
    line (370, 440, 360, 450);
    line (360, 450, 350, 440);
    line (420, 440, 430, 430);
    line (430, 430, 440, 440);
    line (440, 440, 450, 430);
    clicknumber = 2;
  }
  if (showcrack3 == true) {
    line (400, 460, 380, 480);
    line (380, 480, 400, 500);
    clicknumber = 3;
  }
}

void introClicks () {
  if (mouseX > 300 && mouseX < 500 && mouseY > 400 && mouseY < 500) {
    showcrack1 = true;
  }
  if (mouseX > 300 && mouseX < 500 && mouseY > 400 && mouseY < 500 && clicknumber == 1) {
    showcrack2 = true;
  }
  if (mouseX > 300 && mouseX < 500 && mouseY > 400 && mouseY < 500 && clicknumber == 2) {
    showcrack3 = true;
  }
  if (mouseX > 300 && mouseX < 500 && mouseY > 400 && mouseY < 500 && clicknumber == 3) {
    mode = GAME;
  }
}
