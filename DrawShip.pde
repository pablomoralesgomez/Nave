

class DrawShip {
  
  private Ship nave;
  private PImage sprite;
  
  public DrawShip(Ship nave) {
    this.nave = nave;
    sprite = loadImage("nave.png");
    sprite.resize(70, 50);
  }
  
  private void dibuja() {    
    PVector shipPosition = nave.getPos();

    pushMatrix();
    
    translate(shipPosition.x, shipPosition.y);
    rotate(radians(nave.getAngle()));
    image(sprite, -35, -25);
    
    popMatrix();

  }
}
