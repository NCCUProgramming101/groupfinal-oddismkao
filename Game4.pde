class Frame4{
  float countDown;
  
  Frame4(){
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

class GirlName {
  //properties
  float x, y;
  PImage[] girlName = new PImage[4];


  //constructor
  GirlName() {
    x = 0;
    y = 0;
    girlName[0] = loadImage("img/game4/cindy.png");
    girlName[1] = loadImage("img/game4/wendy.png");
    girlName[2] = loadImage("img/game4/randi.png");
    girlName[3] = loadImage("img/game4/sandy.png");
  }


  //methods
  void display(int order) {
    image(girlName[order], WAITING_START-100-30, FLOOR-150-120,120,100);
  }
}

//==================================================================================


class Girlfriend {
  //prorperties
  float [] x = new float[nbrGirl];
  float [] y = new float[nbrGirl];
  PImage[] img = new PImage[nbrGirl];
  float [] speed = new float[nbrGirl];
  int [] girlNameOrder = new int[nbrGirl];


  //constructor
  Girlfriend() {
    for (int i = 0; i<nbrGirl; i++) {
      x[i] = FRAME_W;//img[i].width; 
      y[i] = FLOOR-150-20;//img[i].height;
      img[i] = loadImage("img/GAME4/girl"+(i%4)+".png");
      speed[i] = 4;
      girlNameOrder[i] = floor(random(0, 4));
      ;
    }
  }

  //methods
  void display() {
    for (int i=0; i<nbrGirl; i++) {
      image(img[i], x[i], y[i], 100, 150);
    }
  }

  void move() {
    for (int i=0; i<nbrGirl; i++) {
      x[i] += speed[i];
    }
  }
  int order (float girlFrameCount) {
    int girlOrder = 0;
    if (girlFrameCount % 60 == 0) {
      girlOrder = int(girlFrameCount/60);
    }
    return(girlOrder);
  }


  void waitInLine() {
    if (x[0] == WAITING_START-100) {//img[girlIndex].width) {
      speed[0] = 0;
      currentGirlIndex = 0;
      girlName.display(girlNameOrder[0]);
      currentGNameIndex = girlNameOrder[0];
    }
    
    for (int i = 1; i<nbrGirl; i++) {
      if (x[i] == WAITING_START-100) {
        speed[i] = 0;
        currentGirlIndex = i;
        girlName.display(girlNameOrder[i]);
        currentGNameIndex = girlNameOrder[i];
      } else if (x[i] == x[i-1]-100) {//img[girlIndex].width) {
        speed[i] = 0;
      } else if(x[i] != x[i-1]-100){
        speed[i] = 4;
      }
      
    }
  }
}

//=============================================================================

class Me4 {
  //prorperties
  float x, y;
  PImage img;
  PImage blankImg;


  //constructor
  Me4() {
    x = WAITING_START;
    y = FLOOR - 210;//img.height;
    img = loadImage("img/game4/me4.png");
    blankImg = loadImage("img/game4/blank.png");
  }

  //methods
  void display() {
    image(img, x, y,150,210);
    image(blankImg,WAITING_START+30,FLOOR-210-100,120,100);
  }
}

//==========================================================================


class MeName {
  //prorperties
  float x, y;
  PImage blankImg;
  PImage [] nameImg = new PImage[4];


  //constructor
  MeName() {
    x = WAITING_START+30;
    y = FLOOR - 210-100;//img.height;
    blankImg = loadImage("img/game4/blank.png");
    nameImg[0] = loadImage("img/game4/cindy2.png");
    nameImg[1] = loadImage("img/game4/wendy2.png");
    nameImg[2] = loadImage("img/GAME4/randi2.png");
    nameImg[3] = loadImage("img/GAME4/sandy2.png");
  }

  //methods
  void display() {
    image(blankImg, x, y, 120, 100);
  }

  void nameKeyPressed() {
    if(keyPressed){
      if (key == 'c') {
        image(nameImg[0], this.x+5, this.y+3, 110, 80);
        currentMNameIndex = 0;
      }
      if (key == 'w') {
        image(nameImg[1], this.x+5, this.y+3, 110, 80);
        currentMNameIndex = 1;
      }
      if (key == 'r') {
        image(nameImg[2], this.x+5, this.y+3, 110, 80);
        currentMNameIndex = 2;
      }
      if (key == 's') {
        image(nameImg[3], this.x+5, this.y+3, 110, 80);
        currentMNameIndex = 3;
      }
    }
  }
}