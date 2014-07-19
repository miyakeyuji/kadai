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

Mover mover;
Mover movers;
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
  mover = new Mover();
  movers = new Mover();
  movers.cr += 100;
}

void draw(){
  background(0,0,0);
  movers.draw();
  mover.draw();

  text(d2,10,10);
  text(cd2,20,20);
  
  stroke(255);
  x = mouseX;
  y = mouseY;

  dx = x - mover.cx;
  dy = y - mover.cy;
  d2 = (dx * dx) + (dy * dy);

  cdx = mover.cx - movers.cx;
  cdy = mover.cy - movers.cy;
  cd2 = (cdx * cdx) + (cdy * cdy);

  line(mover.cx,mover.cy,x,y);
  line(mover.cx,mover.cy,movers.cx,movers.cy);
  fill(0);
}

void mousePressed(){
  println("mousePressed");
}

void mouseDragged(){
  println("mouseDragged");
  
  if((movers.cr - mover.cr) * (movers.cr - mover.cr) > cd2){
    if (mover.cr * mover.cr > d2){
      mover.cx = mouseX - dx;
      mover.cy = mouseY - dy;
    }
  }else{
    mover.cx = movers.cx - dx;
    mover.cy = movers.cy - dy;
  }
}

void mouseReleased(){
  println("mouseReleased");
}
