class ControlObjects {
  
  private ControlBullet ctrlBullet;
  private ControlShip ctrlShip;

  private int framesLastBullet;
  private Ship nave;
  
  // PARÁMETRO PASADO DESDE EL PROGRAMA PRINCIPAL
  private int framesBetweenBullets;
  
  public ControlObjects(PVector posOriginalNave, int maxVelocityShip, int bulletSpeed, int framesBetweenBullets, float bulletRadius, int shipHealth) {
    nave = new Ship(posOriginalNave, shipHealth);
    
    ctrlBullet = new ControlBullet(nave, bulletSpeed, bulletRadius);
    ctrlShip = new ControlShip(nave, maxVelocityShip);
    framesLastBullet = frameCount;
    
    this.framesBetweenBullets = framesBetweenBullets;
  }
  
  private void dibuja() {
    ctrlBullet.updateBulletPosition();
     
    ctrlShip.dibuja();
    ctrlBullet.dibuja();
  }

  private void checkMovement() {
    switch(key) {
      case 'a':
      case 'A':
        nave.setAngle(-5);
        break;
      case 'd':
      case 'D':
        nave.setAngle(5);
        break;
      case 'w':
      case 'W':
        ctrlShip.frontMovement();
        break;
      case 's':
      case 'S':
        ctrlShip.backMovement();
        break;
      case 'e':
      case 'E':        
        if(framesLastBullet < frameCount - framesBetweenBullets) {
          ctrlBullet.shoot();
          framesLastBullet = frameCount;
        }
    }
  }
}
