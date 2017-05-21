class StatPoint
{
  int x,y, favored;
  boolean taken, favorDot, canBeCaste, isCaste, isSupernal, isFavored;
  public StatPoint(int nx, int ny, boolean nTaken)
  {
    x = nx;
    y = ny;
    taken = nTaken;
  }
  void draw()
  {
    if (taken || isCaste)
      fill(#FFFF4D);
    else if(isSupernal)
      fill(#FFFFFF);
    else if(isFavored)
      fill(#FF0000);
    else
      fill(0);
    ellipse (x, y, 25, 25);
  }
  
  boolean mousePressed()
  {
    if(overDot())
    {
      if(favorDot)
      {
        if(canBeCaste) 
        {
          if(isCaste)
          {
            isCaste = false;
            numCastePicked--;
          }
          else if(numCastePicked < maxCastePicked)
          {
            isCaste = true;
            numCastePicked++;
          }
          else if(numCastePicked == maxCastePicked)
          {
            if(isFavored)
            {
              isFavored = false;
              numFavoredPicked--;
            }
            else if(numFavoredPicked < maxFavoredPicked)
            {
              isFavored = true;
              numFavoredPicked++;
            }
          }
        }
        else if(isFavored)
        {
          isFavored = false;
          numFavoredPicked--;
        }
        else if(numFavoredPicked < maxFavoredPicked)
        {
          isFavored = true;
          numFavoredPicked++;
        }
      }
      else
      {
        if(taken)taken = false;
        else taken = true;
        return true;
      }
    }
    return false;
  }
  
  boolean overDot() 
  {
    if (mouseX >= x-(25/2) && mouseX <= x+(25/2) && mouseY >= y-(25/2) && mouseY <= y+(25/2)) return true;
    else return false;
  }
}