class Joueur {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  int vie;
  int vitesse;
  PImage img;
  //Atouts[] atouts;
  //Arme arme;
  
  Joueur(float xJoueurPos, float yJoueurPos, float xJoueurSpeed, float yJoueurSpeed, PImage joueurImage) {
    this.xPos = xJoueurPos;
    this.yPos = yJoueurPos;
    this.xSpeed = xJoueurSpeed;
    this.ySpeed = yJoueurSpeed;
    this.img = joueurImage;
  }
}
