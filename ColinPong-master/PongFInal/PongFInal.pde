public class Paddle{
  float x;
  float y = height/2;
  float w = 30;
  float h = 100;
  
  public Paddle(boolean player){
    if(player){
      x = w + 10;
    } else {
      x = width - w - 10;
    }
  }
  
  public float getX(){
    return x; 
  }
  
  public float getY(){
    return y; 
  }
  
  public float getW(){
    return w; 
  }
  
  public float getH(){
    return h; 
  }
  
  public void show(){
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  
  public void AI(int difficulty, Puck p){
    float MAXSPEED = 0.0;
    switch (difficulty){
       case 0: 
         MAXSPEED = 7;
         break;
       case 1: 
         MAXSPEED = 30;
         break;
       case 2:
         MAXSPEED = 14;
         break;
       default:
         System.out.println("AI speed error");
    }
     float speed = (p.y - y)/3 ;
    if(speed > MAXSPEED)
      speed = MAXSPEED;
    y += speed;
   }
    
  
  
  public void move(){
     float constrainedY = constrain(mouseY, 50, height - 50);
     y = constrainedY;
     
  }
}
