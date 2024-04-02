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
int collisionCooldown=1000;
ArrayList<Weapon> weapons;
int currentWeapon = 0;

boolean ecranDeLancement = true;
int clickTime = 0;
boolean reload = false;

void setup() {
  hint(ENABLE_KEY_REPEAT);
  mapImg = loadImage("mapZombie.png");
  size(1366, 768, P2D);

  projectileImg = loadImage("projectile.png");
  joueurImg = loadImage("spriteJoueur.png");
  myJoueur = new Joueur(20, height/2-joueurImg.height/2, 10, 10, 100, joueurImg, 0, projectiles, projectileImg);

  zombieImg= loadImage("zombie.png");
  for (int i = 0; i < random(10)+1; i++) {
    myZombie = new Zombie(random(width), random(height), 1, 0, 100, zombieImg);
    zombies.add(myZombie);
  }
  //zombies.add(new Zombie(random(width), random(height), 1, 0, 100, zombieImg));
  VieImg = loadImage("vie.png");

  weapons = new ArrayList<Weapon>();
  weapons.add(new Weapon("Glock 19", 13, 15, 15, 3.5));
  weapons.add(new Weapon("Ruger P345", 20, 8, 8, 3));
  weapons.add(new Weapon("Lee–Enfield", 70, 5, 5, 1));
}

void draw() {
  if (ecranDeLancement) {
    ecranLancement();
  } else {
    image(mapImg, 0, 0);

    for (Zombie zombie : zombiesASupprimer) {
      zombies.remove(zombie);
    }
    zombiesASupprimer.clear();

    ArrayList<Projectile> projectilesASupprimer = new ArrayList<Projectile>();
    for (Projectile p : projectiles) {
      p.update();
      p.affichage();
      for (Zombie zombie : zombies) {
        p.verifCollisionZombie(zombie);
        if (p.toucheZombie) {
          projectilesASupprimer.add(p);
          p.hitZombie(zombie, weapons.get(currentWeapon).damage);
          break;
        }
      }
    }
    projectiles.removeAll(projectilesASupprimer);

    for (Zombie zombie : zombies) {
      zombie.deplacer(myJoueur.xPos, myJoueur.yPos);
      zombie.Angle = atan2(myJoueur.yPos - zombie.yPos, myJoueur.xPos - zombie.xPos);
      zombie.afficher();
      //zombie.Angle = atan2(myJoueur.yPos - zombie.yPos, myJoueur.xPos - zombie.xPos);
    //pushMatrix();
    //translate(zombie.xPos, zombie.yPos);
    //rotate(zombie.Angle);
    //image(zombie.img, - zombie.img.width/2, -zombie.img.height/2);
    //popMatrix();
      zombie.verifierMort();
        

      if (myJoueur.xPos < zombie.xPos + zombieImg.width/2 &&
        myJoueur.xPos + joueurImg.width/2 > zombie.xPos &&
        myJoueur.yPos < zombie.yPos + zombieImg.height/2 &&
        myJoueur.yPos + joueurImg.height/2 > zombie.yPos) {
          if (millis()-collisionTime>collisioncolldown)
                println("Collision");
                collisionTime=millis();
          }
      }

    myJoueur.angle = atan2(mouseY - myJoueur.yPos, mouseX - myJoueur.xPos);
    pushMatrix();
    translate(myJoueur.xPos, myJoueur.yPos);
    rotate(myJoueur.angle);
    image(myJoueur.img, -myJoueur.img.width/2, -myJoueur.img.height/2);
    popMatrix();

    for (int i = projectiles.size() - 1; i >= 0; i--) {
      Projectile p = projectiles.get(i);
      p.update();
      p.affichage();
      p.verifCollisionZombie(myZombie);
      if (p.toucheZombie) {
        projectiles.remove(i);
      }
    }

    fill(255);
    textSize(20);
    text("Score : " + myJoueur.score, 55, height - 40);

    fill(255);
    textSize(20);
    text(weapons.get(currentWeapon).name+" "+weapons.get(currentWeapon).ammo+"/"+weapons.get(currentWeapon).ammo2, 70, height -80);
    
    if(reload){
      if(clickTime + weapons.get(currentWeapon).reloadTime*1000 < millis()){
        if(weapons.get(currentWeapon).name.equals("Lee–Enfield") && weapons.get(currentWeapon).ammo!=weapons.get(currentWeapon).ammo2){
          reload = false;
          weapons.get(currentWeapon).ammo+= 1;
        } else {
        reload = false;
        weapons.get(currentWeapon).ammo = weapons.get(currentWeapon).ammo2; }
      }
    }
  }
}

void ecranLancement() {
  background(200);

  textAlign(CENTER, TOP);
  textSize(40);
  fill(0);
  text("Zombie Survivor", width/2, 50);

  rectMode(CENTER);
  fill(100);
  rect(width/2, height/2, 200, 50);
  fill(255);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Commencer", width/2, height/2);
}

void mousePressed() {
  if (ecranDeLancement) {
    if (mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
      ecranDeLancement = false;
    }
  } else {
    if (mouseButton == LEFT) {
      if (weapons.get(currentWeapon).ammo == 0) {
        println("No ammo.");
      } else {
        weapons.get(currentWeapon).ammo--;
        myJoueur.tirer(15);
      }
    }
    if (mouseButton == RIGHT) {
      println(currentWeapon);
      println(weapons.size());
      if (currentWeapon == weapons.size()-1) {
        currentWeapon = 0;
      } else {
        currentWeapon++;
      }
    }
  }
}

void keyPressed() {
  if (key == 'r') {
    clickTime = millis();
    reload = true;
  }
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
