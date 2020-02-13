void setup()
{
  size(500, 500);
  
  px = -10;
  py = height / 2;
}

float px, py;

void draw()
{
  background(0);
  noStroke();
  fill(255);
  ellipse(px, py, 10, 10);
  px += 5;
  println(px);
  if (px > width)
  {
    px = -10;
  }
  
}
