class Peg
{
  float xpos;
  float ypos;
  float diam;
  int rowMax;//Please don't change :) thanks.
  
  Peg left;//initializes the next pegs
  Peg right;
  
  float slope;
  
  Peg(float x,float y, int row)
  {
    xpos=x;
    ypos=y;
    diam=10;
    rowMax=6;  
    slope=(diam*5)/(height/10);
   
    if(row<rowMax)
    {
      //check if theres already a peg there
      left = new Peg(x-diam*5,y+height/10,row+1);
      right = new Peg(x+diam*5,y+height/10,row+1);
    } 
  }
  
  void display()
  {
    fill(0,0,100);
    ellipse(xpos,ypos,diam,diam);
   if(left!=null && right!=null) 
   {
     left.display();
     right.display();
   }
  }

  void ballCheck(Ball ball)
  {
    if (ball.ypos+ball.diam/2 == ypos-diam/2) //below
    {
      if(int(random(0,2))==0)//randomization function
      {
        ball.xChange=(-1)*slope;
      }
      else
      {
        ball.xChange=slope;
      }
    }
    else//interaction with the lower pegs
    {
      if (ball.xChange<0 && left!=null)
      {
        left.ballCheck(ball);
      }
      else if( ball.xChange>0 && right!=null)
      {
        right.ballCheck(ball);
      }
    }
   }
}
