class Bullet {
  //properties
  float x;
  float y;
  float speed;
  PImage img;

  //constructor
  Bullet() {
    img = loadImage("img/GAME6/shoot.png");
    x = -width;
    y = -height;
    speed = 4;
  }

  //methods
  void display() {
    image(img, x, y, 40, 40);
  }
  void move() {
    x -= 4;
    y -= 6;
  }
}

//===============================================================


class FlameManager {

  PImage[] flameImgs = new PImage[5];

  private int[] flameFrameCount;
  private float[] flameX ; 
  private float[] flameY ;
  private int boomIndex = 0 ; 

  FlameManager() { 
    int bufferSize = 10 ;

    for (int i = 0; i < 5; i++) {
      flameImgs[i] = loadImage("img/GAME6/flame" + (i+1) +".png");
    }

    flameFrameCount = new int  [bufferSize]; 
    flameX          = new float[bufferSize] ; 
    flameY          = new float[bufferSize] ;

    for (int i = 0; i < flameFrameCount.length; i++) {
      flameFrameCount[i] = 9999 ;
    }
  }



  void display () {
    for (int i = 0; i<nbrFlame; i++) {
      flameFrameCount[i]++;
      flameFrame = flameFrameCount[i] / (60/5);
      if (flameFrame<5) {
        image(flameImgs[flameFrame], flameX[i], flameY[i]);
      }
    }
  }


  void add (float x, float y) {
    flameFrameCount[boomIndex] = 0;
    flameX[boomIndex] = x;
    flameY[boomIndex] = y;
    boomIndex++;
    boomIndex %= nbrFlame;
  }
}

//========================================================================

class Frame6{
  float countDown;
  
  Frame6(){
    countDown = 20;
  }
  
  void draw(){
    if(frameCount0 % 60==0){
      countDown = 20-(frameCount0/60);
      println(countDown);
    }
  }
}

//===========================================================================

//===========================================================================


class Me6 {
  //prorperties
  float x, y;
  PImage img;


  //constructor
  Me6() {
    x = 50;//img.width/2.0;
    y = height - 90;//img.height;
    img = loadImage("img/GAME6/me6.png");
  }

  //methods

  void move() {
    x = mouseX-40;
  }
  void display() {
    image(img, x, y, 80, 100);
  }

  void boundaryDetection() {
    if (x<0) {
      x = 0;
    }
    if (x>FRAME_W-80) {//img.width) {
      x = FRAME_W-80;//img.width;
    }
  }

  void draw() {
  }
  }
  
  //====================================================
  
  class Radian {
  //prorperties
  float x, y;
  float speed;
  PImage img;


  //constructor
  Radian() {
    x = random(width-140);
    y = 100;
    speed = random(5,8);
    img = loadImage("img/GAME6/radian.png");
  }

  //methods
  void display() {
    image(img, x, y,80,160);
  }
  
  void move(){
    x += speed;
  }
  
  void boundaryDetection(){
    if(x <= 0 ){
      speed = random(4,8);
    }
    if(x > width-100){//img.width){
      speed = random(-8,-4);
    }
  }
    
  boolean isHit (float bx, float by, float bw, float bh ) {
    boolean collisionX = (this.x + 50 >= bx) && (bx + bw >= this.x);
    boolean collisionY = (this.y + 120 >= by) && (by + bh >= this.y);
    return collisionX && collisionY;
  }
}