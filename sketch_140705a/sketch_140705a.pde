int framecount;
int rallycount;

class Ball{
  float x , y;
  float vx , vy;
  float a;
  
  Ball(){
    x = width / 2;
    y = height / 2;
    vx = vy = 2;
  }
  
  void draw(){
    ellipse(x,y,20,20);
  }
  
  void updata(){
    if(500 - 20 < x || 0 + 20 > x){
      vx *= -1;
      rallycount++;
    }
    if(500 - 20 < y || 0 + 20 > y)vy *= -1;
    if(500 - 20 < x )vy = random(10) * -1;
    if(0 + 20 > x)vy = random(10);
    x += vx;
    y += vy;
   if(framecount % 40 == 0){
     if (vx > 0) vx++;
     if (vx < 0) vx--;
   }
  }
}

class Player{
  float x , y;
  float vx , vy;
  float a;
  Player(int posx){
    x = posx;     
    y = height / 2;     
    vx = vy = 0;
  }

  void draw(){
    rect(x,y,10,50);
  }
  
  void updata(){
    y = (mouseY);
  }
}

ArrayList<Ball> balls;
ArrayList<Player> Players;

void setup(){
  size(500,500);

  balls = new ArrayList<Ball>();
  Ball b = new Ball();
  balls.add(b);
  
  Players = new ArrayList<Player>();
  Player P1 = new Player(0);
  Players.add(P1);
  Player P2 = new Player(490);
  Players.add(P2);
  
  framecount = 0;
  rallycount = 0;  
}

void draw(){
 //background(0);
 
 noStroke();
 fill(100,100,100,10);
 rect(0,0,width,height);
 stroke(1);
 fill(255);
 
 int bs = balls.size();
 int ps = Players.size(); 
 
 for (int i = 0; i < bs;i++){
   Ball b = balls.get(i);
   b.updata();
   b.draw();
 }

 for (int i = 0; i < ps;i++){
   Player p = Players.get(i);
   p.updata();
   p.draw();
 }
 
 framecount++;
 text(rallycount,10,10);
}

