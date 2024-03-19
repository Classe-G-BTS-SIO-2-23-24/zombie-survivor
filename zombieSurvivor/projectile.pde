class Projectile {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float angle;
  PImage img;
  
  Projectile(float xProjectilePos, float yProjectilePos, float xSpeed, float ySpeed, float projectileAngle, PImage projectileImage){
    this.xSpeed = cos(angle);
    this.ySpeed = sin(angle);
    this.xPos = xProjectilePos;
    this.yPos = yProjectilePos;
    this.angle = projectileAngle;
    this.img = projectileImage;
  }
}
