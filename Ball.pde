class Ball
{
  float xpos;
  float ypos;
  float diam;
  float xChange=0;
  float gravity=1;
  float c=0;
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
    fill(c,100,100);
    ellipse(xpos,ypos,diam,diam);
    //changing colors
    if(c<360)
    {
      c++;
    }
    else if(c>=360)
    {
      c=0;
    }
  }
  void fall()
  {
   if(ypos<height-diam)
   {
      ypos+=gravity;
   }
   else
   {
     xChange=0;
   }
   if(xChange!=0)
   {
      xpos+=xChange;
   }
  }
}
