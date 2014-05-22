void setup()
{
  size(displayWidth-50, displayHeight-50);
  colorMode(HSB,360,100,100);
  
  balls=new ArrayList<Ball>();
  balls.add(new Ball(width/2,height*1/9));
  root=new Peg(width/2,height*3/16,0);
}
  ArrayList <Ball> balls;
  Peg root;

  float startTime=0;
  
void draw()
{
  background(0,0,0);
  
  root.display();
  root.bins();
  
  for(int i=balls.size()-1;i>=0;i--)
  {
    Ball ball = balls.get(i);
    ball.display();
    ball.fall();
    root.ballCheck(ball);
    ball.bins(root);
    
  }
  if(balls.size()>=50)  //safety- removes balls when too many
  {
    balls.remove(0);
  }
}

void mousePressed()
{
  Ball ball = balls.get(balls.size()-1);//prevents multiple balls from going at once
  if(ball.ypos>root.ypos)
  {
    balls.add(new Ball(width/2,height*1/9));
  }
}
void keyPressed()//Press a key to remove the balls
{
  for(int i=balls.size()-1;i>=0;i--)
  {
    Ball ball = balls.get(i);
    if(ball.ypos>=height-ball.diam)
    {
      balls.remove(i);
    }
  }
}

void timer()
{
  if(startTime==0)
  {
    startTime=millis();
  }
  while(millis()-startTime<=100)
  {
  }
  if(millis()-startTime>=100)
  {
    startTime=0;
  }
}
