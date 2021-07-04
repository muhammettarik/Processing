class Bird
{
  float bx, by, bz, speed;
  PImage imgWing;
  boolean iscollided;
  
  // Smoke particles when collided
  ArrayList<Smoke> particles = new ArrayList<Smoke>();

  public Bird() 
  {
    iscollided = false;
    speed = random(20, 30);
    bx = random(-2500, 2500);
    by = random(-1000, -200);
    bz = random(-2500, 2500);
    imgWing = loadImage("wing.gif");

    for (int i = 0; i < 10; i++)
    {
      particles.add(new Smoke());
    }
  }

  void drawBird()
  {
    if (!iscollided) {
      pushMatrix();

      pushMatrix();
      if (frameCount < 7200) rotateZ(radians(angle));
      angle += angleDir;
      if (angle > 45 || angle < -45)
        angleDir *= -1;
      drawOneWing();
      popMatrix();
      pushMatrix();
      scale(-1, 1, 1);
      if (frameCount < 7200) rotateZ(radians(angle));
      angle += angleDir;
      if (angle > 45 || angle < -45)
        angleDir *= -1;
      drawOneWing();
      popMatrix();
      popMatrix();

      // Bird screen limitations
      if (frameCount < 7200) {
        // X limitations
        if (bx + speed > 3000) 
          bx += random(-speed, 0);

        else if (bx - speed < -3000) 
          bx += random(0, speed);

        else 
        bx += random(-speed, speed);

        // Z limitations
        if (bz + speed > 3000) 
          bz += random(-speed, 0);

        else if (bz - speed < -3000) 
          bz += random(0, speed);

        else 
        bz += random(-speed, speed);

        // Y limitations
        if (by + speed > 0) 
          by += random(-speed, 0);

        else if (by - speed < -1500) 
          by += random(0, speed);

        else 
        by += random(-speed, speed);
      }
      
      // This happens when the bird is collided
    } else {
      scale(0.05);
      for (int i = 0; i < 8; i++)
      {
        particles.get(i).drawSmoke();
      }
    }
  }
  int angle = 0;
  int angleDir = 1;
  void drawOneWing()
  {
    beginShape(QUADS);
    texture(imgWing);
    vertex(-1, 0, 0, 0, 0);
    vertex(0, 0, 0, 202, 0);
    vertex(0, 0, 1, imgWing.width, imgWing.height);
    vertex(-1, 0, 1, 0, 183);
    endShape();
  }
}
