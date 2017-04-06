PImage splashScreen;
boolean splashOn = false;
boolean shapeBrushes = true;
boolean imageBrushes = false;

int colR = 0;
int colG = 0;
int colB = 0;

//int colRRAN = 0;
//int colGRAN = 0;
//int colBRAN = 0;

float oldX;
float oldY;

ArrayList<Ball> balls;
ArrayList<picBrush> brushs = new ArrayList<picBrush>();

PImage[] imgs = new PImage[3];
int pic_index = 0;


int ballWidth = 10;
float _gravity = 0.1;


void setup()
{
  size(1024,768, P2D);
  smooth();
  splashScreen = loadImage("splashScreen.png");
  startUp();
  //*******************************
  
  // THIS PART IS ALL ABOUT BALLS #BALLARRAY
  
   // Create an empty ArrayList (will store Ball objects)
  balls = new ArrayList<Ball>();
  // Start by adding one element
  balls.add(new Ball(width/2, height/2, ballWidth));
  balls.clear(); // < trying to clear that annoying ball at the start
 
  //*******************************
  
  imgs[0] = loadImage("butt.png");
  imgs[1] = loadImage("butt2.png");
  imgs[2] = loadImage("butt4.png");
  for (int i = 0; i < 3; i++) {
    imgs[i].resize(imgs[i].width/3, imgs[i].height/3);
  }
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
  
  for (int i = 0; i < brushs.size(); i++) {
      picBrush brush = brushs.get(i);
      float norm_length = map(i, 0, brushs.size(), 0.0, 1.0);
      float lfo = map(norm_length*sin(frameCount*0.02), -1.0, 1.0, 0.0, 1.0);
      brush.set_size(lfo);
      brush.set_rot_speed(lfo*5.25);
      brush.draw();
    }
  
  
}

void mouseClicked()
{
  if (splashOn == true)
  {
    background(0);
    splashOn = false;
  }  
}


void keyPressed()
{
  if (key == 32)
  {
    gravityOn = !gravityOn;
  }

  if (key == 'c')
  {
    balls.clear();
    brushs.clear();
    
    
  }
  if (key == 'h')
  {
   startUp();

  }
  
  if (key == 'q')
  {
    // shapeBrushes
    
    shapeBrushes = true;
    imageBrushes = false;
    brushs.clear();
    
    
  }
   if (key == 'w')
  {
    // shapeBrushes
    
    shapeBrushes = false;
    imageBrushes = true;
     balls.clear();
    
  }
  
  if (key == 'm')
  {
    startUp();
    balls.clear();
    brushs.clear();
  }
  
  
  if (key == '1')
  { 
    pic_index = 0;
  }
  if (key == '2')
  {
    pic_index = 1;
  }
  if (key == '3')
  { 
    pic_index = 2;
  }
  
  if (key == '[' && ballWidth>5)
  {
    ballWidth = ballWidth - 5;
   
  }
   if (key == ']' && ballWidth<100)
  {
    ballWidth = ballWidth + 5;
  }
  
  if (key == 45 && _gravity>0.1) // gravity down
  {
    _gravity -=0.1;
     balls.add(new Ball(mouseX, mouseY, 0));
  }
   if (key == 61 && _gravity<0.9) // gravity up 
  {
    _gravity +=0.1;
     balls.add(new Ball(mouseX, mouseY, 0)); // << call ball class to update new gravity variable 
                                             // probably not the best way of doing it, but meh. 
     
  }
  if( key == 's') // save image 
  {
  saveFrame("image-######.png");
  }
  
}


void mouseDragged()
{
  // A new ball object is added to the ArrayList (by default to the end)
  // ballWidth = (int)random(10,100);
  if(splashOn == false) 
  {
    if(shapeBrushes== true){

    //  ballWidth = 50;
      balls.add(new Ball(mouseX, mouseY, ballWidth));
    }
    
    if(imageBrushes == true) {
 
       brushs.add(new picBrush(imgs[pic_index], mouseX, mouseY));
    }
  }
}

 