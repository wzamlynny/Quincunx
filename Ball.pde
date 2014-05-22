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
   if(ypos<height-diam)
   {
      ypos+=yChange;
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
  void bins(Peg peg)//WHY DO ONLY SOME OF THEM WORK D:
  {
    if(peg.left!=null)
    {
      bins(peg.left);
    }
    else
    {
        if(xpos<peg.xpos&&ypos>peg.ypos)//if its to the left
        {
          if(xpos-diam<=peg.xpos-diam*10)
          {
            xChange=-xChange;
          }
        }
    }
    if(peg.right!=null)
    {
      bins(peg.right);
    }
    else
    {
      if(xpos>peg.xpos&&ypos>peg.ypos)//if its to the right
      {
        if(xpos+diam/2>=peg.xpos+diam*10)
        {
          xChange=-xChange;
        }
      }
      
    }
  }
}
