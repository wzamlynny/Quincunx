class Peg
{
  float xpos;
  float ypos;
  float diam;
  int rowMax;
  
  boolean moveLeft=false;
  boolean moveRight=false;
  
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
    }
    
    if(right!=null)
    {
      right.bins();
    }
    else//draw the line to the right
    {
      line(xpos+diam*10,ypos+50,xpos+diam*10,height);
    } 
  }
  void ballCheck(Ball ball)
  {
    if(ball.ypos+ball.diam/2==ypos-diam/2&&ball.xpos==xpos) //at the point
    {
      if(int(random(0,2))==0)//randomization function
      {
        moveLeft=true;
        /*if(left!=null)
        {
          timer();//realistic pause
          if(ball.xpos+ball.diam>xpos-diam)//NEED TO MOVE THIS OUT OF THIS FUNCTION
          {
            ball.xChange--;
            ball.yChange=0;
          }
          else
          {
            ball.xChange=(left.xpos-ball.xpos)/(left.ypos-ball.ypos);//go left
            ball.yChange=1;
          }
        }
        else
        {
          ball.xChange=-.5;//change the slope
          //go from the bottom peg
        }*/
      }
      else
      {
        moveRight=true;
        /*if(right!=null)
        {
          timer();//realistic pause
          ball.xChange=(right.xpos-xpos)/(right.ypos-ypos);//go right
        }
        else
        {
          ball.xChange=.5;//change the slope
          //go from the bottom peg
        }*/
      }
    }
    /*else if(ball.ypos+ball.diam/2>=ypos-diam/2)
    {
      
    }*/
    else//calls the next peg
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
    if(moveLeft)
    {
      if(left!=null)
        {
          timer();//realistic pause
          if(ball.xpos+ball.diam>xpos-diam)//NEED TO MOVE THIS OUT OF THIS FUNCTION
          {
            ball.xChange--;
            ball.yChange=0;
          }
          else
          {
            ball.xChange=(left.xpos-ball.xpos)/(left.ypos-ball.ypos);//go left
            ball.yChange=1;
          }
        }
        else
        {
          ball.xChange=-.5;//change the slope
          //go from the bottom peg
        }
    }
    if(moveRight)
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
}
