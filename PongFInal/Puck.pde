public class Puck{
  float x = width/2;
  float y = height/2;
  float xspeed = 10; //never negative
  float yspeed = 10;
  float xdir = -.3; //1 = right
  float ydir = .7; // 1 = down
  float r = 12;
  float dir;
  float xvec;
  float yvec;

  public void show(){
   fill(255);
   ellipse(x,y,r*2,r*2);
  }  
  
  public void reset(){
    x = width/2;
    y = height/2;
  }
  
  public void move(){
    x += xspeed * xdir;
    y += yspeed * ydir;
  }
  
  public void isOnEdge(){
    if (y < 0 + 12 || y > height - 12){
      //ydir *= -1;
      direction();
    }
    
    if (x < 0){
      reset(); 
    }
  }
  
  public void direction(){
    xspeed++;
    yspeed++;
    dir = (float)(Math.atan(ydir/xdir));
    System.out.println("dir before: " + dir);
    dir = (float) (Math.PI/2) - dir;
    System.out.println("dir after: " + dir);
    xdir = (float)cos(dir);
    ydir = (float)sin(dir);
    System.out.println("xdir: " + xdir + " ydir: " + ydir);
   // exit();
  }
  
  public void isTouching(Paddle p){
    if (x - r < p.x + p.w/2 && y + r < p.y + p.h/2 && y - r > p.y - p.h/2){
      direction();
    }
  }

}
