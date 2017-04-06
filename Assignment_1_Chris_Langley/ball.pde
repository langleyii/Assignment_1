// Simple bouncing ball class

boolean gravityOn = false;
//float speed;
//float gravity;  // <<<  weird shit happens when i make these variables global

class Ball {
  
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;
  float dampening = -1;
 //float dampening = random(-0.6,2);
  
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.1;
    
  }
  
  //void gravityActive()
  //{
  //  gravityOn = true;
  //}
  
    void move() {
      
      if(gravityOn == true)
      {
      
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height) {
      // Dampening
      speed = speed * dampening;
      y = height;
      
    }
    }
    else {
    return;
    }
  }
  

  
  //boolean finished() {
  //  // Balls fade out
  //  life--;
  //  if (life < 0) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}
  
  void display() {
    
    
    // Display the circle
    noFill();
     stroke(random(1,255),random(1,255),random(1,255),life);
   // fill(random(1,255),random(1,255),random(1,255),life);
    //stroke(0,life);
 //line(x,y,x,y);
    ellipse(x,y,w,w);
  }
} 