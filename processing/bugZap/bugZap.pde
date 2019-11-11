void setup()
{
  size(800, 800);
  
  playerX = width / 2;
  playerY = height - 50;
  
  rectMode(CENTER);
  
  bugX = random(halfBugSize, width - halfBugSize); 
  bugY = 50;
}

float playerX, playerY;
float bugX, bugY;
float bugSize = 50;
float halfBugSize = bugSize / 2;
float playerSize = 50;
float halfPlayerSize = playerSize / 2;
int score;

void drawBug(float x, float y, float w, float hw)
{
  triangle(x - hw, y + hw, x, y - hw, x + hw, y + hw);
  line(x - 5, y - 5, x - 5, y + 5);
  line(x + 5, y - 5, x + 5, y + 5);
  line(x, y-2, x, y +2);
  line(x -10, y + 10, x + 10, y + 10);
  line(x - 10, y + hw, x - 10, y + hw + 20);
  line(x + 10, y + hw, x + 10, y + hw + 20);
}

void drawPlayer(float x, float y, float w, float hw)
{
  rect(x,y, w, w);
  line(x, y - hw, x, y - 50);
}

void movePlayer()
{
  if (keyPressed)
  {
    if ((key == 'a' || keyCode == LEFT) && playerX > halfPlayerSize)
    {
      playerX -= speed;
    }
    if ((key == 'd' || keyCode == RIGHT) && playerX < width - halfPlayerSize)
    {
      playerX += speed;
    }       
  }
}

void shooting()
{
  if (keyPressed && (keyCode == UP || key == ' ')) 
  {
    line(playerX, playerY - halfPlayerSize, playerX, 0); 
    
    if (playerX > bugX - halfBugSize && playerX < bugX + halfBugSize)
    {
      score ++;
      bugX = random(halfBugSize, width - halfBugSize); 
      bugY = 50;
    }
    
  }  
}

int gameMode= 1;
float speed = 5;

void draw()
{
  background(0);
  strokeWeight(5);
  if (gameMode == 1)
  {
    noFill();
    stroke(255);
    drawBug(bugX, bugY, bugSize, halfBugSize);
    drawBug(100, 100, 90, 45);
    drawBug(200, 200, 50, 25);
    
    drawPlayer(playerX, playerY, playerSize, halfPlayerSize);
    movePlayer();
    shooting();
    textSize(24);
    text("Score: " + score, 10, 20);
    
    if (frameCount % 20 == 0)
    {
    
       bugY += 5;
      bugX += random(-20, 20);
    }
    
    
  }
  else if (gameMode == 2)
  {
    text("Game Over!", 100, 100);
  }
}
