class Ball
{
  float xpos;
  float ypos;
  float diam;
  
  float gravity=1;
  
  Ball(float x,float y)
  {
    xpos=x;
    ypos=y;
    diam=20;
  }
  Ball(float x,float y,float d)
  {
    xpos=x;
    ypos=y;
    diam=d;
  }
  
  void display()
  {
    fill(100,100,100);
    ellipse(xpos,ypos,diam,diam);
  }
  void fall()
  {
   if(ypos<height-diam)
   {
      ypos+=gravity;
   }
  }
}
