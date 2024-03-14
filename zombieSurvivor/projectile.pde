class Projectile {
  float xPos;
  float yPos;
  float speed;
  PImage img;
  
  Projectile(float xProjectilePos, float yProjectilePos, float projectileSpeed, PImage projectileImage){
    this.xPos = xProjectilePos;
    this.yPos = yProjectilePos;
    this.speed = projectileSpeed;
    this.img = projectileImage;
  }
}
