PImage mapImg;


void setup() {
  mapImg = loadImage("mapZombie.png");
  size(1366,768,P2D);
}

void draw(){
  image(mapImg,0,0);
}
