void setup()
{
  size(1000, 500);
  background(0);
  colorMode(HSB);
  cx = width / 2;
  cy = height /2;
}

float theta = 0;
float radius = 10;
float cx, cy;
float c = 0;
float r = -100;
float x = 0;
void draw()
{
  //float x = (cx) + sin(theta) * radius;
  float y = (cy) - cos(theta) * radius;
  
  noStroke();
  fill(c,255, 255);
  ellipse(x, y, r, r);
  
  theta += 0.1;
  radius ++;
  //r += 0.5;
  c += 0.2;
  x ++;
}
