void setup()
{
  size(500, 500);
  
  println(rainfall);
  
  rainfall[2] = 56;
  println(rainfall[0]);
  
  for(int i = 0 ; i < rainfall.length ; i ++)
  {
    println(i + "-" + rainfall[i]);
  }
  
  float total = 0;
  for(int i = 0 ; i < rainfall.length ; i ++)
  {
    total += rainfall[i];
  }
  
  println("Total: " + total);
  
  float average = total / (float) rainfall.length;
  
  println(average);
  
  int minMonth = -1;
  float minRainfall = 1000;
  for(int i = 0 ; i < rainfall.length ; i ++)
  {
    if (rainfall[i] < minRainfall)
    {
      minRainfall = rainfall[i];
      minMonth = i;
    }
  }
  
  println("Lowest rainfall was in: " + months[minMonth] + " was " + rainfall[minMonth]);
  
  int maxMonth = -1;
  float maxRainfall = -1000;
  for(int i = 0 ; i < rainfall.length ; i ++)
  {
    if (rainfall[i] > maxRainfall)
    {
      maxRainfall = rainfall[i];
      maxMonth = i;
    }
  }
  
  println("Highest rainfall was in: " + months[minMonth] + " was " + rainfall[minMonth]);
  
  
  
  
  
  
  
  
}

float[] rainfall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {"jan", "feb", "mar", "apr" , "may", "june", "july"
                ,"august", "september", "october", "november", "december" }; 

void draw()
{
  
}
