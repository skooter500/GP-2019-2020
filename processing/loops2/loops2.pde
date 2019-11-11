void setup()
{
  size(500, 500);
  colorMode(HSB);
}

void draw()
{
  background(0);
  float y = 100;
  
  while(y <= height - 100)
  {
    line(0, y, width, y);
    y += 20;
  }
  
  for(float yy = 100 ; yy <= height - 100 ; yy += 20)
  {
    line(0, yy, width, yy);
  }
  
  y = 100;
  do
  {
    line(0, y, width, y);
    y += 20;
  }
  while(y <= height - 100);
  
  
  int numCircles = mouseX / 10;
  float w = width / (float) numCircles;
  int i =0;
  while(i < numCircles)
  {
    float x = (w / 2) + (w * i);
    ellipse(x, height / 2, w, w);
    i ++;
  }
  
  float colorgap = 255 / (float) numCircles;
  for (int j = 0 ; j < numCircles ; j ++)
  {
    noStroke();
    fill(colorgap * j, 255, 255);
    float x = (w / 2) + (w * j);
    ellipse(x, height / 2 + 200, w, w);    
  }
  
  
  
  
  
  
  
  
}
