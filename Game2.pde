class Frame2{
  float countDown;
  
  Frame2(){
    countDown = 20;
  }
  
  void draw(){
    if(frameCount0 % 60==0){
      countDown = 20-(frameCount0/60);
      println(countDown);
    }
  }
}

class UpperBody{
  PImage upperBody;
  int x; 
  int y;
  float bodyRad;
  
  UpperBody(){
    upperBody=loadImage("img/game2/upperbody.png");
    x=300;
    y=273;
    bodyRad=0;
  }
  
  float unitRad=TWO_PI/360;
  
  void display(){
    bodyRad+=unitRad;
    pushMatrix();
    translate(x,y);
    rotate(bodyRad);
    image(upperBody,0,0,150,106);
    popMatrix();
  }
}

class Clock {
  PImage clock;
  int x;
  int y;
  float clockRad;

  Clock() {
    clock=loadImage("img/game2/clock.png");
    x=61;
    y=176;
    clockRad=-TWO_PI/12;
    imageMode(CENTER);
  }

  float unitRad = TWO_PI/90 ;

  void display() {
    if (clockRad >=TWO_PI/12) {
      unitRad = -abs(unitRad) ; 
    }
    if (clockRad<=-(TWO_PI/12)) {
      unitRad = abs(unitRad) ; 
    }

    clockRad+= unitRad;
    pushMatrix();
    translate(x, y);
    rotate(clockRad);
    image(clock, 0, 0, 42, 49);
    popMatrix();
  }
}