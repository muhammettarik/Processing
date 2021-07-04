class Flower
{
  int x, y;
  int size;
  int r, g, b;
  int yaprakSayisi, yaprakX, yaprakY, polenSayisi;
  boolean polenlendi;
  ArrayList<Polen> polens = new ArrayList<Polen>();
  Petal p;

  public Flower(int polenCount, int x, int y)
  {
    this.polenSayisi = polenCount;
    this.x = x;
    this.y = y;
    polenlendi = false;
    
    r = (int)random(155, 255);
    g = (int)random(0, 155);
    b = (int)random(0, 155);
    size = (int)random(30, 45);
    yaprakX = (int)random(13, 17);
    yaprakY = (int)random(25, 50);
    yaprakSayisi = (int)random(7, 10);

    p = new Petal(size, yaprakX, yaprakY, yaprakSayisi);

    push();
      for (int i = 0; i < polenSayisi; i++)
      {
        polens.add(new Polen());
      }
    pop();
  }

  void drawFlower()
  {
    pushMatrix();
    
      translate(x, y);
      for (int i = 0; i < polenSayisi; i++)
      {
        polens.get(i).drawPolen();
      }
      if (polenlendi) 
      {
        fill(125);
      }
      else 
      {
        fill(r,g,b);
      }
      p.drawPetal(polenlendi);
      ellipse(0, 0, size, size);

    popMatrix();
  }
}
