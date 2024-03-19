class Projectile {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  PImage img;
  
  Projectile(float xProjectilePos, float yProjectilePos, float projectileAngle, PImage projectileImage){
    this.xSpeed = cos(projectileAngle);
    this.ySpeed = sin(projectileAngle);
    this.xPos = xProjectilePos;
    this.yPos = yProjectilePos;
    this.img = projectileImage;
  }
}
