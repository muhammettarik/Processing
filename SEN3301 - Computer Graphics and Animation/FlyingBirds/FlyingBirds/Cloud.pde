class Cloud
{
  // Cloud variables
  float speed;
  int x, y, z;

  // Constructor
  public Cloud()
  {
    speed = random(10, 12);
    y = (int)random(-2000, -1750);
    x = (int)random(-3000, 1750);
    z = (int)random(-3000, 3000);
  }

  // Draw function
  void drawCloud()
  {

    push();

    noStroke();
    fill(125);
    translate(x, y, z);
    sphere(150);

    pop();

    if (frameCount < 7200) x += speed;

    if (x >= 3000) x=-3000;
  }
}
