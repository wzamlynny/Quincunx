class Ball
{
  float xpos;
  float ypos;
  float diam;
  float xChange=0;
  float yChange=1;//DO NOT CHANGE.
  float c=0;
  boolean counted=false;
  
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
    xpos+=xChange;
    ypos+=yChange;    
    if (ypos>=height-diam/2)  //stop moving at the bottom pf the screen.
    {
      yChange=0;
      xChange=0;
    }
  }
 
}
