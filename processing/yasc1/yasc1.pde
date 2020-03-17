void setup()
{
  size(500, 500);
  
  p1 = new Player(100, 100, 60, color(0, 255, 255));
  p2 = new Player();
  
}

Player p1;
Player p2;

boolean[] keys = new boolean[2048];

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
    keys[keyCode] = false;
}

boolean checkKey(int c)
{
  return (keys[c] || keys[Character.toUpperCase(c)]);
}



void draw()
{
  background(0);
  
  p1.move();
  p2.move();
  
  p1.render();
  p2.render();
}
