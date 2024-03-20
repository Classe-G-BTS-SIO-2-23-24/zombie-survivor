class Projectile {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float angle;
  PImage img;
  boolean toucheZombie = false;
  
  Projectile(float xProjectilePos, float yProjectilePos, float xSpeedCos, float ySpeedSin, float projectileAngle, PImage projectileImage){
    this.xSpeed = xSpeedCos;
    this.ySpeed = ySpeedSin;
    this.xPos = xProjectilePos;
    this.yPos = yProjectilePos;
    this.angle = projectileAngle;
    this.img = projectileImage;
  }
  
  void update() {
  xPos += xSpeed;
  yPos += ySpeed;
  }

  void affichage() {
  pushMatrix();
  translate(xPos, yPos);
  rotate(angle);
  image(img, 11, 11);
  popMatrix();
  }
  
  void verifCollisionZombie(Zombie zombie) {
    if (!toucheZombie && xPos + img.width/2 > zombie.xPos - zombie.img.width/2 &&
        xPos - img.width/2 < zombie.xPos + zombie.img.width/2 &&
        yPos + img.height/2 > zombie.yPos - zombie.img.height/2 &&
        yPos - img.height/2 < zombie.yPos + zombie.img.height/2) {
      toucheZombie = true;
    println("Collision projectile-zombie");
    }
  }
}
