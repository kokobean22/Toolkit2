class Button
{
  int x,y;
  String label;
  Page page;
  
  Button(int nx, int ny, String nLabel, Page nPage)
  {
    x = nx;
    y = ny;
    label = nLabel;
    page = nPage;
  }
  
  void draw()
  {
    fill(#748904);
    rect(x, y, 100, 50);
    fill(0);
    
    text(label, x+50, y+30);
  }
  
  boolean overButton() 
  {
    if (mouseX >= x && mouseX <= x+100 && mouseY >= y && mouseY <= y+50) return true;
    else return false;
  }
}