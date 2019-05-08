public class Puck{
  final float PI = (float) Math.PI;
  float x = width/2;
  float y = height/2;
  float xspeed = 10; //never negative
  float yspeed = -10; //offset stuff
  float r = 12;
  float dir = (3 * PI / 4); // [0, 2pi)
  int section;
  int playerScore = 0;
  int computerScore = 0;
  boolean hit = false;

  public void show(){
   fill(255);
   ellipse(x,y,r*2,r*2);
  }  
  public float getY(){
    return y;
  }
  public void reset(){
    x = width/2;
    y = height/2;
    if((int) (Math.random() * 2) == 0){
       dir = (float) (Math.random() * 2 * PI / 4) + 2 * PI / 3;
    } else {
       dir = (float) (Math.random() * -PI / 3) + PI / 3 ;
    }
  }
  
  public void move(){
    x += xspeed * (float) (Math.cos(dir));
    y += yspeed * (float) (Math.sin(dir));
  }
  
  public void isOnEdge(){
    if (y < 0 + 12 || y > height - 12){
      //ydir *= -1;
      hitTopOrBottom();
    }
    
    if (x < 0 || x > width){
      if(x < 0){
        computerScore++;
      } if(x > width){
         playerScore++; 
      }
      reset();
      
    }
  }
  
  public void hitTopOrBottom(){
  //  xspeed++;
    //yspeed--;
      dir = 2 * PI - dir;
  }
  
  public void direction(float puckY, float paddleY, Paddle p){
    if(p == player){
      if(puckY >= paddleY - 50 && puckY <= paddleY - 30){ //0-20
        dir = PI / 3 + dir * -.1;
      }else if(puckY > paddleY - 30 && puckY <= paddleY - 10){ //21-40
        dir = PI / 6 + dir * -.1;
      }else if(puckY > paddleY - 10 && puckY <= paddleY + 10){ //41-60
       // dir = 
      }else if(puckY > paddleY + 10 && puckY <= paddleY + 30){ //61-80
        dir = 11 * PI / 6 + dir * .1;
      }else if(puckY > paddleY + 30 && puckY <= paddleY + 50){ //81-100
        dir = 5 * PI / 3 + dir * .1;
      }   
    } else {
      if(puckY >= paddleY - 50 && puckY <= paddleY - 30){ //0-20
        dir = 4 * PI / 3 + dir * -.1;
      }else if(puckY > paddleY - 30 && puckY <= paddleY - 10){ //21-40
        dir = 5 * PI / 6 + dir * -.1;
      }else if(puckY > paddleY - 10 && puckY <= paddleY + 10){ //41-60
       // dir = 
      }else if(puckY > paddleY + 10 && puckY <= paddleY + 30){ //61-80
        dir = 7 * PI / 6 + dir * .1;
      }else if(puckY > paddleY + 30 && puckY <= paddleY + 50){ //81-100
        dir = 4 * PI / 3 + dir * .1;
      }
    }
  }
  
  public void isTouching(Paddle p){
    if(p.equals(player) && hit == false){
      if (x - r <= p.x + p.w/2 && y + r < p.y + p.h/2 && y - r > p.y - p.h/2){
        direction(y, p.y, p);
        hit = true;
      }
    }
    if(p.equals(computer) && hit == false){
      if(x + r >= p.x - p.w/2 && y + r < p.y + p.h/2 && y - r > p.y - p.h/2){
        direction(y, p.y, p);
        hit = true;
      }
    }
  }
}
