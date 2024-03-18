class Zombie{
    float xPos; 
    float yPos; 
    float xSpeed;
    float Angle ; 
    int vie ; 
    PImage img;
    

    Zombie(float xZombiePos, float  yZombiePos , float Zombieangle, int Zombievie, 
      float ZombieSpeed,  PImage ZombieImage) {
        this.xPos = xZombiePos;
        this.yPos = yZombiePos;
        this.xSpeed= ZombieSpeed;
        this.Angle=Zombieangle; 
        this.vie=Zombievie;
        this.img = ZombieImage;

    } 
} 
