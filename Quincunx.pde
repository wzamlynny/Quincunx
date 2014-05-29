void setup()
{
  size(displayWidth-50, displayHeight-50);
  //size(500,500);
  colorMode(HSB,360,100,100);
  rectMode(CENTER);
  
  balls=new ArrayList<Ball>();
  balls.add(new Ball(width/2,height*1/9));
  root=new Peg(width/2,height*3/16,0);
}
  ArrayList <Ball> balls;
  Peg root;

  float startTime=0;
  int screen=0;
  
void draw()
{
  if(screen==0)
  {
    startScreen();
  }
  if(screen==1)
  {
    quincunx();
  }
}

void startScreen()
{
  background(0,0,0);
  rect(width/2,height/2,100,50);
  if(mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=height/2-50&&mouseY<=height/2+50)
  {
    cursor(HAND);
    if(mousePressed)
    {
      screen=1;
    }
  }
  else
  {
    cursor(ARROW);
  }
  
}

void quincunx()
{
  background(0,0,0);
  cursor(ARROW);
  
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
  if(key==' ')//Space bar deletes
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
