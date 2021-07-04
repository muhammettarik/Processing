class Polen
{
  int x, y, speed;

  public Polen()
  {
    x = 0;
    y = 0;
    
    assignSpeed(3);
  }
  
  void assignSpeed(int s)
  {
    speed = s;
  }

  void drawPolen()
  {
    fill(125);
    ellipse(x, y, 3, 3);   
    
    x += (int)random(-speed, speed);
    y += (int)random(-speed, speed);
  }
}
