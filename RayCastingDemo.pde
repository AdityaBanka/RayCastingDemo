int walls = 5 + 4;
Segment wall[] = new Segment[walls];
{
  for (int i = 0; i < walls; i++)
  {
    wall[i] = new Segment();
  }
}
int len = 400;
int hig = 400;
{
  wall[0].ini.x = 0;
  wall[0].ini.y = 0;
  wall[0].end.x = len-1;
  wall[0].end.y = 0;
  
  wall[1].ini.x = len-1;
  wall[1].ini.y = 0;
  wall[1].end.x = len-1;
  wall[1].end.y = hig-1;
  
  wall[2].ini.x = len-1;
  wall[2].ini.y = hig-1;
  wall[2].end.x = 0;
  wall[2].end.y = hig-1;
  
  wall[3].ini.x = 0;
  wall[3].ini.y = hig-1;
  wall[3].end.x = 0;
  wall[3].end.y = 0;
  
  
}

//int mag = 2203;
int mag = 566;
PVector p1 = new PVector(200, 200);
PVector clash;
PVector p5 = new PVector(0, 0);
float dist = mag;

float t = 0.0;
float u = 0.0;

void update()
{
  p1.x = mouseX;
  p1.y = mouseY;
}

void setup()
{
  size(400, 400);
  //fullScreen();
  background(0);
  fill(255);
  stroke(255); //lower the value to give a look of fading light
}

void draw()
{
  frameRate(60);
  update();  
  background(0);

  for (int i = 0; i < walls; i++)
  {
    line(wall[i].ini.x, wall[i].ini.y, wall[i].end.x, wall[i].end.y);
  }

  for (float i = 0; i < 360; i+=5) //decreace the update value to increace the number of rays.
  {
    dist = mag;
    
    int changeX = (int)(mag*cos(radians(i)));
    int changeY = (int)(mag*sin(radians(i)));
    PVector p2 = new PVector(p1.x + changeX, p1.y + changeY);
    
    for (int j = 0; j < walls; j++)
    {
      if (intersect(wall[j].ini, wall[j].end, p1, p2))
      {
        clash = new PVector();
        clash.x = wall[j].ini.x + t*(wall[j].end.x - wall[j].ini.x);
        clash.y = wall[j].ini.y + t*(wall[j].end.y - wall[j].ini.y);
        float d = PVector.dist(p1, clash);
        if(d < dist)
        {
          p5.x = clash.x;
          p5.y = clash.y;
          dist = d;
        }
      }
    }
    line(p1.x, p1.y, p5.x, p5.y);
  }
}

boolean intersect(PVector p1, PVector p2, PVector p3, PVector p4)
{
  float den1 = ((p1.x - p2.x)*(p3.y - p4.y));
  float den2 = ((p1.y - p2.y)*(p3.x - p4.x));
  float den = den1 - den2;
  if (den != 0)
  {
    float t_num1 = ((p1.x - p3.x)*(p3.y - p4.y));
    float t_num2 = ((p1.y - p3.y)*(p3.x - p4.x));
    float t_num = t_num1 - t_num2;
    t = t_num/den;
    if (t>0.0 && t<1.0)
    {
      float u_num1 = ((p1.x - p2.x)*(p1.y - p3.y));
      float u_num2 = ((p1.y - p2.y)*(p1.x - p3.x));
      float u_num = u_num1 - u_num2;
      u = -1*(u_num/den);
      if (u>0.0)
      {
        return(true);
      }
    }
  }
  return(false);
}
