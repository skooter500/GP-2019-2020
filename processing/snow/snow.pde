void setup()
{
  size(1000, 500);
  setupSnow();
}

void setupSnow()
{
  for(int i  = 0 ; i < sx.length ; i ++)
  {
    setupSnowflake(i);
  }
}

void setupSnowflake(int i)
{
  sx[i] = random(0, width);
  sy[i] = random(-height, 0);
  sspeed[i] = random(1, 5);
  ssize[i] = random(1, 10);
}

void updateSnow()
{
  for(int i  = 0 ; i < sx.length ; i ++)
  {
    sy[i] += sspeed[i];
    sx[i] = sx[i] + map(noise(i + sy[i] / 100), 0, 1, -5, 5);
    if (sy[i] > height)
    {
      setupSnowflake(i);
    }
  }
}

void drawSnow()
{
  for(int i  = 0 ; i < sx.length ; i ++)
  {
    noStroke();
    fill(255);
    ellipse(sx[i], sy[i], ssize[i], ssize[i]);
  }
}

float[] sx = new float[100];
float[] sy = new float[100];
float[] sspeed = new float[100];
float[] ssize = new float[100];

void draw()
{
  background(0);
  updateSnow();
  drawSnow();
  
}
