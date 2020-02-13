void setup()
{
  size(500, 500);
}

float theta = 0;

void draw()
{
  background(255);
  pushMatrix();
  translate(50, 50);
  rotate(theta);
  rect(0, 0, 100, 100);
  popMatrix();
  
  
  pushMatrix();
  translate(50, 50);
  ellipse(0, 0, 60, 60);
  popMatrix();
  
  noFill();
  ellipse(0, 0, 100, 100);
  
  theta += 0.1;
}
