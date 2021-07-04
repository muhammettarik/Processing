class Petal
{
  int size, yaprakX, yaprakY, yaprakSayisi, speed;

  public Petal(int size, int yaprakX, int yaprakY, int yaprakSayisi)
  {
    this.speed = 0;
    this.size = size;
    this.yaprakSayisi = yaprakSayisi;
    this.yaprakX = yaprakX;
    this.yaprakY = yaprakY;
  }


  void drawPetal(boolean ispolenlendi)
  {
    float angle = radians(360/yaprakSayisi);
    
    if (!ispolenlendi)
    {
      for (int i = 0; i < yaprakSayisi; i++) {
        ellipse(0, yaprakY/2 + size/2, yaprakX, yaprakY);
        rotate(angle);
      }
    } 
    
    else 
    {
      speed -= (int)random(2, 4);
      if (speed < -200) 
      {
        //disappear
      } 
      else
      {
        for (int i = 0; i < yaprakSayisi; i++) {
          ellipse(speed, yaprakY/2 + size/2 + speed, yaprakX, yaprakY);
          rotate(angle);
        }
      }
    }
  }
}
