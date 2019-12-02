void setup()
{
  size(500, 500);
}

void draw()

{
  background(0);
  stroke(255);
  for(float x = 0 ; x < width ; x ++)
  {
    float y = noise(x/ 100.0f) * 50;
    line(x, height, x, height - y);
  }
}
