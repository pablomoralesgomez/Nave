class DrawBullet {
  
  private ArrayList<Bullet>  bullets;
  
  public DrawBullet(ArrayList<Bullet> bullets) {
    this.bullets = bullets;
  }

  private void dibuja() {
    for(Bullet bullet :bullets) {
        
      PVector pos = bullet.getPos();
      float radius = bullet.getRadius();
      
      ellipse(pos.x, pos.y, radius, radius);
    }
  }
}
