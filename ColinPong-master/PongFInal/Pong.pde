Puck puck;
Paddle player;
Paddle computer;
int difficulty = 1;
boolean startScreen = true;

public void settings(){
 fullScreen(); 
}

public void setup(){
  frameRate(120);
  puck = new Puck();
  player = new Paddle(true);
  computer = new Paddle(false);
}

public void mouseClicked(){
  if(startScreen){
    startScreen = false;
  }
}

public void draw(){
  if(startScreen){
    background(50);
    textSize(100);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Computer Science Final \nPong \nBy Colin Li & Luke Fahrney \nClick to Start", width/2, height/2);
  } else {
    background(0);
    puck.isTouching(player);
    puck.isTouching(computer);
    
    player.show();
    computer.show();
  
    player.move();
    if(Math.cos(puck.dir) >= 0){
      computer.AI(difficulty, puck);
    }
    
    puck.show();
    puck.isOnEdge();
    puck.move();
    textSize(32);
    text(puck.playerScore, 10, 30);
    text(puck.computerScore, width - 10, 30);
    puck.hit = false;
  }
}
