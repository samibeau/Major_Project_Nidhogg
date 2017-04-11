Player Player1;


void setup() {
  size(600,400);
  imageMode(CENTER);
  surface.setResizable(true);
  Player1 = new Player(width/2, height/2, color(0), 1);
  
}

void draw() {
  background(255);
  Player1.move();
  Player1.display();
  
}

void keyPressed() {
  Player1.handleKeyPress();
  
}

void keyReleased() {
  Player1.handleKeyRelease();  
  
}