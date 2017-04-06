PImage splashScreen;
boolean splashOn = false;

float oldX;
float oldY;

ArrayList<Ball> balls;
int ballWidth = 10;


void setup()
{
  size(1024,768);
  smooth();
  splashScreen = loadImage("splashScreen.jpg");
  startUp();
  
   // Create an empty ArrayList (will store Ball objects)
  balls = new ArrayList<Ball>();
  // Start by adding one element
  balls.add(new Ball(width/2, height/2, ballWidth));
  balls.clear(); // < trying to clear that annoying ball at the start
  
  
}

void startUp()
{
 
  image(splashScreen, 0, 0);
  splashOn = true;
  
}

void update()
{
  oldX=mouseX;
  oldY=mouseY;
  
  if(splashOn == false)
  {
       background(0);
  }
  
}

void draw()
{
  update();
  // Very Basic Drawing Tool
  //if(mousePressed && splashOn == false){
  //strokeWeight(10);
  //line(mouseX, mouseY, oldX, oldY);
  //}
  
  for(int i = 0; i<=balls.size()-1; i++){ 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
  }
  
  
}

void mouseClicked()
{
  if (splashOn == true)
  {
    background(255);
    splashOn = false;
  }
  
  
  
}

void mouseDragged()
{
  // A new ball object is added to the ArrayList (by default to the end)
  // ballWidth = (int)random(10,100);
  ballWidth = 50;
  balls.add(new Ball(mouseX, mouseY, ballWidth));
}

void keyPressed()
{
  if (key == 't')
  {
    gravityOn = !gravityOn;
  }

  if (key == 'c')
  {
    balls.clear();
    
  }
}