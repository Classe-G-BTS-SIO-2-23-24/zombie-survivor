class Joueur {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  int vie;
  PImage img;
  float angle;
  ArrayList<Projectile> projectiles;
  PImage projectileImg;
  int score;

  Joueur(float xJoueurPos, float yJoueurPos, float xJoueurSpeed, float yJoueurSpeed, int vieJoueur, PImage joueurImage, float angle, ArrayList<Projectile> projectiles, PImage projectileImg) {
    this.xPos = xJoueurPos;
    this.yPos = yJoueurPos;
    this.xSpeed = xJoueurSpeed;
    this.ySpeed = yJoueurSpeed;
    this.vie = vieJoueur;
    this.img = joueurImage;
    this.angle = 0;
    this.projectiles = projectiles;
    this.projectileImg = projectileImg;
    this.score = 0;
  }

  void tirer(float projectileSpeed) {
    float xSpeed = projectileSpeed * cos(angle);
    float ySpeed = projectileSpeed * sin(angle);

    Projectile newProjectile = new Projectile(xPos, yPos, xSpeed, ySpeed, angle, projectileImg);

    projectiles.add(newProjectile);
  }
}
