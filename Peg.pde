class Peg
{
  float xpos;
  float ypos;
  float diam;
  int rowMax;
  
  Peg left;
  Peg right;
  
  Peg(float x,float y, int row)
  {
    xpos=x;
    ypos=y;
    diam=10;
    rowMax=6;
    
   
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
  void bins()
  {
    stroke(0,0,100);
    if(left!=null)
    {
      left.bins();
    }
    else//draw the line to the left
    {
      line(xpos-diam*10,ypos+50,xpos-diam*10,height);
      /*if(ball.xpos-ball.diam==xpos-diam*10)
      {
        ball.xChange=-ball.xChange;
      }*/
    }
    
    if(right!=null)
    {
      right.bins();
    }
    else//draw the line to the right
    {
      line(xpos+diam*10,ypos+50,xpos+diam*10,height);
      /*if(ball.xpos+ball.diam==xpos+diam*10)
      {
        ball.xChange=-ball.xChange;
      }*/
    } 
  }
  void ballCheck(Ball ball)
  {
    if(ball.ypos+ball.diam<ypos-diam)//if above
    {
    }
    else if(ball.ypos+ball.diam/2==ypos-diam/2) //below
    {
      if(int(random(0,2))==0)//randomization function
      {
        if(left!=null)
        {
          timer();//realistic pause
          ball.xChange=(left.xpos-xpos)/(left.ypos-ypos);//go left
        }
        else
        {
          ball.xChange=-.5;//change the slope
          //go from the bottom peg
        }
      }
      else
      {
        if(right!=null)
        {
          timer();//realistic pause
          ball.xChange=(right.xpos-xpos)/(right.ypos-ypos);//go right
        }
        else
        {
          ball.xChange=.5;//change the slope
          //go from the bottom peg
        }
      }
    }
    else//interaction with the lower pegs
    {
      if(ball.xChange<0&&left!=null)
      {
        left.ballCheck(ball);
      }
      else if(ball.xChange>0&&right!=null)
      {
        right.ballCheck(ball);
      }
    }
   }
}
