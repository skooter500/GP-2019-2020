void setup()
{
  size(500, 500);
  
  x = width;
  w = 100;
  y = height /2;
}

float x, y, w;

float bx, by;

void draw()
{
  background(0);
  pushMatrix();
  translate(x, y);
  ellipse(0, 0, w, w);
  popMatrix();
  x --;
  
  
  bx = mouseX;
  by = mouseY;
  
  ellipse(bx, by, 5, 5);
  
  if (dist(bx, by, x, y) <  (w/2))
  {
    textSize(100);
    fill(255);
    text("Collides!!!", 20, 50);
  }
  
  
}
