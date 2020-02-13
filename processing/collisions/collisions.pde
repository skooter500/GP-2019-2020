void setup()
{
  size(500, 500);
  
  boxX = 100;
  boxY = 100;
  boxW = 100;
  boxH = 50;
  
  noCursor();
}

float x, y;

float boxX, boxY, boxW, boxH;

void draw()
{
  background(0);
  
  noStroke();
  fill(0, 0, 255);
  rect(boxX, boxY, boxW, boxH);
  
  boxX ++;
  if (boxX > width)
  {
    boxX = -boxW;
  }
  
  x = mouseX;
  y = mouseY;
  
  fill(255, 0, 0);
  ellipse(x, y, 10, 10);
  
  
  // Check for collisions
  // Check the x and y of the ellipse against the bounds of the rectangle
  
  if (x > boxX && x < boxX + boxW && y > boxY && y < boxY + boxH)
  {
    fill(255);
    textSize(16);
    text("Collides!", 10, 50);
  }
  
  
  
}
