PImage mapImg;


void setup() {
  mapImg = loadImage("mapZombie.png");
  size(1200,600,P2D);
}

void draw(){
  image(mapImg,0,0);
}
