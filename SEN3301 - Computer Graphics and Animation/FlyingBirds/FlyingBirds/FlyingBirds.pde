PImage imgSea;

void setup()
{
  fullScreen(P3D);
  frameRate(60);
  noStroke();
  imgSea = loadImage("sea.jpg");

  camZ = (height/2) / tan((PI*60.0)/360.0);

  // Birds and Clouds 
  for (int i = 0; i < birdCount; i++)
  {
    birds.add(new Bird());
  }
  
  for (int i = 0; i < 20; i++)
  {
    clouds.add(new Cloud());
  }
}

float camZ = 0;
float angle = 180;
int birdCount = 5;

// Birds and Clouds
ArrayList<Cloud> clouds = new ArrayList<Cloud>();
ArrayList<Bird> birds = new ArrayList<Bird>();

void draw()
{
  
  // Camera controls
  camera(0, -400, camZ, 
    0, -1000, -2000, 
    0, 1, 0);

  if (keyPressed)
  {
    if (keyCode == UP)
      camZ -= 35;
    if (keyCode == DOWN)
      camZ += 35;
  }

  rotateX(rotX + distY);
  rotateY(rotY + distX);

  background(255);

  // Bird and Cloud draw function call
  for (int i = 0; i < birdCount; i++)
  {
    pushMatrix();
    translate(birds.get(i).bx, birds.get(i).by, birds.get(i).bz);
    scale(100);
    birds.get(i).drawBird();
    popMatrix();
  }

  for (int i = 0; i < 20; i++)
  {
    clouds.get(i).drawCloud();
  }

  // Sun and Sea
  push();
  drawSun();
  pop();

  pushMatrix();
  rotateX(radians(270));
  scale(3000, 3000, 1);
  drawSea();
  popMatrix();

  // This function checks if any birds collided with each other
  CollideChecker();
}

// Camera controls
float rotX = 0, rotY = 0;
float lastX, lastY;
float distX, distY;

void mousePressed()
{
  lastX = mouseX;
  lastY = mouseY;
}

void mouseDragged()
{
  distX = radians(mouseX - lastX);
  distY = radians(lastY - mouseY);
}

void mouseReleased()
{
  rotX += distY;
  rotY += distX;
  distX = distY = 0;
}

// Drawing sea with vertices
void drawSea() 
{
  int w = imgSea.width;
  int h = imgSea.height;
  beginShape(QUADS);
  texture(imgSea);

  vertex(1, -1, 1, w, 0); //upper right corner
  vertex(1, 1, 1, w, h); //bottom right corner
  vertex(-1, 1, 1, 0, h); //bottom left corner
  vertex(-1, -1, 1, 0, 0); //upper left corner

  endShape();
}

// Drawing sun and lights
void drawSun()
{
  rotateZ(radians(angle));
  if (frameCount < 7200) angle += 0.025;
  translate(3000, 0, 0);

  spotLight(255, 255, 255, 2000, 0, 0, -1, 0, 0, PI/2, 1);
  
  translate(401, 0, 0);

  pointLight(250, 250, 250, -3500, 0, 0);

  fill(255, 255, 0);
  sphere(400);
}

// Collide checker function with 2 nested loops
void CollideChecker() 
{

  for (int i = 0; i < birdCount; i++)
  {
    for (int j = 0; j < birdCount; j++)
    {
      if (i == j) {
        // Bird cannot collide with itself.
      } 
      else {
        // If birds are too close we assume that they are collided.
        if (abs(birds.get(i).bx - birds.get(j).bx) < 100 &&
          abs(birds.get(i).by - birds.get(j).by) < 100 &&
          abs(birds.get(i).bz - birds.get(j).bz) < 100)
        {
          birds.get(i).iscollided = true;
          birds.get(j).iscollided = true;
        }
      }
    }
  }
}

// https://previews.123rf.com/images/tonobalaguer/tonobalaguer1503/tonobalaguer150300328/37676390-tropical-sea-water-texture-reflections-like-paradise-summer-vacation.jpg
