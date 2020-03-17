import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioSample as;
AudioBuffer ab;

int frameSize = 256;

void setup()
{
  //size(800, 800, P3D);
  fullScreen(P3D, SPAN);
  minim = new Minim(this);
  as = minim.loadSample("heroplanet.mp3", frameSize);
  ab = as.left;
  as.trigger();
  colorMode(HSB);
}

void keyPressed()
{
   twocubes = true;
}

boolean twocubes = false;

float angle = 0;
float smoothedBoxSize = 0;

void draw()
{
  background(0);
  
  float total = 0;
  for(int i = 0 ; i < ab.size() ; i ++)
  {
    total += abs(ab.get(i));
  }
  float average = total / (float) ab.size();
    
  lights();
  noFill();
  stroke(map(average, 0, 1, 0, 255), 255, 255);
  strokeWeight(10);
  //fill(255);
  //noStroke();
  camera(0, 0, 250, 0, 0, 0, 0, 1, 0);    
  float boxSize = 50 + (average * 300);//map(average, 0, 1, 100, 400); 
  smoothedBoxSize = lerp(smoothedBoxSize, boxSize, 0.2f);
  if (twocubes)
  {
    pushMatrix();
    translate(-200, 0, 0);
    rotateY(angle);
    rotateX(angle);
    box(smoothedBoxSize);
    popMatrix();
    pushMatrix();
    translate(200, 0, 0);
    rotateY(angle);
    rotateX(angle);
    box(smoothedBoxSize);
    popMatrix();
  }
  else
  {
    rotateY(angle);
    rotateX(angle);
    box(smoothedBoxSize);
  }
  angle += 0.01f; //map(mouseX, 0, width, 0, 0.1f);
}
