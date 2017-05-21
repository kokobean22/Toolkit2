class TextBox
{
  String text, label;
  int x, y, textWidth;
  Boolean active;
  
  TextBox(int nx, int ny, String nLabel)
  {
    x = nx;
    y = ny;
    label = nLabel;
    text = nLabel;
    textWidth = text.length()*10;
    active = false;
  }
  
  void draw()
  {
    textWidth = text.length()*10;
    if(active)
      fill(#FFFFFF);
    else
      fill(#748904);
    rect(x, y, textWidth, 30);
    fill(0);
    
    text(text, x+textWidth/2, y+20);
    text(label, x+textWidth/2, y-5);
  }
  
  void keyPressed() 
  {
    if(key == ENTER)
    { 
      active = false;
      if(text == "") text = label;
      return;
    }
    if(key == BACKSPACE) text = text.substring(0, text.length()-1);
     else text+=key;
  }
  
  void swapActive()
  {
    if(active) active = false;
    else
    { active = true;
      if(text == label)
      {
        text = "";
      }
    }
  }
  
  boolean overBox() 
  {
    if (mouseX >= x && mouseX <= x+text.length()*10 && mouseY >= y && mouseY <= y+30) return true;
    else return false;
  }
}