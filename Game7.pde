
class Direction
{
  static final int DOWN = 0;
}
class ChildShowingType
{
  static final int STRAIGHT = 0;
  static final int SLOPE = 1;
  static final int STRONGLINE = 2;
}
class TypeB
{
  static final int HEAD = 0;
  static final int CHILD = 1;
}

class Child {
  int x = 0;
  int y = 0;
  int type;
  int speed;
  PImage childImg;
  int life;
  int damage;
  
  Child(int x, int y, int type) {
    this.x = x;
    this.y = y;
    this.type = type;
    this.life = 1;
    this.speed = 6;
    this.damage = 0;
    this.childImg = loadImage("img/game7/enemy.png");
  }
  void move() {
    this.x+= this.speed;
  }
  void draw()
  {image(childImg, x, y, 60,60);}

  boolean isCollideWithFighter()
  {
    if (isHit1(head.x, head.y, head.headImg.width, head.headImg.height, 
    this.x, this.y, this.childImg.width, this.childImg.height) == true) {
      return true;} else {return false;
    }
  }
  boolean isOutOfBorder()
  {
    if (this.x > width) {
      return true;
    } else {
      return false;
    }
  }
}

void addChild(int type)
{  
  for (int i = 0; i < childCount; ++i) {
    child[i] = null;
  }
  switch (type) {
  case ChildShowingType.STRAIGHT:
    addStraightChild();
    break;
  case ChildShowingType.SLOPE:
    addSlopeChild();
    break;
  }
  time = millis();
}

void addStraightChild()
{
  float t = random(240, 400);
  int h = int(t);
  for (int i = 0; i < 5; ++i) {
    child[i] = new Child( (i + 1) * -60, h, TypeB.CHILD);
  }
}
void addSlopeChild()
{
  float t = random(240, 280);
  int h = int(t);
  for (int i = 0; i < 2; ++i) {
    child[i] = new Child( (i + 1) * -20, h + i * 60, TypeB.CHILD);
  }
}

class Head {
  PImage headImg;
  PImage headImg1;
  int x = 0;
  int y = 0;
  int type;
  int speed = 5;

  int score;
  Head(int score) {
    this.headImg = loadImage("img/game7/head1.png");
    this.headImg1 = loadImage("img/game7/head.png");
    this.x = 490;
    this.y = 180;
    this.type = TypeB.HEAD;
    this.score = score;
  }

  void draw() {
    image(headImg, this.x, this.y,50,50);
    if (isMovingDown) {
      this.move(Direction.DOWN);
    }
  }

  void move(int direct) {
    switch (direct) {
    case Direction.DOWN:
    image(headImg1, this.x, this.y,50,50);
    }
  }

  void scoreValueChange(int value)
  {
    this.score += value;
    if (this.score <=0){
      BGM7.pause();
      LOSE_BGM.rewind();
      LOSE_BGM.play();
      gameState = GAME7_LOSE;
      return;
    } else if (this.score >= 100) {
      this.score = 100;
      BGM7.pause();
      gameState = GAME7_WIN;
      return;
    }
    return;
  }
}

class Oldman extends Child {

  Oldman(int x, int y, int type) {
    super (x, y, type); 
    super.life = 5;
    super.damage = 50;
    super.speed = 3;
    super.childImg = loadImage("img/game7/enemy2.png");
  }
}

class OldmanR {
  int x = 0;
  int y = 0;
  PImage oldmanRImg;
  OldmanR () {
    this.oldmanRImg = loadImage("img/game7/enemy2.png");
    this.Position();
  }

  void Position() {
    this.x = 0;
    this.y = 170;
  }

  void draw() {
    image(this.oldmanRImg, this.x, this.y, 140, 164);
    if (isHit1(this.x, this.y, this.oldmanRImg.width, this.oldmanRImg.height, 
    head.x, head.y, head.headImg.width, head.headImg.height)) {
      if(isMovingDown == true){
          head.scoreValueChange( + 10);
            this.Position();
        }else{
            head.scoreValueChange( - 10);
            this.Position();
          }
    }
  }
}

class Score7 {
  PImage score7UI;

  Score7 () {
    this.score7UI = loadImage("img/game7/hp.png");
  }

  void updateWithHeadScore(int score){
    fill (255, 0, 0) ;
    rect(15, 10, score * 2, 40 ) ;
    image(score7UI, 10, 10);
  }
}