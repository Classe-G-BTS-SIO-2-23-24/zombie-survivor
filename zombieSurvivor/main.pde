PImage mapImg;

PImage joueurImg;
Joueur myJoueur;

PImage zombieImg;
Zombie myZombie; 

PImage projectileImg;

ArrayList<Projectile> projectiles = new ArrayList<Projectile>();

void setup() {
  hint(ENABLE_KEY_REPEAT);
  mapImg = loadImage("mapZombie.png");
  size(1366, 768, P2D);
  
  projectileImg = loadImage("projectile.png");
  joueurImg = loadImage("spriteJoueur.png");
  myJoueur = new Joueur(20, height/2-joueurImg.height/2, 10, 10, 100, joueurImg, 0, projectiles, projectileImg);
  
  zombieImg= loadImage("zombie.png");
  myZombie = new Zombie(width/2, (float)(height/2 - zombieImg.height/2), 3, 0, 100, zombieImg);


}

void draw() {
  image(mapImg, 0, 0);
  myJoueur.angle = atan2(mouseY - myJoueur.yPos, mouseX - myJoueur.xPos);
  pushMatrix();
  translate(myJoueur.xPos, myJoueur.yPos);
  rotate(myJoueur.angle);
  // imageMode(CENTER); bug image ne pas utiliser
  image(myJoueur.img, -myJoueur.img.width/2, -myJoueur.img.height/2);
  popMatrix();
  
   image(zombieImg, myZombie.xPos, myZombie.yPos);
   
   if (myJoueur.xPos < myZombie.xPos + zombieImg.width/2 &&
    myJoueur.xPos + joueurImg.width/2 > myZombie.xPos &&
    myJoueur.yPos < myZombie.yPos + zombieImg.height/2 &&
    myJoueur.yPos + joueurImg.height/2 > myZombie.yPos) {
    println("Collision");
    }
    
    for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.update();
    p.affichage();
    
    if (p.xPos < myZombie.xPos + zombieImg.width/2 &&
      p.xPos + p.img.width > myZombie.xPos &&
      p.yPos < myZombie.yPos + zombieImg.height/2 &&
      p.yPos + p.img.height > myZombie.yPos) {
    println("Collision projectile-zombie");
    }
  }
  
  for (int i = projectiles.size() - 1; i >= 0; i--) {
  Projectile p = projectiles.get(i);
  p.update();
  p.affichage();
  
  p.verifCollisionZombie(myZombie);
  
  if (p.toucheZombie) {
    projectiles.remove(i);
    p.hitZombie(myZombie);
  }
}
}

void mousePressed() {
  if (mouseButton == LEFT) {
    myJoueur.tirer();
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
