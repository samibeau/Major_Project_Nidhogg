class Player {
  //Variable Data
  //Class Imports
  Timer walkTimer;

  //Location Variables
  float xPos, yPos;
  float swordX, swordY;
  float xSpeed, ySpeed;
  float xAcel, yAcel;
  int player;

  //Display Variables
  int Cycle;
  color playerColor;
  PImage[] walkCycle;
  PImage Sword;

  //Animation Variables
  boolean isMovingRight, isMovingLeft, isJumping, isDropping, isSwingingSword, isBlocking;


  //Constructor(s)  
  Player(float _xPos, float _yPos, color _color, int _player) {
    //Location
    xPos = _xPos;
    yPos = _yPos;
    swordX = 27;
    swordY = -20;
    xSpeed = 2;
    ySpeed = 2;
    xAcel = 0;
    yAcel = 0;
    player = _player;

    //Display
    Cycle = 0;
    playerColor = _color;
    Sword = loadImage("Sword.png");
    walkTimer = new Timer(0.07);
    walkCycle = new PImage[2];
    for (int i = 0; i<2; i++) {
      walkCycle[i] = loadImage("Walk" + i + ".png");
    }

    //Animation
    isMovingRight = false;
    isMovingLeft = false;
    isJumping = false;
    isDropping = false;
    isSwingingSword = false;
    isBlocking = false;
  }


  //Class Behaviour  
  void display() {
    translate(xPos, yPos);
    image(walkCycle[Cycle], 0, 0);
    attack();
  }


  void move() {
    
    if (isMovingRight) {
      xPos += xSpeed;
      walk();
    }

    if (isMovingLeft) {
      xPos -= xSpeed;
      walk();
    }

    if (isJumping) {
    }

    if (isDropping) {
      //Drop Down
      /*
      Will detect if platform under player can be passed.
       If so, the "DOWN" key will let him drop through.
       If not, it will do nothing.
       */
    }
  }


  void handleKeyPress() {
      //Right
      if (key == 'd' || key == 'D') {
        isMovingRight = true;
      }

      //Left
      if (key == 'a' || key == 'A') {
        isMovingLeft = true;
      }

      //Jump
      if (key == 'w' || key == 'W') {
        isJumping = true;
      }         

      if (key == 's' || key == 'S') {
        isDropping = true;
      }
      
      if (key == 'e') {
        isSwingingSword = true;
        isBlocking = false;        
      }
      
      if (key == 'q') {
        isSwingingSword = true;
        isBlocking = false;        
      }
      
      if (key == CODED && keyCode == SHIFT){
        isBlocking = true;
        isSwingingSword = false;
      }
  }


  void handleKeyRelease() {
      //Right
      if (key == 'd' || key == 'D') {
        isMovingRight = false;
      }

      //Left
      if (key == 'a' || key == 'A') {
        isMovingLeft = false;
      }

      //Jump
      if (key == 'w' || key == 'W') {
        isJumping = false;
      }         

      if (key == 's' || key == 'S') {
        isDropping = false;
      }
      
      if (key == 'e') {
        isSwingingSword = false;       
      }
      
      if (key == 'q') {
        isSwingingSword = false;       
      }
      
      if (key == CODED && keyCode == SHIFT){
        isBlocking = false;
      }
     
  }  

  void walk() { 
    if (walkTimer.isDone()) {

      if (Cycle == 0) {
        Cycle = 1;
        walkTimer.reset();
      } else {
        Cycle = 0; 
        walkTimer.reset();
      }
    }
  }


  void attack() {
    translate(swordX-9, swordY+9);
      
      //Stab
      if (isSwingingSword) { 
        rotate(radians(45));
      }

      //Block
      if (isBlocking) {        
        rotate(radians(90));
      }
      
      image(Sword, 9, -9);
    }
}