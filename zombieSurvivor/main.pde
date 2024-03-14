PImage mapImg;

PImage joueurImg;
Joueur myJoueur;

void setup() {
  hint(ENABLE_KEY_REPEAT);
  mapImg = loadImage("mapZombie.png");
  size(1366,768,P2D);
  
  joueurImg = loadImage("spriteJoueur.png");
  myJoueur = new Joueur(20,height/2-joueurImg.height/2,50,50,100,joueurImg);
}

void draw(){
  image(mapImg,0,0);
  
  image(myJoueur.img,myJoueur.xPos,myJoueur.yPos);
}

void keyPressed() {
  if (key == CODED) {
    if(keyCode == RIGHT) {
      myJoueur.xPos += myJoueur.xSpeed;
    }
    if(keyCode == LEFT) {
      myJoueur.xPos -= myJoueur.xSpeed;
    }
    if(keyCode == UP) {
      myJoueur.yPos -= myJoueur.ySpeed;
    
  }
  if(keyCode == DOWN) {
      myJoueur.yPos += myJoueur.ySpeed;
    }
  }
  if (myJoueur.xPos < 0) myJoueur.xPos = 0;
  if (myJoueur.xPos > width-myJoueur.img.width) myJoueur.xPos = width-myJoueur.img.width;
  if (myJoueur.yPos < 0) myJoueur.yPos = 0;
  if (myJoueur.yPos > height-myJoueur.img.height) myJoueur.yPos = height-myJoueur.img.height;
}
