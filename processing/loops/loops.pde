void setup()
{
  size(500, 500);
  cx = width / 2;
  cy = height / 2;
}

float cx, cy;

void draw()
{
  /*
  // Without using a loop
  line(100, 50, 150, 50);
  line(100, 70, 150, 70);
  line(100, 90, 150, 90);
  line(100, 110, 150, 110);
  line(100, 130, 150, 130);
  
  // While loop
  float y = 50;
  while(y <= 130)
  {
    line(170, y, 230, y);
    y += 20;
  }
  
  int line = 0;
  int linecount = 5;
  y = 50;
  while(line < linecount)
  {
    line(240, y, 290, y);    
    y += 20;
    line++;
  }
  
  int numlines = 10;
  line = 0;
  while(line < numlines)
  {
    float gap = width / numlines;
    line(gap * line, 0, gap * line, height);   
    line ++;
  }
  
  // For loop
  float gap = height / 10;
  for(int i = 0 ; i < 10 ; i++)
  {
    line(0, i * gap, width, i * gap);
  }
  */
  
  /*
  int numlines = 10;
  float gap = width / (float) numlines;
  for(int i = 0 ; i <= numlines ; i ++)
  {
    line(i * gap, 0, width - (i * gap), height);
  }
  
  for(int i = 0 ; i <= numlines ; i ++)
  {
    line(0, i * gap, width , height - (i * gap));
  }
  
  int numcircles = mouseX / 10;
  float w = width / (float) numcircles;
  float r = w / 2.0f;
  for(int i = 0 ; i < numcircles ; i ++)
  {
    ellipse(r + (i * w) , height / 2, w, w);
  }
  */
  int numCircles = mouseX / 10;
  float gap = TWO_PI / (float) numCircles;
  float radius = mouseY / 2;
  fill(255, 0, 0);
  noStroke();
  for(int i = 0 ; i < numCircles ; i ++)
  {
    float x = cx + sin(gap * i) * radius;
    float y = cy - cos(gap * i) * radius;
    ellipse(x, y, 50, 50);
  }
  
  
  
  
  
  
  
  
  
}
