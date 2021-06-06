class ControlBullet {
  
  private DrawBullet muestraBalas;
  private ArrayList<Bullet> balas;
  private Ship nave;
  
  // PARÁMETROS PASADO DESDE EL PROGRAMA PRINCIPAL
  private int bulletSpeed;
  private float bulletRadius;
  
  public ControlBullet(Ship nave, int bulletSpeed, float bulletRadius) {
    balas = new ArrayList<Bullet>();
    muestraBalas = new DrawBullet(balas);
    
    this.nave = nave;
    
    this.bulletSpeed = bulletSpeed;
    this.bulletRadius = bulletRadius;
  }
  
  // Dibujamos las balas que tenemos en pantalla
  private void dibuja() {
    muestraBalas.dibuja();
  }
  
  // Creamos una nueva bala que añadimos al contenedor su posición será relativa al ángulo de la nave y su posición
  private void shoot() { 
    PVector pos = nave.getPos();
    int angle = nave.getAngle();
    
    balas.add(new Bullet(new PVector(pos.x - (40 * (-sin(radians(angle - 90)))), pos.y - (40 * cos(radians(angle - 90)))), bulletSpeed, bulletRadius, angle));
    
  }
  
   // Actualizamos la posición de cada bala en pantalla acorde al ángulo al que fue disparada, su posición previa y su velocidad.
  private void updateBulletPosition() {
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bullet bala = balas.get(i);
      PVector pos = bala.getPos();
      
      if (bulletOutOfBounds(pos)) {
        balas.remove(i);
      
      } else {
        int angle = bala.getAngle();
        int velocity = bala.getSpeed();
        
        bala.setPos(new PVector((sin(radians(angle - 90)) * velocity) + pos.x, (- cos(radians(angle -90))* velocity)+ pos.y));
      }
    }

  }
  
  // Método auxiliar para comprobar que la nave esta dentro de los limites esperados
  private boolean bulletOutOfBounds(PVector pos) {
    if(pos.x > width || pos.x < 0) {
      return true;
    } if(pos.y > height || pos.y < 0) {
      return true;
    }
    return false;
  }
  
}
