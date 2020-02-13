import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup()
{
  //size(500, 500);
  fullScreen();

  minim = new Minim(this);

  ai = minim.loadSample("Etherwood - 01 - Begin By Letting Go.mp3", frameSize);
  ai.trigger();
  fft = new FFT(frameSize, sampleRate);
  colorMode(HSB);  

  bands = new float[(int) log2(frameSize)];
  lerpedBands = new float[bands.length];
}

Minim minim;
FFT fft; // Fast fourier transform
AudioSample ai;
int frameSize = 512;

int sampleRate = 44100;

float[] bands;
float[] lerpedBands;

float log2(float f) 
{
  return log(f)/log(2.0f);
}

void getFrequencyBands()
{        
  for (int i = 0; i < bands.length; i++)
  {
    int start = (int)pow(2, i) - 1;
    int w = (int)pow(2, i);
    int end = start + w;
    float average = 0;
    for (int j = start; j < end; j++)
    {
      average += fft.getBand(j) * (j + 1);
    }
    average /= (float) w;
    bands[i] = average * 5.0f;
    lerpedBands[i] = lerp(lerpedBands[i], bands[i], 0.05f);
  }
}


void draw()
{
  background(0);
  
  fft.window(FFT.HAMMING);
  fft.forward(ai.left);

  getFrequencyBands();
  
  float gap = width / (float) bands.length;
  noStroke();
  float colorGap = 255 / (float) bands.length;
  for(int i = 0 ; i < bands.length ; i ++)
  {
    fill(i * colorGap, 255, 255);
    rect(i * gap, height, gap,-lerpedBands[i]); 
  }
}
