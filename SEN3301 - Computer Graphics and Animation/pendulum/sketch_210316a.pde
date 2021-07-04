void setup()
{
  size(360,400);
  background(255);
}

int r = 100;
int ballX = 0;
int dir = 1;

void draw()
{
  background(255);
  
  drawCurves();
  
  strokeWeight(10);
  point(ballX, 200 + r * sin(radians(dir*ballX)));
  ballX += dir*3;
  
  if(ballX > 360 || ballX < 0) {
    dir *= -1;
  }
  
  strokeWeight(1);
}

void drawCurves() {
  stroke(0);
  line(0,200,360,200);
  stroke(255,0,0);
  for(int x = 180; x < 540; x++){
    point(x-180, 200 + r * sin(radians(x)));
  }
  for(int x = 0; x < 360; x++){
    point(x, 200 + r * sin(radians(x)));
  }
}
