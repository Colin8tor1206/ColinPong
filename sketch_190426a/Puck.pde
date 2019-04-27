public class Puck{
  float x = width/2;
  float y = height/2;
  float xvel = -5;
  float yvel = 5;
  float r = 12;

  public void show(){
   fill(255);
   ellipse(x,y,r*2,r*2);
  }  
  
  public void reset(){
    x = width/2;
    y = height/2;
  }
  
  public void move(){
    x += xvel;
    y += yvel;
  }
  
  public void isOnEdge(){
    if (y < 0 + 12 || y > height - 12){
     yvel *= -1; 
    }
    
    if (x < 0){
      reset(); 
    }
  }
  
  public void isTouching(Paddle p){
    if (x - r < p.x + p.w && y + r < p.y + p.h/2 && y - r > p.y - p.h/2){
      xvel *= -1;
    }
  }

}
