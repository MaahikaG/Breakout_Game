//Maahika Gupta
//Breakout
//2-4
//May 2, 2022

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// sound variables
Minim minim;
AudioPlayer theme, coin, gameover, bump;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WINNER = 4;

//color pallet
color pink = #ef476f;
color yellow = #ffd166;
color green = #06d6a0;
color blue = #118ab2;
color indigo = #073b4c;

//keyboard variables
boolean leftkey, rightkey;

//intro variables 
boolean showcrack1;
boolean showcrack2;
boolean showcrack3;
int clicknumber;

//game variables
float ballx, bally;
float vx, vy;
float paddlex;
int score;
int lives;

//brick arrays
int [] x;
int [] y;
boolean [] alive;
int brickd;
int n;
int tempx, tempy;

//jail arrays
int jaild;
int [] jailx;
int [] jaily;
int jailn;
int jailtempx;
int jailtempy;

//gameover variables
int bary;

PFont font;

void setup () {
  //brick array setup
  brickd = 20;
  n = 201;
 // n = 30;
  x = new int [n];
  y = new int [n];
  alive = new boolean [n];
  tempx = 50;
  tempy = 120;
  int i = 0;
  boolean alignment = true;
  while (i < n) {
    x [i] = tempx;
    y [i] = tempy;
    alive [i] = true;
    tempx = tempx + 50;
    if (tempx >= width) {
      alignment = !alignment;
      if (alignment == true) {
        tempx = 50;
      } else {
        tempx = 25;
      }
      tempy = tempy + 30;
    }
    i = i + 1;
  }

  //jail array setup
  jaild = 50;
  jailn = 125;
  jailx = new int [jailn];
  jaily = new int [jailn];
  jailtempx = -50;
  jailtempy = 0;
  int j = 0;
  boolean alignmentj = true;
  while (j < jailn) {
    jailx [j] = jailtempx;
    jaily [j] = jailtempy;
    jailtempx = jailtempx + 110;
    if (jailtempx >= width + 100) {
      alignmentj = !alignmentj;
      if (alignmentj == true) {
        jailtempx = -50;
      } else {
        jailtempx = 0;
      }
      jailtempy = jailtempy + 60;
    }
    j = j + 1;
  }
  
  //basic layout
  size (800, 800);
  mode = INTRO;
  textAlign (CENTER, CENTER);
  font = createFont("JFRocSol.TTF", 40);

  //initialize intro
  showcrack1 = false;
  showcrack2 = false;
  showcrack3 = false;
  clicknumber = 0;
  
  
  //initialize game
  ballx = 400;
  bally = 600;
  vx = random (-5, 5);
  vy = random (-5, 5);
  paddlex = width/2;
  score = 0;
  lives = 3;
  
  //initialize gameover
  bary = 0;
  
  //initialize minim
  minim = new Minim(this);
  theme = minim.loadFile("mario bros theme copy 2.mp3");
  coin = minim.loadFile("coin copy 2.wav");
  gameover = minim.loadFile("gameover copy 2.wav");
  bump = minim.loadFile("bump copy 2.wav");
}

void draw () {
  if (mode == INTRO) {
    intro ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == PAUSE) {
    pause ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else if (mode == WINNER) {
    winner ();
  } else {
    println ("Error: Mode = " + mode);
  }
}

void tactileRect (int x, int y, int w, int l) {
  strokeWeight (5);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+l) {
    stroke (255);
  } else {
    stroke (0);
  }
}
