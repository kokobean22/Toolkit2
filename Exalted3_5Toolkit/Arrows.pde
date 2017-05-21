//KAM - 5/20/2017
//This class creates simple arrow buttons that increase or decrease a given Enum value
class Arrows
{
  boolean isLeft = false;  //For drawing left vs Right arrows (Right arrow default)
  int x;
  int y;
  int low;    //The bottom of the count
  int high;   //The top of the count; for wrapping around
  
  Arrows(String direction, int nx, int ny, int lowBounds, int hiBounds)
  {
    if(direction == "left") isLeft = true;
    x = nx;
    y = ny;
    low = lowBounds;
    high = hiBounds;
  }
  
  void draw()
  {
    fill(#748904);
    rect(x, y, 25, 30);
    fill(0);
    
    if(isLeft) drawLeft();
    else drawRight();
  }
  
  void drawRight()
  {
    fill(#edee6c);
    triangle(x+3,y+3,x+3,y+27,x+22,y+15);
    fill (0);
  }
  
  void drawLeft()
  {
    fill(#edee6c);
    triangle(x+3,y+15,x+22,y+3,x+22,y+27);
    fill (0);
  }
  
  boolean overButton()
  {
    if (mouseX >= x && mouseX <= x+25 && mouseY >= y && mouseY <= y+30) return true;
    else return false;
  }
}