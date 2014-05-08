void setup()
{
  size(displayWidth-50, displayHeight-50);
  colorMode(HSB,360,100,100);
  
  //ball[0]=new Ball(width/2,height*1/9);
  balls=new ArrayList<Ball>();
  balls.add(new Ball(width/2,height*1/9));
  root=new Peg(width/2,height*3/16,0);
}
  ArrayList <Ball> balls;
  //Ball []ball=new Ball[1];
  Peg root;
  
  int amount=1;
  
void draw()
{
  background(255,0,100);
  
  root.display();
  root.bins();
  
  for(int i=balls.size()-1;i>=0;i--)
  {
    Ball ball = balls.get(i);
    ball.display();
    ball.fall();
  }
  
}

void mousePressed()
{
  balls.add(new Ball(width/2,height*1/9));
}
void keyPressed()//Press a key to remove the balls
{
  for(int i=balls.size()-1;i>=0;i--)
  {
    Ball ball = balls.get(i);
    if(ball.ypos==height-ball.diam)
    {
      balls.remove(i);
    }
  }
}
