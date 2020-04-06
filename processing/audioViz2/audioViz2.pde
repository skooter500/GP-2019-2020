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

void draw()
{
  background(0);
  float halfHeight = height / 2;
  /*for(int i = 0 ; i < ai.bufferSize() ; i ++)
  {
    stroke((i / (float) ai.bufferSize()) * 255, 255, 255);
    line(i, halfHeight, i, halfHeight + ai.left.get(i) * halfHeight);
  }
  */
  
  strokeWeight(5);
  
  float theta = TWO_PI / (float) ai.bufferSize();
  /*
  for(int i = 0 ; i < ai.bufferSize() ; i ++)
  {
    float angle = theta * i;
    float x = halfHeight + sin(angle) * halfHeight * ai.left.get(i);
    float y = halfHeight - cos(angle) * halfHeight * ai.left.get(i);
    stroke((i / (float) ai.bufferSize()) * 255, 255, 255);
    line(halfHeight, halfHeight, x, y);
   }
   */
   for(int i = 0; i < ai.bufferSize(); i++)
  {
    stroke((i / (float) ai.bufferSize()) * 255, 255, 255);
    line(cos(i*TWO_PI/ (float) ai.bufferSize())*100 + halfHeight, sin(i*TWO_PI/ (float) ai.bufferSize())*100 + 100*ai.left.get(i) + halfHeight, cos(i*TWO_PI/ (float) ai.bufferSize())  *100 + halfHeight, sin(i*TWO_PI/ (float) ai.bufferSize()) *100 + 100* ai.left.get(i) + halfHeight);
  }
  
  fft.window(FFT.HAMMING);
  fft.forward(ai.left);
  
  int maxIndex = 0;
  for(int i = 0 ; i < fft.specSize() ; i ++)
  {
    stroke((i / (float) ai.bufferSize()) * 255, 255, 255);    
    println(fft.getBand(i));
    line(i, 0, i, fft.getBand(i) * 10);
    if (fft.getBand(i) > fft.getBand(maxIndex))
    {
      maxIndex = i;
    }
  }
  
  float freq = fft.indexToFreq(maxIndex);
  
  textSize(20);
  fill(255);
  text(freq, 100, 100);
  
  float binWidth = 44100 / 1024;
  
  text(maxIndex * binWidth, 100, 200);
  
  
  /*
  for(int i = 0; i < fft.specSize(); i++)
  {
    stroke((i / (float) fft.specSize()) * 255, 255, 255);
    line(cos(i*TWO_PI/ (float) fft.specSize())*100 + halfHeight, sin(i*TWO_PI/ (float) fft.specSize())*100 + 100*fft.getBand(i) + halfHeight, cos(i*TWO_PI/ (float) fft.specSize())  *100 + halfHeight, sin(i*TWO_PI/ (float) fft.specSize()) *100 + 100* fft.getBand(i) + halfHeight);
  }
  */
  
  /*
  for(int i = 0 ; i < fft.specSize() ; i ++)
  {
    float angle = theta * i;
    float x = halfHeight + sin(angle) * halfHeight * fft.getBand(i);
    float y = halfHeight - cos(angle) * halfHeight * fft.getBand(i);
    stroke((i / (float) ai.bufferSize()) * 255, 255, 255);
    line(halfHeight, halfHeight, x, y);
   }
    */
  
  
  
  
}
