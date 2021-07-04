int count = 25;  // The higher this variable is, the less spirals are formed. 
float R = 400;   // Rest position
float ps = R;    // Position
float vs = 0.0;  // Velocity
float as = 0;    // Acceleration
float f = 0;     // Force

void setup() {
  size(500, 500, P3D);
  frameRate(30);
}

void draw() {
  background(255);
  translate(0, 0, -100);
  updateSpring();
  drawSpring();
}

void mousePressed() {
  
  ps = 500;
  
}

void drawSpring() {
  for (float i = 0; i < ps; i+=0.5) {

    point(250 + (10 * sin(radians(i*ps/count))), i+100, 250 + (10 * cos(radians(i*ps/count))));
  }
  
  // print("Position :" + ps);
}

void updateSpring() {

  f = -0.2 * (ps - R);    // f=-ky - Force
  as = f / 0.8;           // f=ma - Acceleration
  vs = 0.9 * (vs + as);   // New velocity. I'm multiplying it by 0.9 because it should stop after a while.
  ps = constrain(ps + vs, 300, 500);  // Updated position
}

// https://processing.org/examples/spring.html
