Puck puck;
Paddle player;
Paddle computer;

public void settings(){
 fullScreen(); 
}

public void setup(){
  puck = new Puck();
  player = new Paddle(true);
  computer = new Paddle(false);
}

public void draw(){
  background(0);
  puck.isTouching(player);
//  puck.isTouching(computer);
  
  player.show();
  computer.show();
  
  player.move();
  
  puck.show();
  puck.isOnEdge();
  puck.move();
}
