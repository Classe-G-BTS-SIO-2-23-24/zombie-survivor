class Projectile {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float angle;
  PImage img;
  
  Projectile(float xProjectilePos, float yProjectilePos, float xSpeedCos, float ySpeedSin, float projectileAngle, PImage projectileImage){
    this.xSpeed = xSpeedCos;
    this.ySpeed = ySpeedSin;
    this.xPos = xProjectilePos;
    this.yPos = yProjectilePos;
    this.angle = projectileAngle;
    this.img = projectileImage;
  }
}
