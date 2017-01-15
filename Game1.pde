class Frame1{
  float countDown;
  
  Frame1(){
    countDown = 20;
  }
  
  void draw(){
    if(frameCount0 % 60==0){
      countDown = 20-(frameCount0/60);
      println(countDown);
    }
  }
}
class Bar{
  PImage score;
  float hp;
  
  Bar(){
    score=loadImage("img/game1/score.png");
    hp=195;
  }
  
  void display(){
    fill(255,0,0);
    noStroke();
    rect(22,10,hp,20);
    image(score,10,10);
  }
  
  void change(){
    hp=hp-65; //work wrong
  }
  
}

class Classmate{
  PImage classmate;
  int x;
  int y;
  int w;
  int h;
  float speed;
  
  Classmate(){
    classmate=loadImage("img/game1/classmate.png");
    w=66;
    h=80;
    x=-w;
    y=50;
    speed=3;
  }
  
  void display(){
    image(classmate,x,y);
  }
  
  void move(){
    x+=speed;
    if(x>=800){x=-w;}
  }
  
}

class Clothes{
  PImage []cloth=new PImage[5];
  int x;
  int y;
  int x2;
  int y2;
  int w;
  int h;
  
  Clothes(){
    for(int i=0; i<clothCount; i++){
      cloth[i]=loadImage("img/game1/cloth"+i+".png");
      x=120;
      y=280;
      w=80;
      h=80;
      clothX[i]=x+100*i;
      x2=170;
      y2=123;
      clothX2[i]=x2+100*i;
    }
  }
  
  
  void display(){
    for(int i=0; i<clothCount; i++){
      image(cloth[i],clothX[i],y,w,h);
    }
  }
  
  void display2(){
    for(int i=0; i<clothCount; i++){
      image(cloth[i],clothX2[i],y2,w,h);
    }
  }
  
  void disappear(int a){
    if(catchMe[a]==true){
      clothX[a]=width;
    }
  }
  
  void disappear2(int a){
    if(catchMe2[a]==true){
      clothX2[a]=width;
    }
  }

}

class Me1{
  PImage me;
  int w;
  int h;
  int x;
  int y;
  
  Me1(){
    me=loadImage("img/game1/me1.png");
    w=50;
    h=50;
    x=mouseX;
    y=mouseY;
  }
  
  void display(){
    imageMode(CENTER);
    x=mouseX;
    y=mouseY;
    image(me,x,y,w,h);
    if(x-w/2<=0){x=w/2;}
    if(x+w/2>=width){x=width-w/2;}
    if(y-h/2<=0){y=h/2;}
    if(y+h/2>=height){y=height-h/2;}
    imageMode(CORNER);
  }
  
  
  
  
}