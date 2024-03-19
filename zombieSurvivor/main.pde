PImage mapImg;

PImage joueurImg;
Joueur myJoueur;

PImage zombieImg;
Zombie[] myZombies; // Définir un tableau de zombies

void setup() {
  hint(ENABLE_KEY_REPEAT);
  mapImg = loadImage("mapZombie.png");
  size(1366, 768, P2D);

  joueurImg = loadImage("spriteJoueur.png");
  myJoueur = new Joueur(20, height/2-joueurImg.height/2, 50, 50, 100, joueurImg, 0);
  
  zombieImg= loadImage("zombie.png");
  myZombies = new Zombie[10]; // Initialiser le tableau avec le nombre de zombies souhaité
  for(int i = 0; i < myZombies.length; i++) {
    myZombies[i] = new Zombie(width - zombieImg.width, (float)(height/2 - zombieImg.height/2), 3, 0, 100, zombieImg);
  }
}

void draw() {
  image(mapImg, 0, 0);
  myJoueur.angle = atan2(mouseY - myJoueur.yPos, mouseX - myJoueur.xPos);
  pushMatrix();
  translate(myJoueur.xPos, myJoueur.yPos);
  rotate(myJoueur.angle);
  // imageMode(CENTER); bug image ne pas utiliser
  image(myJoueur.img, -33.5, -25);
  popMatrix();
  
 for(int i=0; i<myZombies.length;i++){
    myZombies[i].xPos += cos(radians(myZombies[i].Angle))*myZombies[i].xSpeed;
    myZombies[i].yPos += sin(radians(myZombies[i].Angle))*myZombies[i].xSpeed;
    image(zombieImg, myZombies[i].xPos, myZombies[i].yPos); // Dessiner chaque zombie
  }   
}
  
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      myJoueur.xPos += myJoueur.xSpeed;
    }
    if (keyCode == LEFT) {
      myJoueur.xPos -= myJoueur.xSpeed;
    }
    if (keyCode == UP) {
      myJoueur.yPos -= myJoueur.ySpeed;
    }
    if (keyCode == DOWN) {
      myJoueur.yPos += myJoueur.ySpeed;
    }
  }
  if (myJoueur.xPos < 0) myJoueur.xPos = 0;
  if (myJoueur.xPos > width-myJoueur.img.width) myJoueur.xPos = width-myJoueur.img.width;
  if (myJoueur.yPos < 0) myJoueur.yPos = 0;
  if (myJoueur.yPos > height-myJoueur.img.height) myJoueur.yPos = height-myJoueur.img.height;
}
