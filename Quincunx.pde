void setup()
{
  size(displayWidth-50, displayHeight-50);
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
  if(screen==2)
  {
    instructions();
  }
  if(screen==3)
  {
    graph();
  }
}

void startScreen()
{
  background(0,0,0);
  fill(0,0,100);
  textSize(100);
  text("QUINCUNX",width/2-275,200);
  textSize(16);
  text("Weronika Zamlynny\nAP Statistics pd. 1-2 A\nFinal Project",width/2-75,250);
  fill(105,78,100);
  rect(width/2,height/2,100,50);
  rect(width/2,height/2+100,250,50);
  fill(0,0,0);
  textSize(32);
  text("PLAY",width/2-43,height/2+10);
  text("INSTRUCTIONS",width/2-115,height/2+110);
  //GO TO GAME
  if(mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=height/2-50&&mouseY<=height/2+50)
  {
    cursor(HAND);
    if(mousePressed)
    {
      screen=1;
    }
  }
  //GO TO INSTRUCTIONS
  else if(mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=height/2+50&&mouseY<=height/2+150)
  {
    cursor(HAND);
    if(mousePressed)
    {
      screen=2;
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
  
  //draws the button for graph
  fill(0,0,100);
  rect(100,height-100,125,50);
  rect(width-100,height-100,125,50);
  fill(0,0,0);
  text("BACK",50,height-75);
  text("GRAPH",width-150,height-75);
  if(mouseX>=25&&mouseX<=225&&mouseY>=height-150&&mouseY<=height-50)
  {
    cursor(HAND);
    if(mousePressed)
    {
      screen=0;
    }
  }
  else if(mouseX>=width-225&&mouseX<=width+25&&mouseY>=height-150&&mouseY<=height-50)
  {
    cursor(HAND);
    if(mousePressed)
    {
      screen=3;
    }
  }
  else
  {
    cursor(ARROW);
  }
  
}
void instructions()
{
  fill(0,0,100);
  background(0,0,0);
  textSize(64);
  text("Instructions",width/2-200,100);
  textSize(32);
  text("-CLICK to release a ball.\n-SPACE to remove all balls at the bottom.\n-When GRAPH on: SPACE to return to quincunx.",50,height/4);
  text("PRESS SPACE TO GO BACK",50,height*3/4);
  if(keyPressed&&key==' ')
  {
    screen=0;
  }
}
void graph()
{
  rect(width/2,height/2,50,50);
  
  
  //START QUINCUNX AGAIN
  if(keyPressed&&key==' ')
  {
    screen=1;
  }
  /*if(mouseX>=width-225&&mouseX<=width+25&&mouseY>=height-150&&mouseY<=height-50)
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
  }*/
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
