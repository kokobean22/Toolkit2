class StatLine
{
  StatPoint[] dots;
  String name;
  int x, y, numTaken, minDots, maxDots = 0;
  Type type;
  Boolean potentialCaste, caste, favored = false;
  StatLine(int nx, int ny, Type nType, String nName, int nMinDots)
  {
    x = nx; y = ny;
    type = nType;
    minDots = nMinDots;
    dots = new StatPoint[10];
    name = nName;
    if(type == Type.WILLPOWER) maxDots = 10;
    else if(essence < 5) maxDots = 5;
    else maxDots= essence;
    for(int i = 0; i < 10; i++)
    {
      if (i < minDots) dots[i] = new StatPoint(x + i*27, y, true);
      else dots[i]= new StatPoint(x + i*27, y, false);
      if (dots[i].taken) numTaken++;
    }    
  }
  void mousePressed()
  {
    if(type != Type.ESSENCE)
    {
      int dotClicked = -1;
      for(int i = minDots; i < 10; i++)
      {
        if(dots[i].mousePressed())
        {
          dotClicked = i;
          break;
        }
      }
      if(dotClicked != -1 && dotClicked <= maxDots)
      {
        if(!dots[dotClicked].taken)
        {
           for(int i = dotClicked; i < 10; i++)
           {
             dots[i].taken = false; 
             numTaken = dotClicked;
           }
        }
        else
        {
          for(int i = 0; i < dotClicked +1; i++)
          {
             dots[i].taken = true; 
             numTaken = dotClicked +1;
          }
        }
      }
    }
  }
  void draw()
  {
    fill(0);
    textSize(15);
    text(name, x - 125, y);
    text(numTaken, x + 260, y);
    for(int i = 0; i < maxDots; i++)
    {
      dots[i].draw();
    }
  }
  
  void UpdateMaxDots()
  {
    if(type == Type.WILLPOWER) maxDots = 10;
    else if(essence < 5) maxDots = 5;
    else maxDots= essence;
  }
}