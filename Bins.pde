class Bins
{
  float xpos1;
  float xpos2;
  float topY;
  float bottomY;
  
  Bins (float x1, float x2, Peg peg)
  {
    topY=height*3/16+6*(height/10)+50;
    bottomY=height;
    
    xpos1=width/2+x1*peg.diam;
    xpos2=width/2+x2*peg.diam;
    
  }
  void display()
  {
    stroke(0,0,100);
    line (xpos1,topY,xpos1,bottomY);
    line (xpos2,topY,xpos2,bottomY);
  }
  
}
    /*void bins()
  {
    stroke(0,0,100);
    if(left!=null)
    {
      left.bins();
    }
    else//draw the line to the left
    {
      line(xpos-diam*10,ypos+50,xpos-diam*10,height);
      println(ypos+50);
    }
    
    if(right!=null)
    {
      right.bins();
    }
    else//draw the line to the right
    {
      line(xpos+diam*10,ypos+50,xpos+diam*10,height);
    } 
  }*/
