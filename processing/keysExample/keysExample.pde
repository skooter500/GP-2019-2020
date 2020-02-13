// Press the a, b and LEFT keys to print some text
// Press space to fire


void setup()
{
  size(1000, 1000);
  
  bx = width / 2;
  by = height;
  
}

boolean[] keys = new boolean[1024];

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean shooting;
float bx, by;

void draw()
{
  background(0);
  stroke(255);
  if (checkKey('a'))
  {
    text("a key pressed", 10, 50);
  }
  if (checkKey('b'))
  {
    text("b key pressed", 10, 70);
  }
  
  if (checkKey(LEFT))
  {
    text("LEFT key pressed", 10, 90);
  }
  
  // draw the turret
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(width/2, height, 20, 50);
  
  if (checkKey(' '))
  {
    shooting = true;
  }
  
  if (shooting)
  {
    rect(bx, by, 20, 20);
    by -= 3;
    if (by < 0)
    {
      shooting = false;
      by = height;
    }
  }
  
}
