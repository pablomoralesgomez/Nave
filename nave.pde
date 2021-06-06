
PVector posOriginalNave;
int maxVelocityShip = 10;
int bulletVelocity = 10;
int framesBetweenBullets = 10;
float bulletRadius = 10;
int shipHealth = 1000;

ControlObjects ship;

void setup(){
  size(640, 480);
  
  posOriginalNave = new PVector(width/2, height/2);
  ship = new ControlObjects(posOriginalNave, maxVelocityShip, bulletVelocity, framesBetweenBullets, bulletRadius, shipHealth);
  frameRate(30);

}

void draw(){
  background(0);
  fill(0,0,255);
  stroke(255,255,0);

  if(keyPressed) ship.checkMovement();
  ship.dibuja();
  
}
