class Ball
{
  float xpos;
  float ypos;
  float diam;
  float xChange=0;
  float yChange=1;
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
    xpos+=xChange;
    ypos+=yChange;    
    if (ypos>=height-diam/2)  //stop moving at the bottom pf the screen.
    {
      yChange=0;
      xChange=0;
    }
  }
  void bins(Peg peg)  //WHY DO ONLY SOME OF THEM WORK D:
  {
    if(peg.left != null)
    {
      bins(peg.left);
    }
    else
    {
        if(xpos < peg.xpos && ypos>peg.ypos)  //if its to the left
        {
          if (xpos-diam/2 == peg.xpos-peg.diam*10 && ypos>=peg.ypos+50)
          {
             xChange=(-1)*xChange;
          }
        }
        /*else
        {
          if (xpos+diam/2 == peg.xpos+peg.diam*10 && ypos>=peg.ypos+50)
          {
            xChange=(-1)*xChange;
          }
        }*/
    }
    
    if (peg.right != null)
    {
      bins(peg.right);
    }
    else
    {
      if (xpos > peg.xpos && ypos > peg.ypos && ypos>=peg.ypos+50)  //if its to the right
      {
        if(xpos+diam/2 == peg.xpos+peg.diam*10)
        {
          xChange=(-1)*xChange;
        }
      }
      
    }
  }
}
