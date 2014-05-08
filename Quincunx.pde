void setup()
{
  //size(500,500);
  size(displayWidth-50, displayHeight-50);
  background(255);
  //noStroke();
  colorMode(HSB,360,100,100);
}

void draw()
{
  //background(255);
  fill(100,100,100);
  
  Peg root = new Peg(width/2, height*3/16, 0);
  
  root.display();
  root.bins();
}
