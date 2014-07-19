class Mover{
  float cx,cy,cr;
  color c;
  
  Mover(){
//    cx = random(width);
//    cy = random(height);
//    cr = random(10,100);
    cx = width / 2;
    cy = height / 2;
    cr = 40;
    c = color(random(10,255),255,255);
  }
  
  void draw(){
    fill(c);
    
    ellipse(cx,cy,2*cr,2*cr);
  }
}

Mover moverSmall;
Mover moverLarge;
float Checkr;
float x;
float y;
float dx;
float dy;
float d2;
float cdx;
float cdy;
float cd2;

void setup(){
  size(300,300);
  colorMode(HSB);
  moverSmall = new Mover();
  moverLarge = new Mover();
  moverLarge.cr += 100;
}

void draw(){
  background(0,0,0);
  moverLarge.draw();
  moverSmall.draw();

  text(d2,10,10);
  text(cd2,20,20);
  
  stroke(255);
  x = mouseX;
  y = mouseY;

  dx = x - moverSmall.cx;
  dy = y - moverSmall.cy;
  d2 = (dx * dx) + (dy * dy);

  cdx = moverSmall.cx - moverLarge.cx;
  cdy = moverSmall.cy - moverLarge.cy;
  cd2 = (cdx * cdx) + (cdy * cdy);

  line(moverLarge.cx,moverLarge.cy,x,y);
  line(moverSmall.cx,moverSmall.cy,moverLarge.cx,moverLarge.cy);
  fill(0);
}

void mousePressed(){
  println("mousePressed");
}

void mouseDragged(){
  println("mouseDragged");
  
  if((moverLarge.cr - moverSmall.cr) * (moverLarge.cr - moverSmall.cr) > cd2){
    if (moverSmall.cr * moverSmall.cr > d2){
      moverSmall.cx = mouseX - dx;
      moverSmall.cy = mouseY - dy;
    }
  }else{
     float _x = x - moverLarge.cx;
     float _y = y - moverLarge.cy;

     float checkRadian = _x * _x + _y * _y;
     checkRadian = sqrt(checkRadian);
     
     float ratio = (moverLarge.cr - moverSmall.cr) / checkRadian;
     
      moverSmall.cx = mouseX * ratio;
      moverSmall.cy = mouseY * ratio;
  }
}

void mouseReleased(){
  println("mouseReleased");
}
