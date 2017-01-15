int gameState =0;
PFont DIN;
//Audio
import ddf.minim.*;
Minim minim;
AudioSample CLICKS;
AudioPlayer BGM2A;
AudioPlayer BGM1;
AudioPlayer BGM2;
AudioPlayer BGM3;
AudioPlayer BGM4;
AudioPlayer BGM5;
AudioPlayer BGM6;
AudioPlayer BGM7;
AudioPlayer INTERFACE_BGM;
AudioPlayer START_BGM;
AudioPlayer LOSE_BGM;
//Video 
import processing.video.*;
Movie animation0;
Movie animation1;
Movie animation2;
Movie animation3;
Movie animation4;
Movie animation5;
Movie animation6;
Movie animation7;
//Share
int frameCount0 = -1;
int currentGNameIndex = 29;
int currentMNameIndex = 29;
int currentGirlIndex = 29;
Frame1 frame1;
Frame2 frame2;
Frame3 frame3;
Frame4 frame4;
Frame5 frame5;
Frame6 frame6;
//Class Declaration
//GAME1 game1;
PImage intro1;
PImage bg1;
PImage losebg_1;
PImage losebg_2;
PImage washing;
PImage me1;
Me1 me;
Bar score;
Classmate classmate;
int []clothX=new int [5];
int []clothX2=new int [5];
int clothCount=5;
Clothes []clothes=new Clothes[clothCount];
int index;
int index2;
int catchCount;
boolean []catchMe=new boolean[5];
boolean []catchMe2=new boolean[5];
//GAME2 game2;
Clock clock;
UpperBody upperBody;
PImage bed;
//GAME3 game3;
int fastFoodCount=5;
int healthFoodCount=5;
int bodyCount=5;
int newBody=0;
Body body;
FastFood fastFood;
HealthFood healthFood;
boolean leftPressed=false;
boolean rightPressed=false;
//GAME4 game4;
Me4 me4;
MeName meName;
Girlfriend girl;
GirlName girlName;
final int FRAME_W = 640;
final int FRAME_H = 480;
final int WAITING_START = FRAME_W -150-10;//me4.img.width
final int WAITING_END = 60;
final int FLOOR = 400;
int nbrGirl = 100;
int girlIndex = 0;
//GAME5 game5;
Me5 me5;
People people;
Scythe scythe;
int nbrKnife = 8;
int knifeIndex = 0;
Knife[] knifeArray = new Knife[nbrKnife];
float[] knifeAtan = new float[nbrKnife];
int score5 = 0;
//GAME6 game6;
Me6 me6;
HPBar scoreBar;
FlameManager flame;
Radian radian;
int nbrFlame = 5;
int nbrBullet = 5;
int flameFrame;
int flameCount;
int bulletIndex = 0;
int score6 = 0;
final float HP_LENGTH = 206-13;
Bullet[] bulletArray = new Bullet[nbrBullet];
//GAME7 game7;
int currentType = ChildShowingType.STRAIGHT;
int childCount = 5;
PImage sexbodyImg;
Head head;
Score7 score7;
OldmanR oldmanR;
boolean isMovingDown;
int time = 0;
int wait = 2000;
int limit = 0;
Child[] child = new Child[childCount];
//Game State
final int INTRO_ANIMATION =0;
final int GAME_START = 1;
PImage startbg1, startbg2;
final int CHOOSE_GAME_INTERFACE1 = 2;
//Game1
final int GAME1_INTRO = 3;
final int GAME1_GREED = 4;
final int GAME1_WIN = 5;
final int GAME1_LOSE = 6;
final int CHOOSE_GAME_INTERFACE2 = 7;
//Game2
final int GAME2_INTRO = 8;
final int GAME2_SLOTH = 9;
final int GAME2_WIN = 10;
final int GAME2_LOSE = 11;
final int CHOOSE_GAME_INTERFACE3 = 12;
//Game3
final int GAME3_INTRO = 13;
final int GAME3_GLUTTONY = 14;
final int GAME3_WIN = 15;
final int GAME3_LOSE = 16;
final int CHOOSE_GAME_INTERFACE4 = 17;
//Game4
final int GAME4_INTRO = 18;
final int GAME4_LUST = 19;
final int GAME4_WIN = 20;
final int GAME4_LOSE = 21;
final int CHOOSE_GAME_INTERFACE5 = 22;
//Game5
final int GAME5_INTRO = 23;
final int GAME5_ENVY = 24;
final int GAME5_WIN = 25;
final int GAME5_LOSE = 26;
final int CHOOSE_GAME_INTERFACE6 = 27;
//Game6
final int GAME6_INTRO = 28;
final int GAME6_WRATH = 29;
final int GAME6_WIN = 30;
final int GAME6_LOSE = 31;
final int CHOOSE_GAME_INTERFACE7 = 32;
//Game7
final int GAME7_INTRO = 33;
final int GAME7_PRIDE = 34;
final int GAME7_WIN = 35;
final int GAME7_LOSE = 36;
//Game_Win
final int GAME_WIN_ANIMATION = 37;
//Image
PImage [] intro = new PImage[8];
PImage [] bg = new PImage[8];
PImage [] interfacebg = new PImage[7];
PImage losebg1;
PImage losebg2;
PImage [] animation = new PImage[8];

void setup() {
  size(640, 480);
  DIN = createFont("UnidreamLED.ttf", 42);
  //loadeImage
  startbg1 = loadImage("img/startbg1.jpg");
  startbg2 = loadImage("img/startbg2.jpg");
  for (int i=1; i<8; i++) {
    intro[i] = loadImage("img/intro/intro"+i+".jpg");
    bg[i] = loadImage("img/bg/bg"+i+".png");
    losebg1 = loadImage("img/losebg/losebg1_1.jpg");
    losebg2 = loadImage("img/losebg/losebg1_2.jpg");
    }
  for (int i=0; i<7; i++) {
    interfacebg[i] = loadImage("img/interfacebg/interfacebg"+i+".jpg");}
    //movie
    animation0 = new Movie(this, "animation0.mp4");
    animation1 = new Movie(this, "animation1.mp4");
    animation2 = new Movie(this, "animation2.mp4");
    animation3 = new Movie(this, "animation3.mp4");
    animation4 = new Movie(this, "animation4.mp4");
    animation5 = new Movie(this, "animation5.mp4");
    animation6 = new Movie(this, "animation6.mp4");
    animation7 = new Movie(this, "animation7.mp4");
    //audio
    minim = new Minim(this);
    CLICKS = minim.loadSample("audio/CLICKS.mp3", 128);
    START_BGM = minim.loadFile("audio/START_BGM.mp3");
    INTERFACE_BGM = minim.loadFile("audio/INTERFACE_BGM.mp3");
    LOSE_BGM = minim.loadFile("audio/LOSE_BGM.mp3");
    BGM1 = minim.loadFile("audio/BGM1.mp3");
    BGM2 = minim.loadFile("audio/BGM2.mp3");
    BGM2A = minim.loadFile("audio/BGM2A.mp3");
    BGM3 = minim.loadFile("audio/BGM3.mp3");
    BGM4 = minim.loadFile("audio/BGM4.mp3");
    BGM5 = minim.loadFile("audio/BGM5.mp3");
    BGM6 = minim.loadFile("audio/BGM6.mp3");
    BGM7 = minim.loadFile("audio/BGM7.mp3");
  //game1
  washing=loadImage("img/game1/washing.png");
  index=100;
  catchCount=5;
  for(int i=0; i<catchCount; i++){
    catchMe[i]=false;
  }
  clothCount=5;
  classmate=new Classmate();
  me=new Me1();
  score=new Bar();
  frame1=new Frame1();
  for(int i=0; i<clothCount; i++){
    clothes[i]=new Clothes();
  }
  //game2
  clock=new Clock();
  upperBody=new UpperBody();
  frame2=new Frame2();
  bed=loadImage("img/game2/bed.png");
  //game3
  body=new Body();
  fastFood=new FastFood();
  healthFood=new HealthFood();
  frame3=new Frame3();
  //game4
    me4 = new Me4();
   girl = new Girlfriend();
   girlName = new GirlName();
   frame4 = new Frame4();
   meName = new MeName();
  //game5
  me5 = new Me5();
    people = new People();
  scoreBar = new HPBar();
  scythe = new Scythe();
  frame5 = new Frame5();

  for (int i=0; i<nbrKnife; i++) {
    knifeArray[i] = new Knife();
  }
  //game6
  me6 = new Me6();
  scoreBar = new HPBar();
  flame = new FlameManager();
  radian = new Radian();
  frame6 = new Frame6();
  for (int i=0; i<nbrBullet; i++) {
    bulletArray[i] = new Bullet();
  }
  flameFrame = 0;
  flameCount = 0;
  //game7
  score7 = new Score7();
  oldmanR = new OldmanR();
  head = new Head(50);
  sexbodyImg = loadImage("img/game7/sexbody.png");
}
void movieEvent(Movie m) {
  m.read();
}
void draw() {
  imageMode(CORNER);
  background(0);
  println(gameState);
  switch(gameState) {
    case INTRO_ANIMATION:
      animation0.play();
      image(animation0, 0,0,640, 480);
      float mt0 = animation0.time();
        if (mt0 > 39 ) {
          animation0.stop();
          START_BGM.play();
          gameState = GAME_START;}
          break;   
    case GAME_START:
      image(startbg1,0,0,640,480);
        if (mouseX>249 && mouseX<375 && mouseY>326 && mouseY<357){
          image(startbg2,0,0,640,480);
        if (mousePressed==true) {
        START_BGM.pause();
        INTERFACE_BGM.rewind();
        INTERFACE_BGM.play();
        gameState = CHOOSE_GAME_INTERFACE1;}
        }
        break;     
    case CHOOSE_GAME_INTERFACE1:
        image(interfacebg[0],0,0,640,480);
        if (mouseX>33 && mouseX<183 && mouseY>152 && mouseY<344){
          image(interfacebg[0],0,0,640,480);
        if (mousePressed==true) {
        INTERFACE_BGM.pause();
        BGM1.play();
        gameState = GAME1_INTRO;}
        }
        break;    
    //case GAME1
    case GAME1_INTRO:
        image(intro[1],0,0,640,480);
        if (mouseX>508 && mouseX<580 && mouseY>395 && mouseY<419){
          image(intro[1],0,0,640,480);  
        if (mousePressed==true) {
        frameCount0 = -1;
        gameState = GAME1_GREED;}
        }
        break;     
    case GAME1_GREED:
      image(bg[1],0,0,640,480);
      fill(#FF0000);
      textFont(DIN);
      textSize(65);
      text( (20-frameCount0/60), 540, 70);
      //time
    frameCount0 ++;
    frame1.draw();
    //bar
    score.display();
    //clothes
    for(int i=0; i<clothCount; i++){
      clothes[i].display();
      clothes[i].display2();
    }
    //classmate
    classmate.display();
    classmate.move();
    //washing
    image(washing,30,60,150,190);
    //monster
    me.display();
    //catch the clothes
    catchme();
    catchme2();
    //win 
    for(int i=0; i<clothCount; i++){
      if(clothX[0]==width && clothX[1]==width 
      && clothX[2]==width && clothX[3]==width && clothX[4]==width 
      && clothX2[0]==width && clothX2[1]==width && clothX2[2]==width 
      && clothX2[3]==width && clothX2[4]==width){
        BGM1.pause();
        gameState=GAME1_WIN;}
    }
    //lose
    for(int i=0; i<clothCount; i++){
      if(19-frameCount0/60<0 || score.hp<65){
        BGM1.pause();
        LOSE_BGM.rewind();
        LOSE_BGM.play();
        gameState=GAME1_LOSE;}
    }
        break;
    case GAME1_WIN:
     animation1.play();
     float mt1 = animation1.time();
     image(animation1,0,0,640,480);
      if (mt1 > 13) {
        animation1.stop();
        INTERFACE_BGM.rewind();
        INTERFACE_BGM.play();
        gameState = CHOOSE_GAME_INTERFACE2;
        }
        break;
    case CHOOSE_GAME_INTERFACE2:
        image(interfacebg[1],0,0,640,480);
        if (mouseX>142 && mouseX<252 && mouseY>48 && mouseY<158){
          image(interfacebg[1],0,0,640,480);
        if (mousePressed==true) {
        INTERFACE_BGM.pause();
        BGM2.play();
        gameState = GAME2_INTRO;}
        }
        break;
    case GAME1_LOSE:
      image(losebg1,0,0,640,480);
      if (mouseX>510 && mouseX<575 && mouseY>365 && mouseY<440) {
        image(losebg2,0,0,640,480);
        if (mousePressed==true) {
        LOSE_BGM.pause();
        BGM1.rewind();
        BGM1.play();
        gameState = GAME1_GREED;}
      }
      //reset
      frameCount0 = -1;
      index=100;
      catchCount=5;
      for(int i=0; i<catchCount; i++){
        catchMe[i]=false;}
        clothCount=5;
        classmate=new Classmate();
        me=new Me1();
        score=new Bar();
        frame1=new Frame1();
        for(int i=0; i<clothCount; i++){
        clothes[i]=new Clothes();
    }
        break;
    //case GAME2
    case GAME2_INTRO:
        image(intro[2],0,0,640,480);
        if (mouseX>508 && mouseX<580 && mouseY>395 && mouseY<419){
          image(intro[2],0,0,640,480);
          frameCount0=-1;
        if (mousePressed==true) {
        BGM2A.loop();
        gameState = GAME2_SLOTH;}
        }
        break;     
    case GAME2_SLOTH:
      image(bg[2],0,0,640,480);
      stroke(255,0,0);
      line(340,0,340,480);     
      imageMode(CENTER);
      fill(#FF0000);
      textFont(DIN);
      textSize(65);
      text((10-frameCount0/60), 540, 70);
      frameCount0 ++;
      frame2.draw();
      clock.display();
      upperBody.display();
      image(bed,342,351,480,150);
      if(mousePressed==true){
        upperBody.unitRad=0;
      }else{upperBody.unitRad=TWO_PI/360;}
      //win
      if((10-frameCount0/60)<0 && upperBody.bodyRad<TWO_PI/4){
      BGM2.pause();
      BGM2A.pause();
      gameState=GAME2_WIN;}
      //lose
      if(upperBody.bodyRad>=TWO_PI/4){
      BGM2.pause();
      BGM2A.pause();
      LOSE_BGM.rewind();
      LOSE_BGM.play();
      gameState=GAME2_LOSE;
      }
      imageMode(CORNER);
      break;
    case GAME2_WIN:
     animation2.play();
     float mt2 = animation2.time();
     image(animation2,0,0,640,480);
      if (mt2 > 13) {
        animation2.stop();
        INTERFACE_BGM.rewind();
        INTERFACE_BGM.play();
        gameState = CHOOSE_GAME_INTERFACE3;        
        }
        break;
    case CHOOSE_GAME_INTERFACE3:
        image(interfacebg[2],0,0,640,480);
        if (mouseX>169 && mouseX<250 && mouseY>257 && mouseY<421){
          image(interfacebg[2],0,0,640,480);
        if (mousePressed==true) {
        INTERFACE_BGM.pause();
        BGM3.play();
        gameState = GAME3_INTRO;}
        }
      break;
    case GAME2_LOSE:
      image(losebg1,0,0,640,480);
      if (mouseX>510 && mouseX<575 && mouseY>365 && mouseY<440){
        image(losebg2,0,0,640,480);
          if (mousePressed==true) {
          frameCount0 =-1;
          LOSE_BGM.pause();
          BGM2.rewind();
          BGM2.play();
          BGM2A.rewind();
          BGM2A.loop();
          gameState = GAME2_SLOTH;}   
      }      
      //reset
      clock=new Clock();
      upperBody=new UpperBody();
      frame2=new Frame2();
      break;
    //case GAME3
    case GAME3_INTRO:
     image(intro[3],0,0,640,480);
        if (mouseX>508 && mouseX<580 && mouseY>395 && mouseY<419){
          image(intro[3],0,0,640,480);
          frameCount0=-1;
        if (mousePressed==true) {gameState = GAME3_GLUTTONY;}
        }
        break;     
    case GAME3_GLUTTONY:
    image(bg[3],0,0,640,480);
     fill(#FF0000);
     textFont(DIN);
     textSize(65);
     text( (20-frameCount0/60), 540, 70);
    //time
    frameCount0 ++;
    frame3.draw();
    //body
    body.display();
    body.move();
    //fastfood
      fastFood.display();
      fastFood.move();
    //healthfood
      healthFood.display();
      healthFood.move();
    //line
    stroke(255,0,0);
    line(0,height-75,width,height-75);
    //eat
    for(int i=0; i<fastFoodCount; i++){
      if(fastFood.x[i]-25>=body.x && 
      fastFood.x[i]+25<=body.x+100 && fastFood.y[i]+25>=body.y){
        fastFood.x[i]=width;
        newBody++;
      }
    }
    for(int i=0; i<healthFoodCount; i++){
      if(healthFood.x[i]-25>=body.x && 
      healthFood.x[i]+25<=body.x +100 && healthFood.y[i]+25>=body.y){
        healthFood.x[i]=width;
        newBody--;
      }
    }
    if(newBody<=0){newBody=0;}
    if(newBody>=4){newBody=4;}
    //win
    if(newBody==4){
      BGM3.pause();
      gameState=GAME3_WIN;
    }
    //lose
    if((20-frameCount0/60)<0){
      BGM3.pause();
      LOSE_BGM.rewind();
      LOSE_BGM.play();
      gameState=GAME3_LOSE;
    }
    break;
    case GAME3_WIN:
     animation3.play();
     float mt3 = animation3.time();
     image(animation3,0,0,640,480);
      if (mt3 > 13) {
        animation3.stop();
        INTERFACE_BGM.rewind();
        INTERFACE_BGM.play();
        gameState = CHOOSE_GAME_INTERFACE4;        
        }
        break;
    case CHOOSE_GAME_INTERFACE4:
        image(interfacebg[3],0,0,640,480);
        if (mouseX>355 && mouseX<397 && mouseY>99 && mouseY<156){
          image(interfacebg[3],0,0,640,480);
        if (mousePressed==true) {
        INTERFACE_BGM.pause();
        BGM4.play();
        gameState = GAME4_INTRO;}
        }
        break;
        case GAME3_LOSE:
      image(losebg1,0,0,640,480);
      if (mouseX>510 && mouseX<575 && mouseY>365 && mouseY<440){
        image(losebg2,0,0,640,480);
          if (mousePressed==true) {
          frameCount0 =-1;
          LOSE_BGM.pause();
          BGM3.rewind();
          BGM3.play();
          gameState = GAME3_GLUTTONY;}   
      } 
      //reset
          newBody = 0;
          body=new Body();
          fastFood=new FastFood();
          healthFood=new HealthFood();
          frame3=new Frame3();
          break; 
    //case GAME4
     case GAME4_INTRO:
       image(intro[4],0,0,640,480);
        if (mouseX>508 && mouseX<580 && mouseY>395 && mouseY<419){
          image(intro[4],0,0,640,480);
          
        if (mousePressed==true) {
          frameCount0 = -1;
          frame4.countDown = 20;
          gameState = GAME4_LUST;
        }
        }
        break;     
    case GAME4_LUST:
    frameCount0++;
    frame4.draw();
    image(bg[4],0,0,640,480);
    fill(#FF0000);
    textFont(DIN);
    textSize(65);
    text( (20-frameCount0/60), 540, 70);
    println(frame4.countDown, keyCode);
    if (frameCount0 % 60==0) {
      girlIndex = girl.order(frameCount0);
      girl.x[girlIndex] = -100;
    }
    me4.display();
    meName.display();
    meName.nameKeyPressed();
    girl.display();
    girl.move();
    girl.waitInLine();

    if (currentMNameIndex == currentGNameIndex) {
      currentMNameIndex = 29;
      girl.x[currentGirlIndex] = FRAME_W;
      girl.y[currentGirlIndex] = FLOOR-150-20;
    }

    stroke(#FF0000);
    line(WAITING_END, 0, WAITING_END, height);
  
   //Game lose condition
    for (int i = 1; i<nbrGirl; i++) {
      if (girl.x[i]<WAITING_END && girl.x[i] == girl.x[i-1]-100) {
        BGM4.pause();
        LOSE_BGM.rewind();
        LOSE_BGM.play();
        gameState = GAME4_LOSE;
      }
    }
    //Game win condition
    if (frame4.countDown<=0) {
      BGM4.pause();
      gameState = GAME4_WIN;
    }
    break;

    case GAME4_WIN:
     animation4.play();
     float mt4 = animation4.time();
     image(animation4,-100,0,840,480);
      if (mt4 > 13) {
        animation4.stop();
        INTERFACE_BGM.rewind();
        INTERFACE_BGM.play();
        gameState = CHOOSE_GAME_INTERFACE5;        
        }
        break;
    case CHOOSE_GAME_INTERFACE5:
        image(interfacebg[4],0,0,640,480);
        if (mouseX>264 && mouseX<366 && mouseY>175 && mouseY<289){
          image(interfacebg[4],0,0,640,480);
        if (mousePressed==true) {
        INTERFACE_BGM.pause();
        BGM5.play();
        gameState = GAME5_INTRO;}
        }
      break;
    case GAME4_LOSE:
      image(losebg1,0,0,640,480);
      if (mouseX>510 && mouseX<575 && mouseY>365 && mouseY<440){
        image(losebg2,0,0,640,480);
          if (mousePressed==true) {
          LOSE_BGM.pause();
          BGM4.rewind();
          BGM4.play();
          gameState = GAME4_LUST;}   
      }      
      //reset
        frameCount0 = -1;
        girlIndex = 0;
        currentGNameIndex = 29;
        currentMNameIndex = 29;
        currentGirlIndex = 29;
        girl = new Girlfriend();
      break;
    //case GAME5
        case GAME5_INTRO:
        image(intro[5],0,0,640,480);
        if (mouseX>508 && mouseX<580 && mouseY>395 && mouseY<419){
          frameCount0 = -1;
          score5 = 20;
          image(intro[5],0,0,640,480);
        if (mousePressed==true) {gameState = GAME5_ENVY;}
        }
        break;     
    case GAME5_ENVY:
    image(bg[5], 0, 0, 640, 480);
    frameCount0++;
    frame5.draw();
    fill(#FF0000);
    textFont(DIN);
    textSize(65);
    text( (20-frameCount0/60), 540, 70);
    me5.display();
    scythe.display();
    people.display();
    people.move();
    people.boundaryDetection();
    scoreBar.display(score5);
  //Knife
    for (int i = 0; i < nbrKnife; i++) {
      if ( knifeArray[i].x >= FLOOR) {
        knifeArray[i].x = -width;
        knifeArray[i].y = -height;
      }
      if (knifeArray[i].x >= 0 && knifeArray[i].y>=0) {
        knifeArray[i].move(knifeAtan[i]);
      }
    }
    //gift: score = score +10;
    for (int i = 0; i<nbrKnife; i++) {
      for (int j = 0; j<people.nbrPeople; j++) {
        if (knifeArray[i].x > FLOOR-50  && people.x[j]> map(knifeAtan[i], 2.3, 0.8, 40, 489) && people.x[j]<map(knifeAtan[i], 2.3, 0.8, 40, 600)) {
          knifeArray[i].x = -width;
          knifeArray[i].y = -height;
          people.x[j] = random(width-104);
          people.speed[j] = floor(random(-5, 5));
          if (people.speed[j] == 0) {
            people.speed[j] = floor(random(-5, 5));
          }
          if (people.giftOrPooIndex[j] == 0) {
            score5Change(-10);
          } else if (people.giftOrPooIndex[j] == 1) {
            score5Change(10);
          }
        }
      }
    }
    //Game win condition
    if (score5 >= 100) {
      BGM5.pause();
      gameState = GAME5_WIN;
    }
    //Game lose condition
    if (frame5.countDown==0 || score5==0) {
      BGM5.pause();
      LOSE_BGM.rewind();
      LOSE_BGM.play();
      gameState = GAME5_LOSE;
    }
    break;
    case GAME5_WIN:
     animation5.play();
     float mt5 = animation5.time();
     image(animation5,0,0,640,480);
      if (mt5 > 13) {
        animation4.stop();
        BGM5.pause();
        gameState = CHOOSE_GAME_INTERFACE6;        
        }
        break;
    case CHOOSE_GAME_INTERFACE6:
        image(interfacebg[5],0,0,640,480);
        if (mouseX>282 && mouseX<426 && mouseY>312 && mouseY<418){
          image(interfacebg[5],0,0,640,480);
        if (mousePressed==true) {
        INTERFACE_BGM.pause();
        BGM6.play();
        gameState = GAME6_INTRO;}
        }
      break;
    case GAME5_LOSE:
      image(losebg1,0,0,640,480);
      if (mouseX>510 && mouseX<575 && mouseY>365 && mouseY<440){
        image(losebg2,0,0,640,480);
          if (mousePressed==true) {
          frameCount0 =-1;
          LOSE_BGM.pause();
          BGM5.rewind();
          BGM5.play();
          gameState = GAME5_ENVY;}   
      }      
      //reset
        frameCount0 = -1;
        girlIndex = 0;
        score5 =20;
        currentGNameIndex = 29;
        currentMNameIndex = 29;
        currentGirlIndex = 29;
        girl = new Girlfriend();
      break;
    //case GAME6
    case GAME6_INTRO:
     image(intro[6],0,0,640,480);
        if (mouseX>508 && mouseX<580 && mouseY>395 && mouseY<419){
          image(intro[6],0,0,640,480);
        if (mousePressed==true) {
        frameCount0=-1;
        gameState = GAME6_WRATH;}
        }
        break;     
    case GAME6_WRATH:
    image(bg[6], 0, 0, 640, 480);
    frameCount0++;
    frame6.draw();
    me6.move(); 
    me6.boundaryDetection();
    me6.display();
    scoreBar.display(score6);
    radian.display();
    radian.move();
    radian.boundaryDetection();
    flame.display();
    println(nbrBullet);
    fill(#FF0000);
    textFont(DIN);
    textSize(65);
    text((20-frameCount0/60), 540, 70);
    if ( bulletArray[bulletIndex].x <= -40 || bulletArray[bulletIndex].y <= -40) {//-bulletArray[bulletIndex].img.width) {
      bulletArray[bulletIndex].x = -width;
      bulletArray[bulletIndex].y = -height;
    }
    for (int i = 0; i < nbrBullet; i++) {
      bulletArray[i].display();
      if (bulletArray[i].x>-40 && bulletArray[i].x < 640-40 && bulletArray[i].y>-40 && bulletArray[i].y<640-40) {
        bulletArray[i].move();
      }
    }
    //sucess: score = score +10;
    for (int i = 0; i<nbrBullet; i++) {
      if (radian.isHit(bulletArray[i].x, bulletArray[i].y, 40, 40)) {
        flame.add(radian.x, radian.y);
        bulletArray[i].x = -width;
        bulletArray[i].y = -height;
        radian.x = random(width-140);
        score6Change(5);
      }
    }
    //Game win condition
    if (score6 >= 100) {
      BGM6.pause();
      gameState = GAME6_WIN;
    }
    //Game lose condition
    if (frame6.countDown==0) {
      BGM6.pause();
      LOSE_BGM.rewind();
      LOSE_BGM.play();
      gameState = GAME6_LOSE;
    }
    break;
    case GAME6_WIN:
     animation6.play();
     float mt6 = animation6.time();
     image(animation6,0,0,640,480);
      if (mt6 > 13) {
        animation6.stop();
        INTERFACE_BGM.rewind();
        INTERFACE_BGM.play();
        gameState = CHOOSE_GAME_INTERFACE7;        
        }
        break;
    case CHOOSE_GAME_INTERFACE7:
        image(interfacebg[6],0,0,640,480);
        if (mouseX>444 && mouseX<518 && mouseY>72 && mouseY<219){
          image(interfacebg[6],0,0,640,480);
        if (mousePressed==true) {
        INTERFACE_BGM.pause();
        BGM1.play(); 
        gameState = GAME7_INTRO;}
        }
        break;
        case GAME6_LOSE:
      image(losebg1,0,0,640,480);
      if (mouseX>510 && mouseX<575 && mouseY>365 && mouseY<440){
        image(losebg2,0,0,640,480);
          if (mousePressed==true) {
        LOSE_BGM.pause();
        BGM6.rewind();
        BGM6.play();
        frameCount0 = -1;
        score6 = 0;
        bulletIndex = 0;
        me6 = new Me6();
        flame = new FlameManager();
        radian = new Radian();
        for (int i=0; i<nbrBullet; i++) {
          bulletArray[i] = new Bullet();
        }
        flameFrame = 0;
        flameCount = 0; 
          gameState = GAME6_WRATH;} 
      } 
      break;
        case GAME7_INTRO:
        image(intro[7],0,0,640,480);
        if (mouseX>508 && mouseX<580 && mouseY>395 && mouseY<419){
          image(intro[7],0,0,640,480);
        if (mousePressed==true) {
        frameCount0 = -1;
        gameState = GAME7_PRIDE;
        }
        }
        break;     
    case GAME7_PRIDE:
      image(bg[7],0,0,640,480);
      oldmanR.draw();
      oldmanR.x +=5;
      frameCount0 ++;
      fill(#FF0000);
      textFont(DIN);
      textSize(65);
      text( (10-frameCount0/60), 540, 70);
      image(sexbodyImg, 470, 170, 172,166); 
      head.draw();
    //enemys
    if (time == 0 || millis() - time >= wait) {
      addChild(currentType++);
      currentType = currentType % 4;
    }    
    for (int i = 0; i < childCount; ++i) {
      if (child[i] != null) {
        child[i].move();
        child[i].draw();
        
        if (child[i].isCollideWithFighter()) {
          if(isMovingDown == true){
          head.scoreValueChange( + child[i].damage);}
          else{
            head.scoreValueChange( - child[i].damage);
          child[i] = null;}
          } else if (child[i].isOutOfBorder()) {
          child[i] = null;
          }
        }
    }  
    score7.updateWithHeadScore(head.score);
        break;
    case GAME7_WIN:
     animation7.play();
     image(animation7,0,0,640,480);
        break;
    case GAME7_LOSE:
      image(losebg1,0,0,640,480);
      if (mouseX>510 && mouseX<575 && mouseY>365 && mouseY<440) {
        image(losebg2,0,0,640,480);
        if (mousePressed==true) {
        LOSE_BGM.pause();
        BGM7.rewind();
        BGM7.play();
        gameState = GAME7_PRIDE;}
      }
      //reset
      frameCount0 = -1;
      score7 = new Score7();
      oldmanR = new OldmanR();
      head = new Head(50);
      currentType = ChildShowingType.STRAIGHT;
      time = 0;
        break;
        }
}
boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  if (ax>bx-aw && ax<bx+bw && ay>by-ah && ay<by+bh) {
    return true;
  } else {
    return false;
  }
}
boolean isHit1(int ax, int ay, int aw, int ah, int bx, int by, int bw, int bh)
{
  boolean collisionX = (ax + aw >= bx) && (bx + bw >= ax);
  boolean collisionY = (ay + ah >= by) && (by + bh >= ay);
  return collisionX && collisionY;
}
void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftPressed=true;
      break;
      case RIGHT:
      rightPressed=true;
      break;
      case DOWN : 
      isMovingDown =true; 
      break ;
    }
  }
}
void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case LEFT:
      leftPressed=false;
      break;
      case RIGHT:
      rightPressed=false;
      break;
      case DOWN : 
      isMovingDown =false; 
      break ;
    }
  }
}
void catchme(){
  for(int i=0; i<clothCount; i++){ 
    if(mouseX+me.w/2>=clothX[i] && mouseX-me.w/2<=clothX[i]+clothes[i].w 
    && mouseY+me.h/2>=clothes[i].y && mouseY-me.h/2<=clothes[i].y+clothes[i].h){ 
      if(mousePressed){
          index=i;
          catchMe[index]=true;
          clothes[i].disappear(index);
          if(classmate.x+classmate.w>=172 && classmate.x<=width){
            score.change();
          }
      }
    }
  }
}
void catchme2(){
  for(int i=0; i<clothCount; i++){ 
    if(mouseX+me.w/2>=clothX2[i] && mouseX-me.w/2<=clothX2[i]+clothes[i].w 
    && mouseY+me.h/2>=clothes[i].y2 && mouseY-me.h/2<=clothes[i].y2+clothes[i].h){ 
      if(mousePressed){
          index2=i;
          catchMe2[index2]=true;
          clothes[i].disappear2(index2);
          if(classmate.x+classmate.w>=172 && classmate.x<=width){
            score.change();
          }
      }
    }
  }
}
void score5Change(int points) {
  score5 = score5+points;
}
void score6Change(int points) {
  score6 = score6+points;
}
void mousePressed() {
   //CLICKS SOUND
   if (mousePressed == true){CLICKS.trigger();}
   //Game5
   if (gameState == GAME5_ENVY) {
    if (knifeArray[knifeIndex].x == -width &&
      knifeArray[knifeIndex].y == -height) {
      knifeArray[knifeIndex].x = 0;
      knifeArray[knifeIndex].y = 0;
      knifeAtan[knifeIndex] = scythe.atanScythe;
      knifeIndex++;
      knifeIndex %= nbrKnife;
    }
  }
  if (bulletArray[bulletIndex].x == -width &&
    bulletArray[bulletIndex].y == -height) {
    bulletArray[bulletIndex].x = mouseX-40;
    bulletArray[bulletIndex].y = 480 - 90;
    bulletIndex = bulletIndex + 1;
    bulletIndex %= nbrBullet;
  }
}