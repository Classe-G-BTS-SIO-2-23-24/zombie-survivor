PImage mapImg;
PImage joueurImg;
Joueur myJoueur;

PImage zombieImg;
Zombie myZombie; 
PImage VieImg; 

int collisioncolldown=1000;
PImage projectileImg;
ArrayList<Zombie> zombies = new ArrayList<Zombie>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Zombie> zombiesASupprimer = new ArrayList<Zombie>();
int collisionTime=0; 
int  collisionCooldown=1000; 
//float vieOffsetX = 0;
//float vieOffsetY = -50;
ArrayList<Weapon> weapons;
int currentWeapon = 0;
void setup() {
  hint(ENABLE_KEY_REPEAT);
  mapImg = loadImage("mapZombie.png");
  size(1366, 768, P2D);
  
  projectileImg = loadImage("projectile.png");
  joueurImg = loadImage("spriteJoueur.png");
  myJoueur = new Joueur(20, height/2-joueurImg.height/2, 10, 10, 100, joueurImg, 0, projectiles, projectileImg);
  
  zombieImg= loadImage("zombie.png");
      for(int i = 0; i < 5; i++) { 
    myZombie = new Zombie(random(width), random(height), 1, 0, 100, zombieImg); 
    zombies.add(myZombie); 
  }
  VieImg = loadImage("vie.png");
  
  weapons = new ArrayList<Weapon>();
  weapons.add(new Weapon(13,15,3.5));//Glock_19
  weapons.add(new Weapon(20,8,3));//Ruger_P345
}

void draw() {
  image(mapImg, 0, 0);
  
  for (Zombie zombie : zombies) {   
    zombie.deplacer(myJoueur.xPos, myJoueur.yPos);
    zombie.afficher(); 
    zombie.verifierMort();
    // image(VieImg, zombie.xPos - VieImg.width/2, zombie.yPos - zombieImg.height - VieImg.height);
    
    if (myJoueur.xPos < zombie.xPos + zombieImg.width/2 &&
        myJoueur.xPos + joueurImg.width/2 > zombie.xPos &&
        myJoueur.yPos < zombie.yPos + zombieImg.height/2 &&
        myJoueur.yPos + joueurImg.height/2 > zombie.yPos) {
        println("Collision");
    }

    for (Projectile p : projectiles) {
        if (p.xPos < zombie.xPos + zombieImg.width/2 &&
            p.xPos + p.img.width > zombie.xPos &&
            p.yPos < zombie.yPos + zombieImg.height/2 &&
            p.yPos + p.img.height > zombie.yPos) {
            println("Collision projectile-zombie");
        }
    }

    if (millis() - collisionTime > collisionCooldown) {
        println("Collision avec un zombie");
        collisionTime = millis(); 
    }
}
  
    myZombie.Angle = atan2(myJoueur.yPos - myZombie.yPos, myJoueur.xPos - myZombie.xPos);
  pushMatrix();
  translate(myZombie.xPos, myZombie.yPos);
  rotate(myZombie.Angle);
  image(myZombie.img, -myZombie.img.width/2, -myZombie.img.height/2);
  popMatrix();
  
  
  myJoueur.angle = atan2(mouseY - myJoueur.yPos, mouseX - myJoueur.xPos);
  pushMatrix();
  translate(myJoueur.xPos, myJoueur.yPos);
  rotate(myJoueur.angle);
  // imageMode(CENTER); bug image ne pas utiliser
  image(myJoueur.img, -myJoueur.img.width/2, -myJoueur.img.height/2);
  popMatrix();
  
   
   
    
    for (int i = projectiles.size() - 1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.update();
    p.affichage();
    
    p.verifCollisionZombie(myZombie);
    
    if (p.toucheZombie) {
        projectiles.remove(i);
        p.hitZombie(myZombie, weapons.get(currentWeapon).damage);
    }
}
  
  for (Zombie zombie : zombiesASupprimer) {
    zombies.remove(zombie);
   }
  zombiesASupprimer.clear();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    myJoueur.tirer();
  }
  if (mouseButton == RIGHT) {
    if (currentWeapon>weapons.size()){
      currentWeapon=currentWeapon+1;
    } else { currentWeapon=currentWeapon+0; }
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
