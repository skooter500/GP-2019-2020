import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput ai;
FFT fft;

void setup()
{
  size(1024, 1024);
  minim = new Minim(this);
  ai = minim.getLineIn(Minim.MONO, width, 44100, 16);
  
  fft = new FFT(width, 44100);
  
  colorMode(HSB);  
}

float y = 250; 
float lerpedY = 250;
float lerpedW = 0;
void draw()
{
  background(0);
  float halfHeight = height / 2;
  
  float sum = 0;
  
  for(int i = 0 ; i < ai.bufferSize() ; i ++)
  {
    stroke((i / (float) ai.bufferSize()) * 255, 255, 255);
    //line(i, halfHeight, i, halfHeight + ai.left.get(i) * halfHeight);
    sum += abs(ai.left.get(i));
  }
  
  float average = sum/(float) ai.bufferSize();
  
  float w = average * 1000;
  lerpedW = lerp(lerpedW, w, 0.1f);
  ellipse(300, height / 2, w, w);
  ellipse(800, height / 2, lerpedW, lerpedW);
  
  y += random(-20, 20);
  lerpedY = lerp(lerpedY, y, 0.001);
  
  fft.window(FFT.HAMMING);
  fft.forward(ai.left);
  
  stroke(255);
  int maxBin = 0;
  for(int i = 0 ; i < fft.specSize() ; i ++)
  {
    line(i, 0, i, fft.getBand(i) * 20);
  }
  
  text("Frequency: " + fft.indexToFreq(maxBin), 50, 50);
  
  //ellipse(250, y, 50, 50);
  //ellipse(300, lerpedY, 50, 50);
  

}
