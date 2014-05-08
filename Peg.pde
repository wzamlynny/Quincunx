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
    fill(0,100,100);
    ellipse(xpos,ypos,diam,diam);
   if(left!=null && right!=null) 
   {
     left.display();
     right.display();
   }
  }
  void bins()
  {
    if(left!=null)
    {
      left.bins();
    }
    else
    {
      line(xpos-diam*10,ypos+50,xpos-diam*10,height);
    }
    
    if(right!=null)
    {
      right.bins();
    }
    else
    {
      line(xpos+diam*10,ypos+50,xpos+diam*10,height);
    } 
  }
  void check()
  {
    
  }
}
