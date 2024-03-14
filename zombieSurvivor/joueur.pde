class Joueur {
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  int vie;
  PImage img;
  //Atouts[] atouts;
  //Arme arme;
  
  Joueur(float xJoueurPos, float yJoueurPos, float xJoueurSpeed, float yJoueurSpeed, int vieJoueur, PImage joueurImage) {
    this.xPos = xJoueurPos;
    this.yPos = yJoueurPos;
    this.xSpeed = xJoueurSpeed;
    this.ySpeed = yJoueurSpeed;
    this.vie = vieJoueur;
    this.img = joueurImage;
  }
}
