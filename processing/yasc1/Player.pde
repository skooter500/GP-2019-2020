class Player
{
  // Field of the Player 
  float x, y, w, phw;
  color c;
  
  float theta;
  
  // Constructor
  // Same name as the class
  // No return type, not even void
  // You can have several so long as they all take different parameters
  Player(float x, float y, float w, color c)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.c = c;
    phw = w / 2;    
  }
  
  Player()
  {
    this(width / 2, height / 2, 100, color(255)); // Constructor chaining
  }
    
  
  // Methods of the Player
  void render()
  {
    stroke(255);
    strokeWeight(2);
    stroke(c);
    pushMatrix();
    translate(x, y); // Moves the origin
    rotate(theta); // Rotates around the origin
    line(- phw, phw, 0, - phw);
    line(0,  -phw, phw, phw);
    line(phw, phw, 0, 0);
    line(0, 0, - phw, phw);
    popMatrix();
  }

  void move()
  {
    if (checkKey(LEFT))
    {
      theta -= 0.1f;
    }

    if (checkKey(RIGHT))
    {
      theta += 0.1f;
    }
    if (checkKey(UP))
    {
      y --;
    }
    if (checkKey(DOWN))
    {
      y ++;
    }
  }
}
