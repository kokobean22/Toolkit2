class StatPoint
{
  int x,y;
  boolean taken;
  public StatPoint(int nx, int ny, boolean nTaken)
  {
    x = nx;
    y = ny;
    taken = nTaken;
  }
  void draw()
  {
    if (taken)
      fill(#FFFF4D);
    else
      fill(0);
    ellipse (x, y, 25, 25);
  }
  
  boolean mousePressed()
  {
    if(overDot())
    {
      if(taken)taken = false;
      else taken = true;
      return true;
    }
    return false;
  }
  
  boolean overDot() 
  {
    if (mouseX >= x-(25/2) && mouseX <= x+(25/2) && mouseY >= y-(25/2) && mouseY <= y+(25/2)) return true;
    else return false;
  }
}