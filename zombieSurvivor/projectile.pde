class Projectile {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float angle;
  PImage img;
  
  Projectile(float xProjectilePos, float yProjectilePos, float xSpeed, float ySpeed, float projectileAngle, PImage projectileImage){
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.xPos = xProjectilePos;
    this.yPos = yProjectilePos;
    this.angle = projectileAngle;
    this.img = projectileImage;
  }
}
