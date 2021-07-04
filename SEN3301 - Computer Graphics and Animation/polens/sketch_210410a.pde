void setup() 
{
  size(600, 600);
  
  for (int i = 0; i < 5; i++)
  {
    for (int j = 0; j < 4; j++)
    {
      flowers.add(new Flower(pCount, (i * 120) + 50, (j * 120) + 50));
    }
  }
}

ArrayList<Flower> flowers = new ArrayList<Flower>();
int pCount = 30; //pCount = polen count
int count = 20;

void draw()
{
  background(255);

  for (int i = 0; i < count; i++)
  {
    flowers.get(i).drawFlower();
  }

  polenBulucu();
}

void polenBulucu() 
{

  for (int i = 0; i < count; i++)
  {
    for (int j = 0; j < count; j++)
    {
      if (i == j) 
      {
        //nothing
      } else
      {
        for (int p = 0; p < pCount; p++)
        {
          if (flowers.get(i).polens.get(p).x + flowers.get(i).x< (flowers.get(j).x) + (flowers.get(j).size)/2
            && flowers.get(i).polens.get(p).x + flowers.get(i).x > (flowers.get(j).x) - (flowers.get(j).size)/2 
            && flowers.get(i).polens.get(p).y + flowers.get(i).y< (flowers.get(j).y) + (flowers.get(j).size)/2
            && flowers.get(i).polens.get(p).y + flowers.get(i).y> (flowers.get(j).y) - (flowers.get(j).size)/2)
          {
            flowers.get(j).polenlendi = true;
          }
        }
      }
    }
  }
}
