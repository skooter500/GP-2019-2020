void setup()
{
  size(500, 500);

  tx = width / 2;
  ty = height;
  bx = tx;
  by = ty;
}

float theta;

// Turret pos
float tx;
float ty;
float tl = 50;


// Bullet pos
float bx; 
float by;


void draw()
{

  
  
  background(0);
  
  stroke(255);
  pushMatrix();
  translate(tx, ty);
  rotate(theta);
  line(0, 0, 0, - tl);
  popMatrix();
  
  if (keyPressed)
  {
    if (keyCode == LEFT)
    {
      theta -= 0.01f;
    }
    
    if (keyCode == RIGHT)
    {
      theta += 0.01f;
    }
  }
  
  float baddx = sin(theta);
  float baddy = -cos(theta);
  
  bx += baddx;
  by += baddy;
  
  ellipse(bx, by, 10, 10);
  
  if (bx < 0 || bx > width || by < 0)
  {
    bx = tx;
    by = ty;
  }
  
  
  
}
