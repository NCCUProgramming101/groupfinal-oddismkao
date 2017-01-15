class Frame3{
  float countDown;
  
  Frame3(){
    countDown = 20;
  }
  
  void draw(){
    if(frameCount0 % 60==0){
      countDown = 20-(frameCount0/60);
      println(countDown);
    }
  }
}

class Body{
  PImage []body=new PImage[5];
  int x;
  int y;
  int h;
  int w;
  int speed;
  
  
  Body(){
    for(int i=0; i<bodyCount; i++){
      body[i]=loadImage("img/game3/body"+i+".png");
    }
    w=200;
    h=85;
    x=width/2;
    y=height-h;
    speed=2;
  }
  
  void display(){
    image(body[newBody],x,y,w,h);
    //fill(0);
    //rect((width-w)/2,height-h,w,h);
  }
  
  void move(){
    for(int i=0; i<bodyCount; i++){
      if (leftPressed) {x-=speed;}
      if (rightPressed) {x+=speed;}
      if(x+w>=width){x=width-w;}
      if(x<=0){x=0;}
    }
  }
  
  
}

class FastFood{
  PImage []fastFood=new PImage[5];
  int []x=new int[5];
  int []y=new int[5];
  int []speed=new int[5];
  
  FastFood(){
    for(int i=0; i<fastFoodCount; i++){
    fastFood[i]=loadImage("img/game3/fastfood"+i+".png");
    x[i]=floor(random(0,590));
    y[i]=floor(random(-1000,-50));
    speed[i]=floor(random(2,6));
    }
    imageMode(CENTER);
  }
  
  void display(){
    for(int i=0; i<fastFoodCount; i++){
      image(fastFood[i%6],x[i],y[i],50,50);
    }
  }
  
  void move(){
    for(int i=0; i<fastFoodCount; i++){
      y[i]+=speed[i];
      if(y[i]>height-50){
        x[i]=floor(random(0,590));
        y[i]=floor(random(-200,-50));
      }
    }
  }
  
}

class HealthFood{
  PImage []healthFood=new PImage[5];
  int []x=new int[5];
  int []y=new int[5];
  int []speed=new int[5];
  
  HealthFood(){
    for(int i=0; i<healthFoodCount; i++){
      healthFood[i]=loadImage("img/game3/healthfood"+i+".png");
      x[i]=floor(random(0,590));
      y[i]=floor(random(-1000,-50));
      speed[i]=floor(random(2,6));
    }
    imageMode(CENTER);
  }
  
  void display(){
    for(int i=0; i<healthFoodCount; i++){
      image(healthFood[i%5],x[i],y[i],50,50);
    }
  }
  
  void move(){
    for(int i=0; i<healthFoodCount; i++){
      y[i]+=speed[i];
      if(y[i]>height-50){
        x[i]=floor(random(0,590));
        y[i]=floor(random(-200,-50));
      }
    }
  }
  
}