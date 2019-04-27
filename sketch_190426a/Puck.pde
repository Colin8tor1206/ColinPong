public class Puck{
  float x = width/2;
  float y = height/2;
  float xvel = -5;
  float yvel = 5;
  float r = 12;
  float dir;
  float speed = 5;

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
      System.out.println("pre" + dir);
      direction();
      System.out.println("post" + dir);
    }
    
    if (x < 0){
      reset(); 
    }
  }
  
  public void direction(){
    speed++;
    dir = (float) Math.tan(-yvel/xvel);
    dir = 180 - dir;
    xvel = cos(dir) * speed;
    yvel = sin(dir) * speed;
  }
  
  public void isTouching(Paddle p){
    if (x - r < p.x + p.w/2 && y + r < p.y + p.h/2 && y - r > p.y - p.h/2){
      direction();
    }
  }

}
