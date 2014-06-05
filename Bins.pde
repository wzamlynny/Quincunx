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
  void display()//displays the bins
  {
    stroke(0,0,100);
    line (xpos1,topY,xpos1,bottomY);
    line (xpos2,topY,xpos2,bottomY);
  }
  void bounce()
  {
    
  }
  
}
