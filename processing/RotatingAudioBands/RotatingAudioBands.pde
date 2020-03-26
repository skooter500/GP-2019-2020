import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer ap;
AudioBuffer ab;
FFT fft;

int frameSize = 512;

float log2(float f) {
  return log(f) / log(2.0f);
}

void setup()
{
  size(800, 800, P3D);
  //fullScreen(P3D, SPAN);
  minim = new Minim(this);
  ap = minim.loadFile("heroplanet.mp3", frameSize);

  ab = ap.left;
  ap.cue(0);
  ap.play();

  fft = new FFT(frameSize, 44100);

  bands = new float[(int) log2(frameSize)];
  smoothedBands = new float[bands.length];
  colorMode(HSB);
}

float angle = 0;
float smoothedBoxSize = 0;
float[] bands;
float[] smoothedBands;


void calculateFrequencyBands() {
  for (int i = 0; i < bands.length; i++) {
    int start = (int) pow(2, i) - 1;
    int w = (int) pow(2, i);
    int end = start + w;
    float average = 0;
    for (int j = start; j < end; j++) {
      average += fft.getBand(j) * (j + 1);
    }
    average /= (float) w;
    bands[i] = average * 5.0f;
    smoothedBands[i] = lerp(smoothedBands[i], bands[i], 0.05f);
  }
}

float rot = 0;

void draw()
{
  background(0);

  float total = 0;
  for (int i = 0; i < ab.size(); i ++)
  {
    total += abs(ab.get(i));
  }
  float average = total / (float) ab.size();

  fft.window(FFT.HAMMING);
  fft.forward(ab);
  calculateFrequencyBands();
  float boxW = width / (float) bands.length;
  float radius = 200;
  
  rot += average / 8.0f;
  
  strokeWeight(2);
  pushMatrix();
  camera(0, -200, 500, 0, 0, 0, 0, 1, 0);
  rotateY(rot);
  for(int i = 0 ; i < bands.length ; i ++)
  {
     noFill();
     stroke(map(i, 0, bands.length, 0, 255), 255, 255);
     
     float theta = map(i, 0, bands.length, 0, TWO_PI);
     
     float x = sin(theta) * radius;
     float z = - cos(theta) * radius;
     
     float h = smoothedBands[i] * 0.5f;
     pushMatrix();
     translate(x, -h / 2, z);
     rotateY(theta);     
     box(50, h, 50);
     popMatrix();     
  } 
  popMatrix();
}
