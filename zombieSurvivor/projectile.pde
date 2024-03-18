class Projectile {
  float xPos;
  float yPos;
  float speed;
  float angle;
  PImage img;
  
  Projectile(float xProjectilePos, float yProjectilePos, float projectileSpeed, float projectileAngle, PImage projectileImage){
    this.xPos = xProjectilePos;
    this.yPos = yProjectilePos;
    this.speed = projectileSpeed;
    this.angle = projectileAngle;
    this.img = projectileImage;
  }
}
