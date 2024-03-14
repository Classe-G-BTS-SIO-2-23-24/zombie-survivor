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
}
