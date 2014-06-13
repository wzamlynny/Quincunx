class Bins
{
  float xpos1;
  float xpos2;
  float topY;
  float bottomY;
  float ballAmount=0;
  
  //float ballprop;
  
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
  void bounce(Ball ball)
  {
     if (ball.ypos>=topY && xpos1<=ball.xpos && ball.xpos<=xpos2) //Checks specific bin.
     {
       if (ball.xpos-ball.diam/2<=xpos1 || ball.xpos+ball.diam/2>=xpos2)
       {
         ball.xChange=(-1)*ball.xChange;  //change in direction
       }
       if (ball.counted==false)
       {
         ballAmount++;
         //println(ballAmount);
         ball.counted=true;
       }
     } 
  }
  
  void graph()
  {
    fill(40,100,100);
    rect((xpos1+xpos2)/2,bottomY,xpos2-xpos1,ballAmount*20);
  }
  
  void fifty()
  {
    /*for (int i=0;i<50;i++)
    {
      ballprop=random(0,100);
      if(ballprob<=0.78125)
      {
        
      }
    }*/
  }
}
