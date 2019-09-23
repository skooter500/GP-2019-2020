float x; // assignment

char c = 'a';
String s = "Bryan";

void setup()
{
  size(500, 500);
  noCursor();
  x = 0; // assignment
  println(s);
  
  // Operators
  
  x = x + 1;
  x+=1;
  x++;
  
  //x = y +1;
  //x = y + z;
  
  x =x - 1;
  x -= 1;
  x --; // decrement
  
  x =x * 2;
  x *= 2;
  
  x = x /2;
  x /= 2;
  
  float x = 10;
  float y = 5;
  float z = -3;
  
  x += y; // Add y to x. y doesnt change
  y -= z; // Subtract z from y
  z *= 3; // Multiply z by 3
  z ++; // Add 1 to z
  x = y * 2; // Multiply y by 2
  
  y --; // subtract 1 from y
  z += x; // add x to y
  
  x += x; // add x to itself
  
  z = x - 5; //z is assigned x + 5
  y -= x; // Subtract x from y
  x = (y + 5) * (x -1);
  z --;
  println(x);
  println(y);
  println(z);
  
  
  
  
  
  
}

void draw()
{
  background(0);
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY, 50, 50);
  stroke(255);
  println(mouseY);
  line(mouseX, mouseY+25, mouseX, mouseY+100);
  println(mouseY);
  
  /*
  
  + add
  - subtract
  * multiply
  / divide
  %
  
  */
  
  
}
  
