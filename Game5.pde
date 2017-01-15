class Frame5{
  float countDown;
  
  Frame5(){
    countDown = 20;
  }
  
  void draw(){
    if(frameCount0 % 60==0){
      countDown = 20-(frameCount0/60);
      println(countDown);
    }
  }
  
}

class People {
  //prorperties
  int nbrPeople = 6;
  float[] x = new float[nbrPeople];
  float[] y = new float[nbrPeople];
  PImage[] img = new PImage[nbrPeople];
  float[] speed = new float[nbrPeople];
  float[] giftOrPooIndex = new float[nbrPeople];



  //constructor
  People() {
    for (int i=0; i<nbrPeople; i++) {
      x[i] = random(width-104);//img[i].width);
      y[i] = FLOOR - 50;//img[i].height;
      speed[i] = floor(random(-5, 5));
      if (speed[i] == 0) {
        speed[i] = floor(random(-5, 5));
      }
    }
    img[0] = loadImage("img/GAME5/giftPeople.png");
    giftOrPooIndex[0] = 1;
    img[1] = loadImage("img/GAME5/pooPeople.png");
    giftOrPooIndex[1] = 0;
    for (int i=2; i<nbrPeople; i++) {
      switch(floor(random(2))) {
      case  0:
        img[i] = loadImage("img/GAME5/pooPeople.png");
        giftOrPooIndex[i] = 0;
        break;
      case 1:
        img[i] = loadImage("img/GAME5/giftPeople.png");
        giftOrPooIndex[i] = 1;
        break;
      }
    }
  }
  //methods
  void display() {
    for (int i=0; i<nbrPeople; i++) {
      boolean hDirection = (speed[i] > 0) ? true : false;
      if (hDirection) {
        pushMatrix();
        translate(x[i], y[i]);
        scale(1, 1);
        image(img[i], 0, 0, 105, 75);
        popMatrix();
      } else {
        pushMatrix();
        translate(x[i], y[i]);
        scale(-1, 1);
        image(img[i], -105, 0, 105, 75);
        popMatrix();
      }
    }
  }

  void move() {
    for (int i=0; i<nbrPeople; i++) {
      x[i] -= speed[i];
    }
  }

  void boundaryDetection() {
    for (int i=0; i<nbrPeople; i++) {
      if (x[i]<=0 || x[i] >= width - 104) {//img[i].width ) {
        speed[i]= speed[i]* (-1);
      }
    }
  }
}
//===========================================================


class HPBar {
  //properties
  float x;
  float y;
  PImage img;

  //methods
  void display(int hp) {
    //hp box
    noStroke();
    fill(#FF0000);
    rectMode(CORNERS);
    rect(13, 4, 13+HP_LENGTH*(hp/100.0), 20, 4);
    image(img, x, y);
  }


  //constructor
  HPBar() {
    img = loadImage("img/hp.png");
    x = 0;
    y = 0;
  }
}

//=================================================================

class Knife {
  //prorperties
  float x, y;
  PImage img;
  float speed;


  //constructor
  Knife() {
    x = -width;
    y = -height;
    img = loadImage("img/GAME5/scythe.png");
    speed = 6;
  }

  //methods

  void move(float atanKnife){
    pushMatrix();
    translate(width/2.0+23,50);
    rotate(atanKnife);
    image(img, x, y,60,30);
    x+=6;
    popMatrix();
  }
  
  boolean isHit (float bx, float by, float bw, float bh ) {
    boolean collisionX = (this.x + 60 >= bx) && (bx + bw >= this.x);
    boolean collisionY = (this.y + 30 >= by) && (by + bh >= this.y);
    return collisionX && collisionY;
  }
  
}

//==================================================================================

class Me5 {
  //prorperties
  float x, y;
  PImage img;


  //constructor
  Me5() {
    x = width/2.0-40;//img.width/2.0;
    y = 0;
    img = loadImage("img/GAME5/me5.png");
  }

  //methods
  void display() {
    image(img, x, y,100,100);
  }
}

//===================================================================================


class Scythe {
  //prorperties
  float x, y;
  PImage img;
  float atanScythe;


  //constructor
  Scythe() {
    x = 0;
    y = 0;
    atanScythe = 1.5;
    img = loadImage("img/GAME5/scythe.png");
  }

  //methods
  void display() {
    pushMatrix();
    translate(width/2.0+25, 50);
    atanScythe = atan2(mouseY-0, mouseX-width/2.0);
    if (atanScythe >= 3) {
      atanScythe = 3;
    } else if (atanScythe <= 0) {
      atanScythe = 0;
    }
    rotate(atanScythe);
    image(img, 0, 0, 100, 50);
    popMatrix();
  }
}