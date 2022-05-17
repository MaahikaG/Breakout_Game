void pause () {
  theme.pause ();
  textSize (60);
  fill (255);
  text ("Pause", 400, 400);
}
 void pauseClicks () {
   if (mouseX > 15 && mouseX < 65 && mouseY > 30 && mouseY < 70) {
    mode = GAME;
  }
 }
