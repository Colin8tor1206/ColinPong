public class Paddle{
  float x;
  float y = height/2;
  float w = 20;
  float h = 100;
  
  public Paddle(boolean player){
    if(player){
      x = w;
    } else {
      x = width - w;
    }
  }
  
  public float getX(){
    return x; 
  }
  
  public float getY(){
    return Y; 
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
  
  public void move(){
     float constrainedY = constrain(mouseY, 50, height - 50);
     y = constrainedY;
  }
}
