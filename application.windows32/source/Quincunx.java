import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Quincunx extends PApplet {

//Quincunx in Statistics
//
//Weronika Zamlynny
//AP Statistics pd. 1-2 A

ArrayList <Ball> balls;
Bins[] bin = new Bins[8];
Peg root;

float startTime=0;
int screen=0;
float ballprop=0;

public void setup()
{
  size(displayWidth-50, displayHeight-50);
  colorMode(HSB,360,100,100);
  rectMode(CENTER);
  frameRate(120);
  
  balls=new ArrayList<Ball>();
  balls.add(new Ball(width/2,height*1/9));
  root=new Peg(width/2,height*3/16,0);
  
  //for the x-position of bins
  float[] binsX = new float[9];
  binsX[0]=-40;
  binsX[1]=-30;
  binsX[2]=-20;
  binsX[3]=-10;
  binsX[4]=0;
  binsX[5]=10;
  binsX[6]=20;
  binsX[7]=30;
  binsX[8]=40;
  
  for (int i=0;i<8;i++)
  {
    bin[i]= new Bins(binsX[i],binsX[i+1],root);
  }
  
}

public void draw()
{
  if (screen==0)
  {
    startScreen();
  }
  if (screen==1)
  {
    quincunx();
  }
  if (screen==2)
  {
    instructions();
  }
  if (screen==3)
  {
    graph();
  }
}

public void startScreen()
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
  if (mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=height/2-50&&mouseY<=height/2+50)
  {
    cursor(HAND);
    if (mousePressed)
    {
      screen=1;
    }
  }
  //GO TO INSTRUCTIONS
  else if (mouseX>=width/2-100&&mouseX<=width/2+100&&mouseY>=height/2+50&&mouseY<=height/2+150)
  {
    cursor(HAND);
    if (mousePressed)
    {
      screen=2;
    }
  }
  else
  {
    cursor(ARROW);
  }
  
}
public void quincunx()
{
  background(0,0,0);
  cursor(ARROW);
  
  root.display();
 // root.bins();
  
  for(int i=balls.size()-1;i>=0;i--)
  {
    Ball ball = balls.get(i);
    ball.display();
    ball.fall();
    root.ballCheck(ball);
  }
  
  if(balls.size()>=50)  //safety- removes balls when too many
  {
    balls.remove(0);
  }
  
 for(int j=0;j<8;j++)
 {
    for(int i=balls.size()-1;i>=0;i--)
  {
    Ball ball = balls.get(i);
    //ball.counter(bin[j]);
    bin[j].display();
    bin[j].bounce(ball); 
  }
 }
  
  //draws the button for graph
  fill(0,0,100);
  rect(100,height-100,125,50);
  rect(width-100,height-100,125,50);
  fill(0,0,0);
  text("BACK",50,height-75);
  text("GRAPH",width-150,height-75);
  if (mouseX>=25&&mouseX<=225 && mouseY>=height-150 && mouseY<=height-50)
  {
    cursor(HAND);
    if(mousePressed)
    {
      screen=0;
    }
  }
  else if (mouseX>=width-225 && mouseX<=width+25 && mouseY>=height-150 && mouseY<=height-50)
  {
    cursor(HAND);
    if (mousePressed)
    {
      screen=3;
    }
  }
  else
  {
    cursor(ARROW);
  }
  
}
public void instructions()
{
  fill(0,0,100);
  background(0,0,0);
  textSize(64);
  text("Instructions",width/2-200,100);
  textSize(32);
  text("-CLICK to release a ball.\n-SPACE to remove all balls at the bottom.\n-When GRAPH on: SPACE to return to quincunx.\n-When GRAPH on: PRESS 5 to add 25 data points",50,height/4);
  text("PRESS SPACE TO GO BACK",50,height*3/4);
  if (keyPressed&&key==' ')
  {
    screen=0;
  }
}
public void graph()
{
  //rect(width/2,height/2,50,50);
  for (int i=0;i<8;i++)
  {
    bin[i].graph();
    //Makes sure the graph does not go above the screen.
    if (bin[i].ballAmount*bin[i].size>=width)
    {
      for (int j=0;j<8;j++)
      {
        bin[j].size=bin[j].size/2;
        quincunx();
      }
    }
  }
  
  //START QUINCUNX AGAIN
  if (keyPressed && key==' ')
  {
    screen=1;
  }
  
  if (keyPressed && key=='5')
 {
  fifty();
 }
}

public void mousePressed()
{
  if (screen==1)
  {
    //prevents multiple balls from going at once
    if (balls.size() >= 1)
    {
      Ball ball = balls.get(balls.size()-1);
      if (ball.ypos>root.ypos)
      {
        balls.add(new Ball(width/2,height*1/9));
      }
    }
    else
    {
      balls.add(new Ball(width/2,height*1/9));
    }
  }
}
public void keyPressed()//Press a key to remove the balls
{
  if (key==' ')//Space bar deletes
  {
    for (int i=balls.size()-1;i>=0;i--)
    {
      Ball ball = balls.get(i);
      if (ball.ypos>=height-ball.diam)
      {
        balls.remove(i);
      }
    }
  }
}

public void timer()
{
  if (startTime==0)
  {
    startTime=millis();
  }
  while (millis()-startTime<=100)
  {
  }
  if (millis()-startTime>=100)
  {
    startTime=0;
  }
}

public void fifty()
{
  for (int i=0;i<25;i++)
    {
      ballprop=random(0,100);
      if (ballprop<=0.78125f)
      {
        bin[0].ballAmount++;
      }
      else if (ballprop<=6.25f)
      {
        bin[1].ballAmount++;
      }
      else if (ballprop<=22.65625f)
      {
        bin[2].ballAmount++;
      }
      else if (ballprop<=50)
      {
        bin[3].ballAmount++;
      }
      else if (ballprop<=77.34375f)
      {
        bin[4].ballAmount++;
      }
      else if (ballprop<=93.75f)
      {
        bin[5].ballAmount++;
      }
      else if (ballprop<=99.21875f)
      {
        bin[6].ballAmount++;
      }
      else if (ballprop<=100)
      {
        bin[7].ballAmount++;
      }
    }
}
class Ball
{
  float xpos;
  float ypos;
  float diam;
  float xChange=0;
  float yChange=1;//DO NOT CHANGE.
  float c=0;
  boolean counted=false;
  
  Ball(float x,float y)
  {
    xpos=x;
    ypos=y;
    diam=20;
  }
  
  Ball(float x,float y,float d)
  {
    xpos=x;
    ypos=y;
    diam=d;
  }
  
  public void display()
  {
    fill(c,100,100);
    ellipse(xpos,ypos,diam,diam);
    //changing colors
    if(c<360)
    {
      c++;
    }
    else if(c>=360)
    {
      c=0;
    }
  }
  
  public void fall()
  {
    xpos+=xChange;
    ypos+=yChange;    
    if (ypos>=height-diam/2)  //stop moving at the bottom pf the screen.
    {
      yChange=0;
      xChange=0;
    }
  }
 
}
class Bins
{
  float xpos1;
  float xpos2;
  float topY;
  float bottomY;
  float ballAmount=0;
  float size=20;
  
  Bins (float x1, float x2, Peg peg)
  {
    topY=height*3/16+6*(height/10)+50;
    bottomY=height;
    xpos1=width/2+x1*peg.diam;
    xpos2=width/2+x2*peg.diam; 
  }
  
  public void display()//displays the bins
  {
    stroke(0,0,100);
    line (xpos1,topY,xpos1,bottomY);
    line (xpos2,topY,xpos2,bottomY);
  }
  
  public void bounce(Ball ball)
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
         ball.counted=true;
       }
     } 
  }
  
  public void graph()
  {
    fill(40,100,100);
    rect((xpos1+xpos2)/2,bottomY,xpos2-xpos1,ballAmount*size);
  }
  
}
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
  
  public void display()
  {
    fill(0,0,100);
    ellipse(xpos,ypos,diam,diam);
   if(left!=null && right!=null) 
   {
     left.display();
     right.display();
   }
  }

  public void ballCheck(Ball ball)
  {
    if (ball.ypos+ball.diam/2 == ypos-diam/2) //below
    {
      if(PApplet.parseInt(random(0,2))==0)//randomization function
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "Quincunx" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
