class Projectile {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float angle;
  PImage img;
  boolean toucheZombie = false;

  Projectile(float xProjectilePos, float yProjectilePos, float xSpeedCos, float ySpeedSin, float projectileAngle, PImage projectileImage) {
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

  void hitZombie(Zombie zombie, int WeaponDamage) {
    zombie.vie=zombie.vie-WeaponDamage;
  }

  void verifCollisionZombie(Zombie zombie) {
    if (xPos < zombie.xPos + zombie.img.width &&
      xPos + img.width > zombie.xPos &&
      yPos < zombie.yPos + zombie.img.height &&
      yPos + img.height > zombie.yPos) {
      toucheZombie = true;
      println("Collision projectile-zombie");
      myJoueur.score += 10;
    }
  }
}
