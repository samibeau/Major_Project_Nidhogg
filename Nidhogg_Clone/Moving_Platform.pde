class MovingPlatform {
  //Variable Data
  float xPos, yPos;
  float xSpeed, ySpeed;
  float platWidth, platHeight;
  boolean goesLeftAndRight, goesUpAndDown;
  int orientation;
  
  
  //Constructor(s)
  MovingPlatform(float _xPos, float _yPos, float _xSpeed, float  _ySpeed, float _platWidth, float _platHeight, int _orientation) {
    xPos = _xPos;
    yPos = _yPos;
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
    platWidth = _platWidth;
    platHeight = _platHeight;
    orientation = _orientation;    
  }
  
  //Behaviour
  
  void display(){
    rect(xPos, yPos, platWidth, platHeight);    
  }
  
  void move() {
    
  }
}